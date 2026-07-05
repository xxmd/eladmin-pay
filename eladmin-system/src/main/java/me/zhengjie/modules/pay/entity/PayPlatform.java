package me.zhengjie.modules.pay.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import me.zhengjie.base.BaseEntity;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
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

    @OneToMany(mappedBy = "platform")
    private List<PayMerchant> merchantList;
}
