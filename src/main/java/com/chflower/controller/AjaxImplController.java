package com.chflower.controller;

import com.chflower.dto.Admin;
import com.chflower.dto.Cal;
import com.chflower.dto.Cust;
import com.chflower.dto.Message;
import com.chflower.service.AdminService;
import com.chflower.service.CustService;
import com.chflower.service.MessageService;
import com.chflower.util.CFRCelebrityUtil;
import com.chflower.util.DateUtil;
import com.chflower.util.FileUploadUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
    @Autowired
    MessageService messageService;
    @Autowired
    CFRCelebrityUtil celebrityUtil;

    @Value("${uploadimgdir}")
    String imgdir;
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
    @RequestMapping("/getcal3")
    public Object getcal3(String start, String end){
        log.info(start);
        log.info(end);
        List<Cal> list= new ArrayList<>();
        list.add(new Cal("title1","2023-05-01","2023-05-05","1","/cust"));
        list.add(new Cal("aa","2023-05-03","2023-05-06","2","/cust"));
        list.add(new Cal("ss","2023-05-06","2023-05-09","3","/cust"));
        list.add(new Cal("ss","2023-05-10","2023-05-12","3","/cust"));
        list.add(new Cal("ss","2023-05-16","2023-05-19","2","/cust"));
        list.add(new Cal("단체휴가","2023-06-07","2023-06-07","3","/cust"));
        // Java Object ---> JSON
        // JSON(JavaScript Object Notation)
        // [{},{},{},...]
        JSONArray ja = new JSONArray();
        for(Cal obj:list){
            JSONObject jo = new JSONObject();

            jo.put("title",obj.getTitle());
            jo.put("start",obj.getStart());
            jo.put("end", DateUtil.getDateStr(obj.getEnd()));

            if(obj.getDiv().equals("1")){
                jo.put("color","green");
            }else if(obj.getDiv().equals("2")){
                jo.put("color","blue");
            }else{
                jo.put("color","red");
            }

            jo.put("url",obj.getUrl());

            ja.add(jo);
        }
        return ja;
    }
    @RequestMapping("/gettime")
    public Object gettime(String tdate){
        JSONArray ja = new JSONArray();
        if(tdate.equals("2023-06-07")){
            ja.add("09:00");
            ja.add("11:00");
            ja.add("01:00");
            ja.add("03:00");
        }else{
            ja.add("09:00");
            ja.add("11:00");
            ja.add("01:00");
        }
        return ja;
    }

    @RequestMapping("/message")
    @ResponseBody
    public Object message(Model model, HttpSession session) {
        Admin admin = (Admin) session.getAttribute("loginadmin");

        if (admin != null) {
            String m_receiver = admin.getAdmin_name();
            List<Message> mrlist = messageService.selectreceiver(m_receiver);

            JSONArray jsonArray = new JSONArray();
            for (Message message : mrlist) {
                JSONObject jsonMessage = new JSONObject();
                jsonMessage.put("m_sender", message.getM_sender());
                jsonMessage.put("m_content", message.getM_content());
                jsonMessage.put("m_rdate", message.getM_rdate());
                jsonArray.add(jsonMessage);
            }

            return jsonArray.toString();
        }

        return null;
    }

    @RequestMapping("/saveimg")
    public String saveimg(MultipartFile file){
        String filename = file.getOriginalFilename();
        FileUploadUtil.saveFile(file, imgdir);
        return filename;
    }


    @RequestMapping("/faceloginimpl")
    public String faceloginimpl(Model model, HttpSession session, String imgname) throws Exception {
        //NCP에 요청한다
        JSONObject result = (JSONObject) celebrityUtil.getResult(imgdir,imgname);

        //결과를 깐다
        JSONArray faces = (JSONArray) result.get("faces");
        JSONObject obj = (JSONObject) faces.get(0);
        JSONObject celebrity = (JSONObject) obj.get("celebrity");
        String admin_loginkey = (String) celebrity.get("value");

        log.info("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
        log.info(admin_loginkey);

        Admin admin = adminService.facelogin(admin_loginkey);

        session.setAttribute("loginadmin", admin);

        //결과를 보낸다
        return "redirect:/";
    }

    @RequestMapping("/getservertime")
    public Object getservertime() {
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = dateFormat.format(date);
        return formattedDate;
    }

}


