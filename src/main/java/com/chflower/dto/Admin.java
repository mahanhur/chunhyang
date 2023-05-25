package com.chflower.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Admin {
    private int admin_id;
    private String admin_pwd;
    private String admin_name;
    private int admin_level;

}
