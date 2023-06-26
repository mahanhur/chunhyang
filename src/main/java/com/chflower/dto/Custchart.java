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
    Double agegroupratio;

    Double gendertotal;

    public Custchart(String gender, Double gendertotal) {
        this.gender = gender;
        this.gendertotal = gendertotal;
    }

    public Custchart(String agegroup, String gender, Double agegrouptotal) {
        this.agegroup = agegroup;
        this.gender = gender;
        this.agegrouptotal = agegrouptotal;
    }
}
