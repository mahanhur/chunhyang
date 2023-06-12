package com.chflower.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Qna {
    private Integer qna_id;
    private String cust_id;
    private String post_type;
    private Integer subsitem_id;
    private String qna_title;
    private String qna_contents;
    private Date qna_wdate;
    private Date qna_udate;
    private String qna_image1;
    private String qna_image2;

    private Integer answer_id;
    private Integer admin_id;
    private String admin_name;
    private String answer_contents;
    private Date answer_wdate;
    private Date answer_udate;


    private MultipartFile img1;
    private MultipartFile img2;
    }
