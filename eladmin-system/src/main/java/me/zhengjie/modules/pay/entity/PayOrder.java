package me.zhengjie.modules.pay.entity;

import lombok.Getter;
import lombok.Setter;
import me.zhengjie.base.BaseEntity;
import me.zhengjie.modules.pay.entity.enums.PayMethod;
import org.example.entity.enums.PayType;

import javax.persistence.*;
import java.math.BigDecimal;

@Getter
@Setter
@Entity
public class PayOrder extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String productName;

    private BigDecimal productPrice;

    private Integer productQuantity;

    @Enumerated(EnumType.STRING)
    private PayMethod payMethod;

    private String payUrl;

    private BigDecimal paidAmount;

    private String orderNumber;

    private String remark;

    @ManyToOne
    @JoinColumn(name = "merchant_id")
    private PayMerchant merchant;

    public BigDecimal getTotalAmount() {
        if (productPrice == null || productQuantity == null) {
            return BigDecimal.ZERO;
        }
        return productPrice.multiply(BigDecimal.valueOf(productQuantity));
    }
}
