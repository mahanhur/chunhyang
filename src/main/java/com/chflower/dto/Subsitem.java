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

}
