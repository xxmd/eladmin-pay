package me.zhengjie.modules.pay.service.dto;

import lombok.Data;
import me.zhengjie.modules.pay.entity.Platform;

@Data
public class PlatformDto {
    private Long id;

    private String name;

    private Boolean enabled;
}
