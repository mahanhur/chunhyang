package com.chflower.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Subsitem {
    private int subsitem_id;
    private String subsitem_name;
    private int subsitem_price;
    private String subsitem_content;
    private String subsitem_img;

    public Subsitem(String subsitem_name, int subsitem_price, String subsitem_content, String subsitem_img) {
        this.subsitem_name = subsitem_name;
        this.subsitem_price = subsitem_price;
        this.subsitem_content = subsitem_content;
        this.subsitem_img = subsitem_img;
    }
}
