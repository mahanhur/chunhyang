package com.chflower.controller;

import com.chflower.dto.Admin;
import com.chflower.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@RestController
public class AjaxImplController {
    @Autowired
    AdminService adminService;
    @RequestMapping("/checkid")
    public Object checkid(String id) throws Exception{
        int result = 0;
        Admin admin = null;
        int getid = Integer.parseInt(id);
        admin = adminService.get(getid);
//        log.info(admin.getAdmin_name());
        if(admin != null) {
            result=1;
        }
        return result;
    }

    @RequestMapping("/registerimpl")
    public String registerimpl(Model model, Admin admin, HttpSession session) throws Exception {
        try {
//          admin.setAdmin_pwd(encoder.encode(admin.getAdmin_pwd()));
            adminService.register(admin);
            session.setAttribute("loginadmin", admin);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("관직자 등록 에러!발생! IT부서에 문의 바랍니다!");
        }
        model.addAttribute("admin",admin);
        return "index";
    }
}


