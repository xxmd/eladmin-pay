package me.zhengjie.modules.pay.repository;

import me.zhengjie.modules.pay.entity.PayPlatform;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface PayPlatformRepository extends JpaRepository<PayPlatform, Long>, JpaSpecificationExecutor<PayPlatform> {
}
