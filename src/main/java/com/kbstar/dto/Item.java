package com.kbstar.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Item {
    private int id;
    private String name;
    private int price;
    private String imgname;
    private Date rdate;
    private int cate_id;

    private MultipartFile img;

    public Item(int id, String name, int price, String imgname, Date rdate, int cate_id) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.imgname = imgname;
        this.rdate = rdate;
        this.cate_id = cate_id;
    }
}