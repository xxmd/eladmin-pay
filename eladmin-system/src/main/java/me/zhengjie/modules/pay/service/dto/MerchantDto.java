package me.zhengjie.modules.pay.service.dto;

import io.swagger.models.auth.In;
import lombok.Data;

import java.util.List;

@Data
public class MerchantDto {
    private Long id;

    private Integer merchantId;

    private Boolean enabled;

    private PlatformDto platform;

    private List<MethodDto> methodList;
}
