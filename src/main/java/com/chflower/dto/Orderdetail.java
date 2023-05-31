package com.chflower.dto;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Orderdetail {
    private int order_id;
    private int orderdetail_id;
    private int item_id;
    private int order_cnt;

    private String item_img;
    private String item_name;
    private int item_price;
}
