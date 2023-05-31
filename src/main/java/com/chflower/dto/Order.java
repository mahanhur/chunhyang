package com.chflower.dto;
import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Order {
    private int order_id;
    private String cust_id;
    private Date order_date;
    private int order_amount;
    private int user_point;
    private int pay_amount;
    private String order_name;
    private String order_phone;
    private String od_addr1;
    private String od_addr2;
    private String ship_memo;

}
