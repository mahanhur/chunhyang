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
    private Integer item_id;
    private Integer item_main_id;
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
}