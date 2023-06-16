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
    private String admin_level;
    private String admin_loginkey;

    public Admin(int admin_id, String admin_pwd, String admin_name, String admin_level) {
        this.admin_id = admin_id;
        this.admin_pwd = admin_pwd;
        this.admin_name = admin_name;
        this.admin_level = admin_level;
    }

    private Integer new_id;
}
