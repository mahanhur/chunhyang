package com.chflower.dto;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Itemimg {
    private Integer item_main_id;
    private String item_subimg;

    private MultipartFile img;
    private List<MultipartFile> imgList;

    public Itemimg(Integer item_main_id, String item_subimg) {
        this.item_main_id = item_main_id;
        this.item_subimg = item_subimg;
    }
}
