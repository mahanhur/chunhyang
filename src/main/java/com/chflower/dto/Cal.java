package com.chflower.dto;

import lombok.*;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Cal {
    private String title;
    private String start;
    private String end;
    private String div;
    private String url;
    private String duedate;
    private String count;

    public Cal(String title, String end) {
        this.title = title;
        this.end = end;
    }
}
//public class Cal {
//    private String count;
//    private String duedate;
//    private String div;
//    private String url;
//
//    public Cal(String count, String duedate) {
//        this.count = count;
//        this.duedate = duedate;
//    }
//}
