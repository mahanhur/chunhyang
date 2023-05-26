package com.chflower.dto;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Subsdetail {
    private int subsdetail_id;
    private int subs_id;
    private String cust_id;
    private String receiver;
    private String receiver_phone;
    private String rec_add1;
    private String rec_add2;
    private String subs_memo;
    private Date subs_duedate;

    public Subsdetail(int subs_id, String cust_id, String receiver, String receiver_phone, String rec_add1, String rec_add2, String subs_memo, Date subs_duedate) {
        this.subs_id = subs_id;
        this.cust_id = cust_id;
        this.receiver = receiver;
        this.receiver_phone = receiver_phone;
        this.rec_add1 = rec_add1;
        this.rec_add2 = rec_add2;
        this.subs_memo = subs_memo;
        this.subs_duedate = subs_duedate;
    }

    public Subsdetail(int subsdetail_id, Date subs_duedate) {
        this.subsdetail_id = subsdetail_id;
        this.subs_duedate = subs_duedate;
    }
}
