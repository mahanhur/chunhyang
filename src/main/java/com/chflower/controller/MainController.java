package com.chflower.controller;

import com.chflower.dto.*;
import com.chflower.service.DelinfoService;
import com.chflower.service.MessageService;
import com.chflower.service.PointService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
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
    @Autowired
    MessageService messageService;
    @Value("${adminserver}")
    String adminserver;
    @RequestMapping("/")
    public String main(Model model,HttpSession session){
        Delinfo count;
        count = delinfoService.count();
        model.addAttribute("count", count);

        Admin admin = (Admin) session.getAttribute("loginadmin");
        if(admin != null) {
            String m_receiver = admin.getAdmin_name();
            List<Message> mrlist = messageService.selectreceiver(m_receiver);
            model.addAttribute("mrlist", mrlist);
        }
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

    @RequestMapping("/chart")
    public String chart(Model model){
        model.addAttribute("adminserver",adminserver);
        model.addAttribute("center",  "chart");
        return "index";
    }

    @RequestMapping("/messagesend")
    public String messagesend(Model model, HttpSession session, String m_receiver, String m_content){
        Admin admin = (Admin) session.getAttribute("loginadmin");
        String m_sender = admin.getAdmin_name();

        Message message = new Message(m_sender, m_receiver, m_content);

        try {
            messageService.register(message);
        } catch (Exception e) {
            throw new RuntimeException("메시지send 오류입니다");
        }

        return "redirect:/";
    }
}
