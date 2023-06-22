package com.chflower.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Custchart {
    int month;
    String gender;
    int total;

    Double gendertotal;

    public Custchart(String gender, Double gendertotal) {
        this.gender = gender;
        this.gendertotal = gendertotal;
    }
}
