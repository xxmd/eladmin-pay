package me.zhengjie.modules.pay.repository;

import me.zhengjie.modules.pay.entity.PayMethod;
import me.zhengjie.modules.pay.entity.PayOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.Optional;

public interface PayMethodRepository extends JpaRepository<PayMethod, Long>, JpaSpecificationExecutor<PayMethod> {
}
