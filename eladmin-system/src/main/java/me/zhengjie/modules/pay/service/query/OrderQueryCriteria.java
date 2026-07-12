package me.zhengjie.modules.pay.service.query;

import io.github.xxmd.epay.entity.enums.PayMethod;
import lombok.Data;
import me.zhengjie.annotation.Query;
import me.zhengjie.modules.pay.entity.enums.PayStatus;

import java.sql.Timestamp;
import java.util.List;

@Data
public class OrderQueryCriteria {
    @Query(type = Query.Type.INNER_LIKE)
    private String orderNumber;

    @Query(type = Query.Type.EQUAL, propName = "id", joinName = "merchant")
    private Long merchantId;

    @Query(type = Query.Type.EQUAL, propName = "id", joinName = "method")
    private Long methodId;

    @Query(type = Query.Type.INNER_LIKE)
    private String productName;

    @Query(type = Query.Type.EQUAL)
    private PayMethod payMethod;

    @Query(type = Query.Type.EQUAL)
    private PayStatus payStatus;

    @Query(type = Query.Type.BETWEEN)
    private List<Timestamp> updateTime;
}
