package me.zhengjie.modules.pay.controller;

import me.zhengjie.modules.pay.entity.PayMethod;
import me.zhengjie.modules.pay.entity.query.PayPlatformQueryCriteria;
import me.zhengjie.modules.pay.service.PayMethodService;
import me.zhengjie.modules.pay.service.PayPlatformService;
import me.zhengjie.modules.pay.service.dto.PayMethodDto;
import me.zhengjie.modules.pay.service.dto.PayMethodSmallDto;
import me.zhengjie.modules.pay.service.dto.PayPlatformDto;
import me.zhengjie.utils.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("/api/pay/method")
public class PayMethodController {
    @Autowired
    private PayMethodService service;

    @PutMapping
    @PreAuthorize("@el.check('pay:method:create')")
    public void create(@Validated @RequestBody PayMethod entity) {
        service.create(entity);
    }

    @DeleteMapping
    @PreAuthorize("@el.check('pay:method:delete')")
    public void delete(@RequestBody Set<Long> idSet) {
        service.delete(idSet);
    }

    @PostMapping
    @PreAuthorize("@el.check('pay:method:update')")
    public void update(@Validated @RequestBody PayMethod entity) {
        service.update(entity);
    }

    @GetMapping
    @PreAuthorize("@el.check('pay:method:read')")
    public PageResult<PayMethodDto> read(Pageable pageable) {
        return service.read(pageable);
    }

    @GetMapping("/findAll")
    @PreAuthorize("@el.check('pay:method:read')")
    public List<PayMethodSmallDto> findAll() {
        return service.findAll();
    }
}
