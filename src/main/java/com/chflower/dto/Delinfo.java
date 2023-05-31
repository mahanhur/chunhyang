package com.chflower.dto;

import lombok.*;

import java.util.Date;


@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Delinfo {
    private int del_id;
    private int subsdetail_id;
    private int order_id;
    private String del_state;
    private String del_com;
    private String invoice_id;
    private Date del_startdate;
    private Date del_findate;

    public Delinfo(int del_id, String del_state, String del_com, String invoice_id, Date del_startdate, Date del_findate) {
        this.del_id = del_id;
        this.del_state = del_state;
        this.del_com = del_com;
        this.invoice_id = invoice_id;
        this.del_startdate = del_startdate;
        this.del_findate = del_findate;
    }

    private int totalcount;
    private int count1;
    private int count2;
    private int count3;

    public Delinfo(int totalcount, int count1, int count2, int count3) {
        this.totalcount = totalcount;
        this.count1 = count1;
        this.count2 = count2;
        this.count3 = count3;
    }
}
