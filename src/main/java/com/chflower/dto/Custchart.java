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

    String agegroup;
    Double agegrouptotal;

    Double gendertotal;

    public Custchart(String gender, Double gendertotal) {
        this.gender = gender;
        this.gendertotal = gendertotal;
    }

    public Custchart(String gender, String agegroup, Double agegrouptotal) {
        this.gender = gender;
        this.agegroup = agegroup;
        this.agegrouptotal = agegrouptotal;
    }
}
