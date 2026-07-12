package me.zhengjie.modules.pay.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.github.xxmd.epay.api.EPayApiV1;
import io.github.xxmd.epay.entity.enums.PayMethod;
import io.github.xxmd.epay.entity.param.RedirectPayParam;
import lombok.extern.slf4j.Slf4j;
import me.zhengjie.modules.pay.entity.EPayNotifyParam;
import me.zhengjie.modules.pay.entity.Merchant;
import me.zhengjie.modules.pay.entity.Method;
import me.zhengjie.modules.pay.entity.Order;
import me.zhengjie.modules.pay.entity.enums.PayStatus;
import me.zhengjie.modules.pay.service.query.OrderQueryCriteria;
import me.zhengjie.modules.pay.repository.MerchantRepository;
import me.zhengjie.modules.pay.repository.MethodRepository;
import me.zhengjie.modules.pay.repository.OrderRepository;
import me.zhengjie.utils.QueryHelp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.concurrent.TimeUnit;

@Slf4j
@Service
@Transactional
public class PayOrderService {
    @Value("${epay.notifyUrl}")
    private String notifyUrl;
    @Autowired
    private OrderRepository repository;
    @Autowired
    private MerchantRepository merchantRepository;
    @Autowired
    private MethodRepository methodRepository;
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private ObjectMapper objectMapper;

    public void create(Order entity) throws Exception {
        String orderNumber = generateOrderNumber();
        entity.setOrderNumber(orderNumber);
        Optional<Merchant> merchantOptional = merchantRepository.findById(entity.getMerchant().getId());
        merchantOptional.ifPresent(entity::setMerchant);
        Optional<Method> methodOptional = methodRepository.findById(entity.getMethod().getId());
        methodOptional.ifPresent(entity::setMethod);
        EPayApiV1 ePayApi = buildEPayApi(entity);
        RedirectPayParam redirectPayParam = buildRedirectPayParam(entity);
        String payUrl = ePayApi.pageRedirectPay(redirectPayParam);
        entity.setPayUrl(payUrl);
        repository.save(entity);
    }

    public String generateOrderNumber() {
        String dateStr = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
        String redisKey = "order:seq:" + dateStr.substring(0, 8);
        Long sequence = redisTemplate.opsForValue().increment(redisKey);
        if (sequence != null && sequence == 1) {
            redisTemplate.expire(redisKey, 24, TimeUnit.HOURS);
        }
        String seqStr = String.format("%06d", sequence);
        return dateStr + seqStr;
    }

    public void delete(Set<Long> idSet) {
        repository.deleteAllById(idSet);
    }

    public void update(Order entity) {
        repository.save(entity);
    }

    public Page<Order> read(OrderQueryCriteria criteria, Pageable pageable) throws Exception {
        return repository.findAll((root, criteriaQuery, criteriaBuilder) ->
                QueryHelp.getPredicate(root, criteria, criteriaBuilder), pageable);
    }

    public EPayApiV1 buildEPayApi(Order entity) {
        Merchant merchant = entity.getMerchant();
        String pid = String.valueOf(merchant.getMerchantId());
        String md5SecretKey = merchant.getMd5SecretKey();
        String domainName = merchant.getPlatform().getDomainName();
        return new EPayApiV1(pid, md5SecretKey, domainName);
    }

    public RedirectPayParam buildRedirectPayParam(Order entity) {
        RedirectPayParam requestParam = new RedirectPayParam();
        requestParam.setPayMethod(PayMethod.valueOf(entity.getMethod().getValue()));
        requestParam.setOutTradeNo(entity.getOrderNumber());
        requestParam.setNotifyUrl(notifyUrl);
        requestParam.setReturnUrl(notifyUrl);
        String name = String.format(Locale.US, "%s×%d", entity.getProductName(), entity.getProductQuantity());
        requestParam.setName(name);
        requestParam.setMoney(entity.getTotalAmount());
        return requestParam;
    }

    public boolean isNotifyParamValid(EPayNotifyParam notifyParam) throws JsonProcessingException {
        if (notifyParam.isValid()) {
            String orderNumber = notifyParam.getOutTradeNo();
            Optional<Order> orderOptional = repository.findByOrderNumber(orderNumber);
            if (orderOptional.isPresent()) {
                TreeMap<String, Object> treeMap = parseReturnParam(notifyParam);
                Order order = orderOptional.get();
                if (order.getPayStatus() == PayStatus.PAID) {
                    return true;
                }
                EPayApiV1 ePayApi = buildEPayApi(order);
                String signature = ePayApi.signParamMap(treeMap);
                if (signature.equals(notifyParam.getSign())) {
                    order.setPayStatus(PayStatus.PAID);
                    order.setPayTime(new Date());
                    order.setNotifyParam(objectMapper.writeValueAsString(notifyParam));
                    repository.save(order);
                    return true;
                }
            }
        } else {
            log.warn("notifyParam invalid: {}", notifyParam);
        }
        return false;
    }

    private TreeMap<String, Object> parseReturnParam(EPayNotifyParam returnParam) {
        TreeMap<String, Object> treeMap = new TreeMap<>();
        treeMap.put("pid", returnParam.getPid());
        treeMap.put("trade_no", returnParam.getTradeNo());
        treeMap.put("out_trade_no", returnParam.getOutTradeNo());
        treeMap.put("type", returnParam.getType());
        treeMap.put("name", returnParam.getName());
        treeMap.put("money", returnParam.getMoney());
        treeMap.put("trade_status", returnParam.getTradeStatus());
        return treeMap;
    }
}
