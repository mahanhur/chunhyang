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

    int seq = 200;
    public int generateSeq() throws Exception {
        seq = itemService.selectLargestid()+1;
        return seq;
    }

    //127.0.0.1/item
    @RequestMapping("")
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

        //대표사진
        MultipartFile mf = item.getImg();
        String imgname = mf.getOriginalFilename();
        item.setItem_img(imgname);
        item.setItem_id(generateSeq());
        log.info("xxxxxxxxx"+ item.getItem_id());
        itemService.register(item);
        FileUploadUtil.saveFile(mf, uploadimgdir);

        //기타사진
        log.info("mutipartList = {}", itemimg.getImgList());
        String subimgname = null;
        itemimg.setItem_id(item.getItem_id());
        for (MultipartFile file : itemimg.getImgList()) {
            log.info("file name = {}", file.getOriginalFilename());
            subimgname = file.getOriginalFilename();
            itemimg.setItem_subimg(subimgname);
            log.info("zzzzzzzzz"+ itemimg.getItem_id());
            itemimgService.register(itemimg);
            FileUploadUtil.saveFile(file, uploadimgdir);
        }
            return "redirect:/item";
    }


    @RequestMapping("/delitem")
    public String delitem(Model model, int item_id) throws Exception {
        log.info("=========================================="+ item_id);

        itemService.remove(item_id);
        itemimgService.remove(item_id);

        return "redirect:/item";
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
