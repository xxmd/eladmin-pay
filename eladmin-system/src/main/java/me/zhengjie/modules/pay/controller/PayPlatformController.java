package me.zhengjie.modules.pay.controller;

import me.zhengjie.modules.pay.entity.PayPlatform;
import me.zhengjie.modules.pay.entity.query.PayPlatformQueryCriteria;
import me.zhengjie.modules.pay.service.PayPlatformService;
import me.zhengjie.modules.pay.service.dto.PayPlatformDto;
import me.zhengjie.utils.PageResult;
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
    @PreAuthorize("@el.check('pay:platform:create')")
    public void create(@Validated @RequestBody PayPlatform entity) {
        service.create(entity);
    }

    @DeleteMapping
    @PreAuthorize("@el.check('pay:platform:delete')")
    public void delete(@RequestBody Set<Long> idSet) {
        service.delete(idSet);
    }

    @PostMapping
    @PreAuthorize("@el.check('pay:platform:update')")
    public void update(@Validated @RequestBody PayPlatform entity) {
        service.update(entity);
    }

//    @GetMapping
//    @PreAuthorize("@el.check('pay:platform:read')")
//    public PageResult<PayPlatformDto> read(PayPlatformQueryCriteria criteria, Pageable pageable) {
//        return service.read(criteria, pageable);
//    }
    @GetMapping
    @PreAuthorize("@el.check('pay:platform:read')")
    public Page<PayPlatform> read(PayPlatformQueryCriteria criteria, Pageable pageable) {
        return service.read(criteria, pageable);
    }
}
