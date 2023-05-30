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
    private int item_id;
    private String item_subimg;

    private MultipartFile img;
    private List<MultipartFile> imgList;

    public Itemimg(int item_id, String item_subimg) {
        this.item_id = item_id;
        this.item_subimg = item_subimg;
    }
}
