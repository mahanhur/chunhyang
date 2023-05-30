package com.chflower.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Category {
    /*DB칼럼명*/
    private int category_id;
    private String category_name;
    private int topcategory_id;

    /*JOIN을 위해서 만든 DTO 속성*/
    private int top_id;
    private String top_name;
}
