package me.zhengjie.modules.pay.entity;

import lombok.Getter;
import lombok.Setter;
import me.zhengjie.base.BaseEntity;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@Entity
public class PayMethod extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String label;

    private String value;

    private String remark;

    @ManyToMany(mappedBy = "payMethodList")
    private List<PayMerchant> payMerchantList;
}
