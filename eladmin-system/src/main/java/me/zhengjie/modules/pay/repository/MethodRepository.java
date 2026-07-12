package me.zhengjie.modules.pay.repository;

import me.zhengjie.modules.pay.entity.Method;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface MethodRepository extends JpaRepository<Method, Long>, JpaSpecificationExecutor<Method> {
}
