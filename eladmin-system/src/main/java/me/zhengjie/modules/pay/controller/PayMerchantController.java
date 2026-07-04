package me.zhengjie.modules.pay.controller;

import me.zhengjie.modules.pay.entity.PayMerchant;
import me.zhengjie.modules.pay.entity.query.PayApiQueryCriteria;
import me.zhengjie.modules.pay.service.PayMerchantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Set;

@RestController
@RequestMapping("/api/pay/merchant")
public class PayMerchantController {
    @Autowired
    private PayMerchantService service;

    @PutMapping
    @PreAuthorize("@el.check('pay:merchant:create')")
    public void create(@Validated @RequestBody PayMerchant entity) {
        service.create(entity);
    }

    @PostMapping
    @PreAuthorize("@el.check('pay:merchant:update')")
    public void update(@Validated @RequestBody PayMerchant entity) {
        service.update(entity);
    }

    @DeleteMapping
    @PreAuthorize("@el.check('pay:merchant:delete')")
    public void delete(Set<Long> idSet) {
        service.delete(idSet);
    }

    @GetMapping
    @PreAuthorize("@el.check('pay:merchant:query')")
    public Page<PayMerchant> read(PayApiQueryCriteria criteria, Pageable pageable) {
        return service.read(criteria, pageable);
    }
}
