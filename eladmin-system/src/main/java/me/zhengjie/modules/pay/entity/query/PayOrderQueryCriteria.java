package me.zhengjie.modules.pay.entity.query;

import io.github.xxmd.epay.entity.enums.PayMethod;
import lombok.Data;
import me.zhengjie.annotation.Query;
import me.zhengjie.modules.pay.entity.enums.PayStatus;

import java.sql.Timestamp;
import java.util.List;

@Data
public class PayOrderQueryCriteria {
    @Query(type = Query.Type.INNER_LIKE)
    private String orderNumber;

    @Query(type = Query.Type.EQUAL, propName = "id", joinName = "pay_merchant")
    private Long payMerchantId;

    @Query(type = Query.Type.EQUAL, propName = "id", joinName = "pay_method")
    private Long payMethodId;

    @Query(type = Query.Type.INNER_LIKE)
    private String productName;

    @Query(type = Query.Type.EQUAL)
    private PayMethod payMethod;

    @Query(type = Query.Type.EQUAL)
    private PayStatus payStatus;

    @Query(type = Query.Type.BETWEEN)
    private List<Timestamp> updateTime;
}
