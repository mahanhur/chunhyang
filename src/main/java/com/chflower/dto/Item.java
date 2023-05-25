package com.chflower.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Item {
    private Integer item_id;
    private double category_id;
    private String item_img1;
    private String item_name;
    private int item_cnt;
    private int item_price;

    private String item_content;
    private String item_img2;
    private String item_img3;
    private String item_img4;
    private String item_img5;

    private Date item_rdate;
    private String flower_color;
    private double flower_type;
    private String flower_size;

    private MultipartFile img;

    public Item(double category_id, String item_img1, String item_name, int item_cnt, int item_price, String item_content, String item_img2, String item_img3, String item_img4, String item_img5, Date item_rdate, String flower_color, double flower_type, String flower_size) {
        this.category_id = category_id;
        this.item_img1 = item_img1;
        this.item_name = item_name;
        this.item_cnt = item_cnt;
        this.item_price = item_price;
        this.item_content = item_content;
        this.item_img2 = item_img2;
        this.item_img3 = item_img3;
        this.item_img4 = item_img4;
        this.item_img5 = item_img5;
        this.flower_color = flower_color;
        this.flower_type = flower_type;
        this.flower_size = flower_size;
    }
}