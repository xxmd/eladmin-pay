package me.zhengjie.modules.pay.service.dto;

import lombok.Data;
import me.zhengjie.base.BaseDTO;
import me.zhengjie.modules.pay.entity.PayMerchant;

import java.io.Serializable;
import java.util.List;

@Data
public class PayPlatformSmallDto extends BaseDTO implements Serializable {
    private Long id;

    private String name;
}
