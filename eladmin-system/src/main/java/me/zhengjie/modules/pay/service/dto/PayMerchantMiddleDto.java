package me.zhengjie.modules.pay.service.dto;

import lombok.Data;
import me.zhengjie.base.BaseDTO;

import java.io.Serializable;
import java.util.List;

@Data
public class PayMerchantMiddleDto extends BaseDTO implements Serializable {
    private Long id;

    private Long merchantId;

    private String md5SecretKey;

    private Integer sort;

    private Boolean enable;

    private String remark;

    private PayPlatformSmallDto platform;
}
