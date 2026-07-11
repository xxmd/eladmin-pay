package me.zhengjie.modules.pay.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.github.xxmd.epay.api.EPayApiV1;
import io.github.xxmd.epay.entity.enums.PayMethod;
import io.github.xxmd.epay.entity.param.RedirectPayParam;
import lombok.extern.slf4j.Slf4j;
import me.zhengjie.modules.pay.entity.PayMerchant;
import me.zhengjie.modules.pay.entity.PayOrder;
import me.zhengjie.modules.pay.entity.enums.PayStatus;
import me.zhengjie.modules.pay.entity.query.PayOrderQueryCriteria;
import me.zhengjie.modules.pay.repository.PayMerchantRepository;
import me.zhengjie.modules.pay.repository.PayOrderRepository;
import me.zhengjie.modules.pay.service.dto.EPayNotifyParam;
import me.zhengjie.modules.pay.service.dto.PayOrderDto;
import me.zhengjie.modules.pay.service.mapstruct.PayOrderMapper;
import me.zhengjie.utils.PageResult;
import me.zhengjie.utils.PageUtil;
import me.zhengjie.utils.QueryHelp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import java.util.Optional;
import java.util.Set;
import java.util.TreeMap;
import java.util.concurrent.TimeUnit;

@Slf4j
@Service
@Transactional
public class PayOrderService {
    @Value("${epay.notifyUrl}")
    private String notifyUrl;
    @Autowired
    private PayOrderRepository repository;
    @Autowired
    private PayOrderMapper mapper;
    @Autowired
    private PayMerchantRepository merchantRepository;
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private ObjectMapper objectMapper;

    public void create(PayOrder entity) throws Exception {
        String orderNumber = generateOrderNumber();
        entity.setOrderNumber(orderNumber);
        Optional<PayMerchant> merchantOptional = merchantRepository.findById(entity.getPayMerchant().getId());
        merchantOptional.ifPresent(entity::setPayMerchant);
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

    public void update(PayOrder entity) {
        repository.save(entity);
    }

    public PageResult<PayOrderDto> read(PayOrderQueryCriteria criteria, Pageable pageable) throws Exception {
        Page<PayOrder> page = repository.findAll((root, criteriaQuery, criteriaBuilder) ->
                QueryHelp.getPredicate(root, criteria, criteriaBuilder), pageable);
        return PageUtil.toPage(page.map(mapper::toDto));
    }

    public EPayApiV1 buildEPayApi(PayOrder entity) {
        PayMerchant merchant = entity.getPayMerchant();
        String pid = String.valueOf(merchant.getMerchantId());
        String md5SecretKey = merchant.getMd5SecretKey();
        String domainName = merchant.getPlatform().getDomainName();
        return new EPayApiV1(pid, md5SecretKey, domainName);
    }

    public RedirectPayParam buildRedirectPayParam(PayOrder entity) {
        RedirectPayParam requestParam = new RedirectPayParam();
        requestParam.setPayMethod(PayMethod.valueOfIgnoreCase(entity.getPayMethod().getValue()));
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
            Optional<PayOrder> orderOptional = repository.findByOrderNumber(orderNumber);
            if (orderOptional.isPresent()) {
                TreeMap<String, Object> treeMap = parseReturnParam(notifyParam);
                PayOrder payOrder = orderOptional.get();
                if (payOrder.getPayStatus() == PayStatus.PAID) {
                    return true;
                }
                EPayApiV1 ePayApi = buildEPayApi(payOrder);
                String signature = ePayApi.signParamMap(treeMap);
                if (signature.equals(notifyParam.getSign())) {
                    payOrder.setPayStatus(PayStatus.PAID);
                    payOrder.setPayTime(new Timestamp(System.currentTimeMillis()));
                    payOrder.setNotifyParam(objectMapper.writeValueAsString(notifyParam));
                    repository.save(payOrder);
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
