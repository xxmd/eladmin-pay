package me.zhengjie.modules.pay.controller;

import me.zhengjie.modules.pay.entity.Merchant;
import me.zhengjie.modules.pay.service.dto.MerchantDto;
import me.zhengjie.modules.pay.service.query.MerchantQueryCriteria;
import me.zhengjie.modules.pay.service.PayMerchantService;
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
public class MerchantController {
    @Autowired
    private PayMerchantService service;

    @PostMapping
    @PreAuthorize("@el.check('pay:merchant:create')")
    public void create(@Validated @RequestBody Merchant entity) {
        service.create(entity);
    }

    @DeleteMapping
    @PreAuthorize("@el.check('pay:merchant:delete')")
    public void delete(@RequestBody Set<Long> idSet) {
        service.delete(idSet);
    }

    @PutMapping
    @PreAuthorize("@el.check('pay:merchant:update')")
    public void update(@Validated @RequestBody Merchant entity) {
        service.update(entity);
    }

    @GetMapping
    @PreAuthorize("@el.check('pay:merchant:read')")
    public Page<Merchant> read(MerchantQueryCriteria criteria, Pageable pageable) {
        return service.read(criteria, pageable);
    }

    @GetMapping("/findAll")
    @PreAuthorize("@el.check('pay:merchant:read')")
    public List<MerchantDto> findAll() {
        return service.findAll();
    }
}
