package com.chflower.controller;

import com.chflower.dto.Item;
import com.chflower.dto.Itemimg;
import com.chflower.service.ItemService;
import com.chflower.service.ItemimgService;
import com.chflower.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/item")
public class ItemController {
    @Autowired
    ItemService itemService;
    @Autowired
    ItemimgService itemimgService;

    @Value("${uploadimgdir}") /*이미지 저장경로*/
            String uploadimgdir;
    String dir = "item/";



    //127.0.0.1/item
    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Item> list = null;
        list = itemService.get();

        model.addAttribute("flist", list);
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "all");
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, Item item, Itemimg itemimg) throws Exception {
        Integer largestId = itemService.selectLargestid();
        if (largestId == null) {
            item.setItem_id(200);
        } else {
            Integer seq = largestId + 1;
            item.setItem_id(seq);
        }

        log.info("xxxxxxxxx"+ item.getItem_id());

        //대표사진
        MultipartFile mf = item.getImg();
        String imgname = mf.getOriginalFilename();
        item.setItem_img(imgname);

        itemService.register(item);
        FileUploadUtil.saveFile(mf, uploadimgdir);

        //기타사진
        log.info("mutipartList = {}", itemimg.getImgList());
        String subimgname = null;
        itemimg.setItem_id(item.getItem_id());
        if (itemimg.getImgList() != null) {
            for (MultipartFile file : itemimg.getImgList()) {
                log.info("file name = {}", file.getOriginalFilename());
                subimgname = file.getOriginalFilename();
                itemimg.setItem_subimg(subimgname);
                log.info("zzzzzzzzz"+ itemimg.getItem_id());
                itemimgService.register(itemimg);
                FileUploadUtil.saveFile(file, uploadimgdir);
            }
        }
            return "redirect:/item/all";
    }

    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, int item_id, Item item, Itemimg itemimg, String item_img) throws Exception {
        log.info("=====================" + item_id);
        log.info("=====================" + item);
        log.info("=====================" + itemimg);
        log.info("=====================" + item_img);
        log.info("=====================" + itemimg);
        //log.info("=====================" + ilist);

        //대표사진
        if(item.getImg() == null || item.getImg().isEmpty()) {
            log.info("파일안들어올때"+item_img);     //파일(img) 안들어올때, String형태의 item_img가 들어와야함
            log.info("=====================" + item_img);
            log.info("=====================" + item);
            item.setItem_img(item_img);
            itemService.modify(item);
        }else {
            log.info("파일들어올때"+ item.getImg());    //파일(img) 들어올때, MultipartFile형태의 img가 들어온다
            MultipartFile mf = item.getImg();
            String imgname = mf.getOriginalFilename();
            item.setItem_img(imgname);
            FileUploadUtil.saveFile(mf, uploadimgdir);
            itemService.modify(item);
        }

        //기타사진
        int checkNum =1;
        //파일이 업로드 안되었을때 ->기존 사진 불러와서 고대로 저장
        log.info("multipartList = {}", itemimg.getImgList());
        for(MultipartFile file: itemimg.getImgList()){
            if(file.isEmpty()) checkNum=0;
            List<Itemimg> list;
            list = itemimgService.getimg(item_id);
            log.info("++++++++++++++++++++" + list);
        }
        if(checkNum==1) {
            //파일 업로드 했을때 ->기존 사진 삭제하고 새로 저장
            log.info("multipartList = {}", itemimg.getImgList());
            String subimgname = null;
            itemimgService.remove(item_id);
            itemimg.setItem_id(item.getItem_id());
            for (MultipartFile file : itemimg.getImgList()) {
                log.info("file name = {}", file.getOriginalFilename());
                subimgname = file.getOriginalFilename();
                itemimg.setItem_subimg(subimgname);
                log.info("zzzzzzzzz" + itemimg.getItem_id());
                itemimgService.register(itemimg);
                FileUploadUtil.saveFile(file, uploadimgdir);
            }
        }
        return "redirect:/item/all";
    }

    @RequestMapping("/delitem")
    public String delitem(Model model, int item_id) throws Exception {
        log.info("=========================================="+ item_id);

        itemService.remove(item_id);
        itemimgService.remove(item_id);

        return "redirect:/item/all";
    }
    @RequestMapping("/detail")
    public String detail(Model model, int item_id, Item item, Itemimg itemimg) throws Exception {

        item = itemService.get(item_id);
        List<Itemimg> list= new ArrayList<>();
        list = itemimgService.get();
        log.info("---------------------"+list);

        List<Itemimg> ilist = new ArrayList<>();
        for (Itemimg obj : list) {
            if (obj.getItem_id() == item_id) {
                ilist.add(obj);
            }
        }
            log.info("=================="+ilist);

        model.addAttribute("detail", item);
        model.addAttribute("img", itemimg);
        model.addAttribute("ilist", ilist);
        model.addAttribute("center", dir+"detail");
        return "index";
    }
}
