package com.chflower.controller;

import com.chflower.dto.*;
import com.chflower.service.*;
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
import org.springframework.format.annotation.DateTimeFormat;
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
    @Autowired
    DelinfoService delinfoService;
    @Autowired
    ChartService chartService;
    @Autowired
    SubsdetailService subsdetailService;

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
    public Object getcal3() throws Exception {
        List<Cal> list= new ArrayList<>();
        list = subsdetailService.getcount();

        log.info("++++++++++=="+list);
        JSONArray ja = new JSONArray();
        for(Cal obj:list){
            JSONObject jo = new JSONObject();
            jo.put("title","배송예정:"+obj.getCount()+"건");
            jo.put("start",obj.getDuedate());
            jo.put("end", obj.getDuedate());
            jo.put("color","green");
            jo.put("url","/subsdetail");
            log.info("++++++++++++++++++++"+String.valueOf(jo));
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

    @RequestMapping("/getdata")
    public Delinfo getdata(){
        Delinfo count;
        count = delinfoService.count();
        return count;
    }


    @RequestMapping("/chartimpl")
    public Object chartimpl(@DateTimeFormat(pattern = "yyyy-MM-dd") Date date1, @DateTimeFormat(pattern = "yyyy-MM-dd") Date date2){

        JSONObject jo = new JSONObject();
        Chart chart1 = new Chart(date1, date2);
        Integer substotal = chartService.substotal(chart1);

        Chart chart2 = new Chart(date1, date2);
        Integer itemtotal = chartService.itemtotal(chart2);

        if(substotal != null){
            jo.put("substotal", substotal);
        }
        if(itemtotal != null) {
            jo.put("itemtotal", itemtotal);
        }
        return jo;
    }

}


