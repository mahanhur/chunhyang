package com.chflower.controller;

import com.chflower.dto.Admin;
import com.chflower.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
    @RequestMapping("/registerimpl")
    public String registerimpl(Model model, Admin admin, HttpSession session) throws Exception {
        log.info(admin.getAdmin_name());
        try {
            admin.setAdmin_pwd(encoder.encode(admin.getAdmin_pwd()));
            adminService.register(admin);
            log.info(admin.getAdmin_name());
            session.setAttribute("loginadmin", admin);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("노비 등록 에러!발생! IT부서에 문의 바랍니다!");
        }
        model.addAttribute("radmin",admin);
        model.addAttribute("center", "registerok");
        return "index";
    }
}
