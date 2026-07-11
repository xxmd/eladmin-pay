package me.zhengjie.modules.pay.entity;

import lombok.Getter;
import lombok.Setter;
import me.zhengjie.base.BaseEntity;
import me.zhengjie.modules.pay.entity.enums.PayStatus;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Timestamp;

@Getter
@Setter
@Entity
public class PayOrder extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String orderNumber;

    private String productName;

    private BigDecimal productPrice;

    private Integer productQuantity;

    private String payUrl;

    @Enumerated(EnumType.STRING)
    private PayStatus payStatus = PayStatus.UNPAID;

    private Timestamp payTime;

    private String notifyParam;

    private String remark;

    @ManyToOne
    @JoinColumn(name = "merchant_id")
    private PayMerchant payMerchant;

    @ManyToOne
    @JoinColumn(name = "method_id")
    private PayMethod payMethod;

    public BigDecimal getTotalAmount() {
        if (productPrice == null || productQuantity == null) {
            return BigDecimal.ZERO;
        }
        return productPrice.multiply(BigDecimal.valueOf(productQuantity));
    }
}
