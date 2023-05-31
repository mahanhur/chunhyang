package com.chflower.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Board {
    private Integer noti_id;
    private Integer admin_id;
    private String notiboard_id;
    private String noti_title;
    private String noti_contents;
    private Date noti_wdate;
    private Date noti_udate;
    private String noti_image1;
    private String noti_image2;

    private MultipartFile img1;
    private MultipartFile img2;
}