package com.chflower.dto;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Chart {
    private int subsitem_id;
    private int item_id;
    private int cnt;
    private int rownum;
    private String subsitem_name;
    private int subs_cnt;
    private int subsitem_price;
    private int subs_amount;
    private String item_name;
    private int item_cnt;
    private int item_price;
    private int item_amount;

    private Date date1;
    private Date date2;

    public Chart(int rownum, int subsitem_id, int cnt) {
        this.rownum = rownum;
        this.subsitem_id = subsitem_id;
        this.cnt = cnt;
    }

    public Chart(int subsitem_id, int rownum, String subsitem_name, int subs_cnt, int subsitem_price, int subs_amount) {
        this.subsitem_id = subsitem_id;
        this.rownum = rownum;
        this.subsitem_name = subsitem_name;
        this.subs_cnt = subs_cnt;
        this.subsitem_price = subsitem_price;
        this.subs_amount = subs_amount;
    }

    public Chart(Date date1, Date date2) {
        this.date1 = date1;
        this.date2 = date2;
    }
}
