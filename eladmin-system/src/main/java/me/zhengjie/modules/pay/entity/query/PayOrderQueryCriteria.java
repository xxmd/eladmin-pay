package me.zhengjie.modules.pay.entity.query;

import lombok.Data;
import me.zhengjie.annotation.Query;
import me.zhengjie.modules.pay.entity.enums.PayMethod;

import java.sql.Timestamp;
import java.util.List;

@Data
public class PayOrderQueryCriteria {
    @Query(type = Query.Type.INNER_LIKE)
    private String orderNumber;

    @Query(type = Query.Type.EQUAL, propName = "id", joinName = "pay_merchant")
    private Long merchantId;

    @Query(type = Query.Type.INNER_LIKE)
    private String productName;

    @Query(type = Query.Type.INNER_LIKE)
    private PayMethod payMethod;

    @Query(type = Query.Type.BETWEEN)
    private List<Timestamp> updateTime;
}
