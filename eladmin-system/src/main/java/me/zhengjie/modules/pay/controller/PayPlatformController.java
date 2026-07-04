package me.zhengjie.modules.pay.controller;

import me.zhengjie.modules.pay.entity.PayPlatform;
import me.zhengjie.modules.pay.entity.query.PayPlatformQueryCriteria;
import me.zhengjie.modules.pay.service.PayPlatformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Set;

@RestController
@RequestMapping("/api/pay/platform")
public class PayPlatformController {
    @Autowired
    private PayPlatformService service;

    @PutMapping
    @PreAuthorize("@el.check('pay:platform:add')")
    public void create(@Validated @RequestBody PayPlatform entity) {
        service.create(entity);
    }

    @DeleteMapping
    @PreAuthorize("@el.check('pay:platform:del')")
    public void delete(Set<Long> idSet) {
        service.delete(idSet);
    }

    @PostMapping
    @PreAuthorize("@el.check('pay:platform:edit')")
    public void update(@Validated @RequestBody PayPlatform entity) {
        service.update(entity);
    }

    @GetMapping
    @PreAuthorize("@el.check('pay:platform:list')")
    public Page<PayPlatform> query(PayPlatformQueryCriteria criteria, Pageable pageable) {
        return service.query(criteria, pageable);
    }
}
