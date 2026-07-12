package me.zhengjie.modules.pay.controller;

import me.zhengjie.modules.pay.entity.Method;
import me.zhengjie.modules.pay.service.PayMethodService;
import me.zhengjie.modules.pay.service.dto.MethodDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("/api/pay/method")
public class MethodController {
    @Autowired
    private PayMethodService service;

    @PostMapping
    @PreAuthorize("@el.check('pay:method:create')")
    public void create(@Validated @RequestBody Method entity) {
        service.create(entity);
    }

    @DeleteMapping
    @PreAuthorize("@el.check('pay:method:delete')")
    public void delete(@RequestBody Set<Long> idSet) {
        service.delete(idSet);
    }

    @PutMapping
    @PreAuthorize("@el.check('pay:method:update')")
    public void update(@Validated @RequestBody Method entity) {
        service.update(entity);
    }

    @GetMapping
    @PreAuthorize("@el.check('pay:method:read')")
    public Page<Method> read(Pageable pageable) {
        return service.read(pageable);
    }

    @GetMapping("/findAll")
    @PreAuthorize("@el.check('pay:method:read')")
    public List<MethodDto> findAll() {
        return service.findAll();
    }
}
