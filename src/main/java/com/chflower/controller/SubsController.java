package com.chflower.controller;

import com.chflower.dto.Subsitem;
import com.chflower.service.SubsitemService;
import com.chflower.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


@Slf4j
@Controller
@RequestMapping("/subs")
public class SubsController {

    @Value("${uploadimgdir}") /*이미지 저장경로*/
            String uploadimgdir;

    @Autowired
    SubsitemService subsitemService;
    String dir = "subs";
    @RequestMapping("")
    public String item(Model model){
        List<Subsitem> list = null;
        try {
            list = subsitemService.get();
            model.addAttribute("slist",list);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        model.addAttribute("center", dir);
        return "index";
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model, Subsitem subsitem){
        MultipartFile mf = subsitem.getSubsitem_imgfile();
        String imgname = mf.getOriginalFilename();
        subsitem.setSubsitem_img(imgname);
        try {
//            log.info("----------------------------------------"+subsitem);
            subsitemService.register(subsitem);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        FileUploadUtil.saveFile(mf,uploadimgdir);
        return "redirect:/subs";

    }


}
