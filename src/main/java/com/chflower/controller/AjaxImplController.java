package com.chflower.controller;

import com.chflower.dto.Admin;
import com.chflower.dto.Cust;
import com.chflower.service.AdminService;
import com.chflower.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@RestController
public class AjaxImplController {
    @Autowired
    private BCryptPasswordEncoder encoder;
    @Autowired
    AdminService adminService;
    @Autowired
    CustService custservice;
    @RequestMapping("/checkid")
    public Object checkid(String id) throws Exception{
        int result = 0;
        Admin admin = null;
        int getid = Integer.parseInt(id);
        admin = adminService.get(getid);
        log.info(admin.getAdmin_name());
        if(admin != null) {
            result=1;
        }
        return result;
    }
    @RequestMapping("/custcheckid")
    public Object custcheckid(String cust_id) throws Exception {
        int result = 0;
        Cust cust = null;
        cust = custservice.get(cust_id);
        if(cust != null){
            result = 1;
        }
        return result;
    }


}


