package com.chflower.controller;

import com.chflower.dto.Delinfo;
import com.chflower.dto.Point;
import com.chflower.dto.Subs;
import com.chflower.service.DelinfoService;
import com.chflower.service.PointService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
    @Autowired
    PointService pointService;
    @Value("${adminserver}")
    String adminserver;
    @RequestMapping("/")
    public String main(Model model){
        Delinfo count;
        count = delinfoService.count();
        model.addAttribute("count", count);
        return "index";
    }


    @RequestMapping("/delivery")
    public String delivery(Model model, String del_state){
        List<Delinfo> list ;
        try {
            if(del_state != null) {
                list = delinfoService.center(del_state);
                model.addAttribute("dlist", list);
            } else {
                list = delinfoService.get();
                model.addAttribute("dlist", list);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
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


    @RequestMapping("/point")
    public String point(Model model){
        List<Point> list ;
        try {
            list = pointService.get();
            model.addAttribute("plist", list);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("center", "point");
        return "index";
    }

    @RequestMapping("/callcenter")
    public String callcenter(Model model){
        model.addAttribute("adminserver",adminserver);
        model.addAttribute("center",  "callcenter");
        return "index";
    }
}
