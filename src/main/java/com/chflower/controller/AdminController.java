package com.chflower.controller;

import com.chflower.dto.Admin;
import com.chflower.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private BCryptPasswordEncoder encoder;
    @Autowired
    AdminService adminService;
    String dir = "admin/";

    @RequestMapping("")
    public String all(Model model) throws Exception {
        List<Admin> list = null;
        list = adminService.get();
        model.addAttribute("adminlist",list);
        model.addAttribute("center",dir+"admin");
        return "index";
    }

    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("center", dir+"register");
        return "index";
    };


}
