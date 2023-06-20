package com.chflower.controller;

import com.chflower.dto.Delinfo;
import com.chflower.dto.Subs;
import com.chflower.dto.Subsdetail;
import com.chflower.dto.Subsitem;
import com.chflower.service.DelinfoService;
import com.chflower.service.SubsService;
import com.chflower.service.SubsdetailService;
import com.chflower.service.SubsitemService;
import com.chflower.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Slf4j
@Controller
@RequestMapping("/subs")
public class SubsController {

    @Value("${uploadimgdir}") /*이미지 저장경로*/
            String uploadimgdir;

    @Autowired
    SubsitemService subsitemService;
    @Autowired
    SubsService subsService;
    @Autowired
    SubsdetailService subsdetailService;
    @Autowired
    DelinfoService delinfoService;

    String dir = "subs";
    @RequestMapping("/subsitem")
    public String item(Model model){
        List<Subsitem> list = null;
        try {
            list = subsitemService.get();
            model.addAttribute("slist",list);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        model.addAttribute("center", dir+"/subsitem");
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


    @RequestMapping("/subsinfo")
    public String subsinfo(Model model){
        List<Subs> list = null;
        try {
            list = subsService.get();
            model.addAttribute("silist",list);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        model.addAttribute("center", dir+"/subsinfo");
        return "index";
    }
    @RequestMapping("/subsinfodel")
    public String subsinfodel(Model model, Integer subs_id){
        try {
            subsService.remove(subs_id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/subs/subsinfo";
    }


    @RequestMapping("/subsdetail")
    public String subsdetail(Model model, Integer subs_id){
        List<Subsdetail> list = null;
        Subsdetail subsdetail;
        List<Delinfo> dlist = null;
        try {
            if(subs_id != null ) {
                list = subsdetailService.get2(subs_id);
                model.addAttribute("sdlist",list);
                dlist = delinfoService.get();
                model.addAttribute("dlist", dlist);
            } else {
                list = subsdetailService.get();
                model.addAttribute("sdlist",list);
                dlist = delinfoService.get();
                model.addAttribute("dlist", dlist);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        model.addAttribute("center", dir+"/subsdetail");
        return "index";
    }


    @RequestMapping("/subsdetailimpl")
    public String subsdetailimpl(Model model, int subsdetail_id, Date subsduedate ){
        Subsdetail subsdetail = new Subsdetail(subsdetail_id, subsduedate);
        try {
            subsdetailService.dateupdate(subsdetail);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/subs/subsdetail";
    }



}
