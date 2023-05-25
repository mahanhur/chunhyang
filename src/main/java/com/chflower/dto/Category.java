package com.chflower.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Category {
    private int id;
    private String cate_name;
    private int top_cate_id;
    private int topid;
    private String topname;
}
