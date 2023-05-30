package com.chflower.dto;

import lombok.*;

import java.sql.Date;


@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Subs {
    private int subs_id;
    private String cust_id;
    private int subsitem_id;
    private int subs_amount;
    private int minus_point;
    private int subs_pay_amount;
    private Date subs_rdate;


    public Subs(String cust_id, int subsitem_id, int subs_amount, int minus_point, int subs_pay_amount) {
        this.cust_id = cust_id;
        this.subsitem_id = subsitem_id;
        this.subs_amount = subs_amount;
        this.minus_point = minus_point;
        this.subs_pay_amount = subs_pay_amount;
    }
}
