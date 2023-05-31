package com.chflower.controller;

import com.chflower.dto.Cust;
import com.chflower.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
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
    @RequestMapping("/register")
    public String register(Model model){
        model.addAttribute("center",dir+"register");
        return "index";
    }
    @RequestMapping("/registerimpl")
    public String registerimpl(Model model,
                               @Validated Cust cust, Errors errors) throws Exception {
                               //Cust dto에서 지정한 사이즈 체크. 문제 발생시 errors
        if (errors.hasErrors()){
            List<ObjectError> es = errors.getAllErrors();
            String msg = "";
            for(ObjectError e : es){
                msg += "<h4>";
                msg += e.getDefaultMessage();
                msg += "</h4>";
            }
            throw new Exception(msg);
        }

        //에러가 안나면 db에 넣기
        cust.setCust_pwd(cust.getCust_pwd());
        custservice.register(cust);
        return "redirect:/cust/cust";

    }

}
