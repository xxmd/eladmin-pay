package me.zhengjie.modules.pay.controller;

import me.zhengjie.modules.pay.entity.PayMerchant;
import me.zhengjie.modules.pay.entity.query.PayMerchantQueryCriteria;
import me.zhengjie.modules.pay.service.PayMerchantService;
import me.zhengjie.modules.pay.service.dto.PayMerchantDto;
import me.zhengjie.utils.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
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

    @DeleteMapping
    @PreAuthorize("@el.check('pay:merchant:delete')")
    public void delete(@RequestBody Set<Long> idSet) {
        service.delete(idSet);
    }

    @PostMapping
    @PreAuthorize("@el.check('pay:merchant:update')")
    public void update(@Validated @RequestBody PayMerchant entity) {
        service.update(entity);
    }

    @GetMapping
    @PreAuthorize("@el.check('pay:merchant:read')")
    public PageResult<PayMerchantDto> read(PayMerchantQueryCriteria criteria, Pageable pageable) {
        return service.read(criteria, pageable);
    }

    @GetMapping("/findAll")
    @PreAuthorize("@el.check('pay:merchant:read')")
    public List<PayMerchantDto> findAll() {
        return service.findAll();
    }
}
