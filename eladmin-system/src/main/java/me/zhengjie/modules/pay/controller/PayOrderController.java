package me.zhengjie.modules.pay.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import me.zhengjie.annotation.rest.AnonymousGetMapping;
import me.zhengjie.modules.pay.entity.PayOrder;
import me.zhengjie.modules.pay.entity.query.PayOrderQueryCriteria;
import me.zhengjie.modules.pay.service.PayOrderService;
import me.zhengjie.modules.pay.service.dto.EPayNotifyParam;
import me.zhengjie.modules.pay.service.dto.PayOrderDto;
import me.zhengjie.utils.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.Set;

@Slf4j
@RestController
@RequestMapping("/api/pay/order")
public class PayOrderController {
    @Autowired
    private PayOrderService service;
    @Autowired
    private ObjectMapper objectMapper;

    @PostMapping
    @PreAuthorize("@el.check('pay:order:create')")
    public void create(@Validated @RequestBody PayOrder entity) throws Exception {
        service.create(entity);
    }

    @DeleteMapping
    @PreAuthorize("@el.check('pay:order:delete')")
    public void delete(@RequestBody Set<Long> idSet) {
        service.delete(idSet);
    }

    @PutMapping
    @PreAuthorize("@el.check('pay:order:update')")
    public void update(@Validated @RequestBody PayOrder entity) {
        service.update(entity);
    }

    @GetMapping
    @PreAuthorize("@el.check('pay:order:read')")
    public PageResult<PayOrderDto> read(PayOrderQueryCriteria criteria, Pageable pageable) throws Exception {
        return service.read(criteria, pageable);
    }

    @AnonymousGetMapping("/notify")
    public String notify(@RequestParam Map<String, String> params) {
        try {
            log.info("notify params： {}", params);
            EPayNotifyParam notifyParam = objectMapper.convertValue(params, EPayNotifyParam.class);
            boolean valid = service.isNotifyParamValid(notifyParam);
            if (valid) {
                return "success";
            }
        } catch (Exception e) {
            log.error("处理订单通知异常", e);
        }
        return "failure";
    }
}
