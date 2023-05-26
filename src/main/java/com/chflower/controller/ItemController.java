package com.chflower.controller;

import com.chflower.dto.Cust;
import com.chflower.dto.Item;
import com.chflower.dto.Subsitem;
import com.chflower.service.ItemService;
import com.chflower.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/item")
public class ItemController {
    @Autowired
    ItemService itemService;

    @Value("${uploadimgdir}") /*이미지 저장경로*/
            String uploadimgdir;
    String dir = "item/";


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
    public String addimpl(Model model, Item item) throws Exception {
//        MultipartFile mf = item.getImg();
//        String imgname = mf.getOriginalFilename();
//        item.setItem_img1(imgname);
        itemService.register(item);
//        FileUploadUtil.saveFile(mf, uploadimgdir);
        return "redirect:/item";
    }
    @RequestMapping("/delitem")
    public String delitem(Model model, Integer item_id) throws Exception {
        log.info("=========================================="+ item_id);
        itemService.remove(item_id);

        return "redirect:/item";
    }
    @RequestMapping("/detail")
    public String detail(Model model, Integer item_id, Item item) throws Exception {

        item = itemService.get(item_id);

        model.addAttribute("detail", item);
        model.addAttribute("center", dir+"detail");
        return "index";
    }
}
