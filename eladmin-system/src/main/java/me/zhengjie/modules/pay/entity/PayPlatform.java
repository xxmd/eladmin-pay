package me.zhengjie.modules.pay.entity;

import lombok.Data;
import me.zhengjie.base.BaseEntity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Data
@Entity
public class PayPlatform extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String endpoint;

    private String website;

    private String contact;

    private String remark;
}
