package me.zhengjie.modules.pay.service.dto;

import lombok.Data;
import me.zhengjie.base.BaseDTO;
import me.zhengjie.modules.pay.entity.enums.PayStatus;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

@Data
public class PayOrderDto extends BaseDTO implements Serializable {
    private Long id;

    private String orderNumber;

    private String productName;

    private BigDecimal productPrice;

    private Integer productQuantity;

    private String payUrl;

    private PayStatus payStatus;

    private Timestamp payTime;

    private String remark;

    private PayMerchantMiddleDto payMerchant;

    private PayMethodSmallDto payMethod;
}
