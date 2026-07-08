package me.zhengjie.modules.pay.controller;

import me.zhengjie.modules.pay.entity.PayOrder;
import me.zhengjie.modules.pay.entity.query.PayOrderQueryCriteria;
import me.zhengjie.modules.pay.service.PayOrderService;
import me.zhengjie.modules.pay.service.dto.PayOrderDto;
import me.zhengjie.utils.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Set;

@RestController
@RequestMapping("/api/pay/order")
public class PayOrderController {
    @Autowired
    private PayOrderService service;

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
    public PageResult<PayOrderDto> read(PayOrderQueryCriteria criteria, Pageable pageable) {
        return service.read(criteria, pageable);
    }
}
