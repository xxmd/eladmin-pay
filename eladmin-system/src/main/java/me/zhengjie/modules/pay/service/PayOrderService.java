package me.zhengjie.modules.pay.service;

import me.zhengjie.modules.pay.entity.PayMerchant;
import me.zhengjie.modules.pay.entity.PayOrder;
import me.zhengjie.modules.pay.entity.query.PayOrderQueryCriteria;
import me.zhengjie.modules.pay.repository.PayMerchantRepository;
import me.zhengjie.modules.pay.repository.PayOrderRepository;
import me.zhengjie.modules.pay.service.dto.PayOrderDto;
import me.zhengjie.modules.pay.service.mapstruct.PayOrderMapper;
import me.zhengjie.utils.PageResult;
import me.zhengjie.utils.PageUtil;
import me.zhengjie.utils.QueryHelp;
import org.example.api.impl.EPayApi;
import org.example.entity.PayRequestParam;
import org.example.entity.enums.PayType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import java.util.Optional;
import java.util.Set;
import java.util.concurrent.TimeUnit;

@Service
@Transactional
public class PayOrderService {
    @Autowired
    private PayOrderRepository repository;
    @Autowired
    private PayOrderMapper mapper;
    @Autowired
    private PayMerchantRepository merchantRepository;
    @Autowired
    private RedisTemplate redisTemplate;
    @Value("${epay.notifyUrl}")
    private String notifyUrl;
    @Value("${epay.returnUrl}")
    private String returnUrl;

    private static final DateTimeFormatter FORMATTER =
            DateTimeFormatter.ofPattern("yyyyMMddHHmmss");

    public void create(PayOrder entity) throws Exception {
        entity.setOrderNumber(generateOrderNumber());
        repository.save(entity);
        updatePayUrl(entity);
    }

    private void updatePayUrl(PayOrder entity) throws Exception {
        Optional<PayMerchant> merchantOptional = merchantRepository.findById(entity.getMerchant().getId());
        if (merchantOptional.isPresent()) {
            PayMerchant merchant = merchantOptional.get();
            String pid = String.valueOf(merchant.getMerchantId());
            String key = merchant.getMd5SecretKey();
            String hostname = merchant.getPlatform().getHostname();
            EPayApi ePayApi = new EPayApi(pid, key, hostname);
            PayRequestParam requestParam = new PayRequestParam();
            requestParam.setType(PayType.valueOf(entity.getPayMethod().name()));
            requestParam.setOutTradeNo(entity.getOrderNumber());
            requestParam.setNotifyUrl(notifyUrl);
            requestParam.setReturnUrl(returnUrl);
            String name = String.format(Locale.US, "%s×%d", entity.getProductName(), entity.getProductQuantity());
            requestParam.setName(name);
            requestParam.setMoney(entity.getTotalAmount());
            String payUrl = ePayApi.pageRedirectPay(requestParam);
            entity.setPayUrl(payUrl);
            repository.save(entity);
        }
    }

    public String generateOrderNumber() {
        String dateStr = LocalDateTime.now().format(FORMATTER);
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

    public PageResult<PayOrderDto> read(PayOrderQueryCriteria criteria, Pageable pageable) {
        Page<PayOrder> page = repository.findAll((root, criteriaQuery, criteriaBuilder) -> QueryHelp.getPredicate(root, criteria, criteriaBuilder), pageable);
        return PageUtil.toPage(page.map(mapper::toDto));
    }
}
