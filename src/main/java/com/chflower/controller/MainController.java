package com.chflower.controller;

import com.chflower.dto.Delinfo;
import com.chflower.service.DelinfoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Slf4j
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
    public String delupdateimpl(Model model, int del_id, String del_state, String del_com, String invoice_id, String del_startdate, String del_findate) throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
        Date del_startdate_date = null;
        Date del_findate_date = null;
        if(del_startdate != "") {
            del_startdate_date = formatter.parse(del_startdate);
        }
        if(del_findate != "") {
            del_findate_date = formatter.parse(del_findate);
        }
        Delinfo delinfo = new Delinfo(del_id, del_state, del_com, invoice_id, del_startdate_date, del_findate_date);
        try {
            delinfoService.modify(delinfo);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/delivery";
    }

}
