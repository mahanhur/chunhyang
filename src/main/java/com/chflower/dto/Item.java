package com.chflower.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Item {
    private int item_id;
    private double category_id;
    private String item_img;
    private String item_name;
    private int item_cnt;
    private int item_price;
    private String item_content;

    private Date item_rdate;
    private String flower_color;
    private double flower_type;
    private String flower_size;
    private String main_img;

    private MultipartFile img;
    private List<MultipartFile> imgList;

    public Item(double category_id, String item_img, String item_name, int item_cnt, int item_price, String item_content, Date item_rdate, String flower_color, double flower_type, String flower_size, String main_img) {
        this.category_id = category_id;
        this.item_img = item_img;
        this.item_name = item_name;
        this.item_cnt = item_cnt;
        this.item_price = item_price;
        this.item_content = item_content;
        this.item_rdate = item_rdate;
        this.flower_color = flower_color;
        this.flower_type = flower_type;
        this.flower_size = flower_size;
        this.main_img = main_img;
    }
}