package com.chflower.controller;

import com.chflower.dto.Cust;
import com.chflower.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/cust")
public class CustController {

    @Autowired
    CustService custservice;

    @Autowired
    BCryptPasswordEncoder encoder;

    String dir = "cust/";

    @RequestMapping("/cust")
    public String all(Model model) throws Exception {

        List<Cust> list = null;
        list = custservice.get();
        model.addAttribute("custlist", list);
        model.addAttribute("center", dir+"cust");
        return "index";
    }

}
