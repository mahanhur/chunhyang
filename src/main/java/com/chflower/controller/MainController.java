package com.chflower.controller;

import com.chflower.dto.Delinfo;
import com.chflower.service.DelinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    DelinfoService delinfoService;
    @RequestMapping("/")
    public String main(){
        return "index";
    }


    @RequestMapping("/delivery")
    public String delivery(Model model){
        List<Delinfo> list ;
        try {
            list = delinfoService.get();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("dlist", list);
        model.addAttribute("center", "delivery");
        return "index";
    }

    @RequestMapping("/delupdateimpl")
    public String delupdateimpl(Model model, int del_id, String del_state, String del_com, String invoice_id, Date del_startdate, Date del_findate){
        Delinfo delinfo = new Delinfo(del_id, del_state, del_com, invoice_id, del_startdate, del_findate);
        try {
            delinfoService.modify(delinfo);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/delivery";
    }

}
