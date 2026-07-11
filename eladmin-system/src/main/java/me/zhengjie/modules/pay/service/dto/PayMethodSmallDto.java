package me.zhengjie.modules.pay.service.dto;

import lombok.Data;
import me.zhengjie.base.BaseDTO;

import java.io.Serializable;
import java.util.List;

@Data
public class PayMethodSmallDto extends BaseDTO implements Serializable {
    private Long id;

    private String label;

    private String value;
}
