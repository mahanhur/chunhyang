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
@RequestMapping("")
public class AdminController {

    @Autowired
    private BCryptPasswordEncoder encoder;
    @Autowired
    AdminService adminservice;
    String dir = "admin/";

    @RequestMapping("/admin")
    public String all(Model model) throws Exception {
        List<Admin> list = null;
        list = adminservice.get();
        model.addAttribute("adminlist",list);
        model.addAttribute("center",dir+"admin");
        return "index";
    }

    @RequestMapping("/admin/register")
    public String register(Model model) {
        model.addAttribute("center", dir+"register");
        return "index";
    };

        @RequestMapping("/admin/registerimpl")
    public String registerimpl(Model model, Admin admin, HttpSession session) throws Exception {
        try {
            admin.setAdmin_pwd(encoder.encode(admin.getAdmin_pwd() ));
//          여기에 시퀀스로 생성된 id값을 셋 어드민 아이디  < 겟메이크어드민아이디(새로생성)로 메소드 만들어서 넣음
            Integer new_id = adminservice.makeid();
            admin.setAdmin_id(new_id);
            adminservice.register(admin);

            session.setMaxInactiveInterval(100000000);

            session.setAttribute("loginadmin", admin);
            log.info(admin.toString());
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("노비 등록 에러!발생! IT부서에 문의 바랍니다!");
        }
        model.addAttribute("radmin",admin);
        model.addAttribute("center", dir+"registerok");
        return "index";
    }
    @RequestMapping("/admin/login")
    public String login(Model model,String redirectURL){
        model.addAttribute("redirectURL",  redirectURL);
        model.addAttribute("center",  dir+"login");
        return "index";
    }

    @RequestMapping("/admin/loginimpl")
    public String loginimpl(Model model, Integer admin_id, String admin_pwd,String requestURI,
                            HttpSession session) throws Exception {
        String nextPage = dir+"loginfail";
        Admin admin = null;
        try {
            admin = adminservice.get(admin_id);
            int loginadmin_id = admin.getAdmin_id();
            if( admin != null && encoder.matches(admin_pwd, admin.getAdmin_pwd()) ){
                nextPage = dir+"loginok";
                session.setMaxInactiveInterval(100000000);
                session.setAttribute("loginadmin_id", loginadmin_id);
                session.setAttribute("loginadmin", admin);
            }else{
                model.addAttribute("center", nextPage);
            }
        } catch (Exception e) {
            throw new Exception("ER0006 : 로그인이 실패했습니다!");
        }
        model.addAttribute("center", nextPage); // center에는 nextPage 뿌려져라.
        return "index";
    }
    @RequestMapping("/admin/logoutimpl")
    public String logoutimpl(Model model, HttpSession session){
        if(session != null){
            session.invalidate();
        }
        return "redirect:/";
    }

    @RequestMapping("/admin/admindetail")
    public String admindetail(Model model, Integer admin_id) throws Exception {
        Admin admin = null; // 받을 준비.
        try {
            admin = adminservice.get(admin_id);
        } catch (Exception e) {
            throw new Exception("노비 정보 보기 에러 발생");
        }
        model.addAttribute("admin", admin); // DB에 담겨있던 id를 adminfo페이지가 페이지로 넘겨주기 그래야 브라우저에서 보이니까.
        model.addAttribute("center", dir+"admindetail"); // center에는 adminfo페이지가 뿌려져라.
        return "index";
    }
    @RequestMapping("/admin/updateimpl")
    public String adminfoimpl(Model model, Admin admin) throws Exception {
        try {
            admin.setAdmin_pwd(encoder.encode(admin.getAdmin_pwd() ));
            adminservice.modify(admin);
        } catch (Exception e) {
            throw new Exception("직원정보 수정 중 에러발생");
        }
        // model 말고, redirect 사용해서 다시 위치해있던 adminfo 페이지 + 해당고객의 adminfo페이지(= adm.getid)로 가기.
        return "redirect:/admin/admindetail?admin_id=" + admin.getAdmin_id();
    }

}
