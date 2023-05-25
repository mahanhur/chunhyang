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
    private int item_id;
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

}