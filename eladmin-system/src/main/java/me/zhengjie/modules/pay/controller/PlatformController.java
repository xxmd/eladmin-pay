package me.zhengjie.modules.pay.controller;

import me.zhengjie.modules.pay.entity.Platform;
import me.zhengjie.modules.pay.service.query.PlatformQueryCriteria;
import me.zhengjie.modules.pay.service.PayPlatformService;
import me.zhengjie.modules.pay.service.dto.PlatformDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("/api/pay/platform")
public class PlatformController {
    @Autowired
    private PayPlatformService service;

    @PostMapping
    @PreAuthorize("@el.check('pay:platform:create')")
    public void create(@Validated @RequestBody Platform entity) {
        service.create(entity);
    }

    @DeleteMapping
    @PreAuthorize("@el.check('pay:platform:delete')")
    public void delete(@RequestBody Set<Long> idSet) {
        service.delete(idSet);
    }

    @PutMapping
    @PreAuthorize("@el.check('pay:platform:update')")
    public void update(@Validated @RequestBody Platform entity) {
        service.update(entity);
    }

    @GetMapping
    @PreAuthorize("@el.check('pay:platform:read')")
    public Page<Platform> read(PlatformQueryCriteria criteria, Pageable pageable) {
        return service.read(criteria, pageable);
    }

    @GetMapping("/findAll")
    @PreAuthorize("@el.check('pay:platform:read')")
    public List<PlatformDto> findAll() {
        return service.findAll();
    }
}
