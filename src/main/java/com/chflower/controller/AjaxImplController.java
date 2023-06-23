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
    @Autowired
    CustchartService custchartService;

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
            jo.put("url","/subs/subsdetail");
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

        JSONObject jo1 = new JSONObject();
        Chart chart1 = new Chart(date1, date2);
        Integer substotal = chartService.substotal(chart1);
        Integer itemtotal = chartService.itemtotal(chart1);
        Integer custcount = chartService.custcount(chart1);
        Integer delfincount = chartService.delfincount(chart1);
        Integer reviewcount = chartService.reviewcount(chart1);
        Double reviewscore = chartService.reviewscore(chart1);



        List<Chart> itemtop10 ;
        itemtop10 = chartService.itemtop10(chart1);

        JSONArray ja = new JSONArray();
        for (int i = 0; i < 10; i++) {
            JSONObject item = new JSONObject();
            item.put("rownum", itemtop10.get(i).getRownum());
            item.put("name", itemtop10.get(i).getItem_name());
            item.put("cnt", itemtop10.get(i).getItem_cnt());
            item.put("price", itemtop10.get(i).getItem_price());
            item.put("amount", itemtop10.get(i).getItem_amount());
            ja.add(item);
        }
        jo1.put("ja", ja);

        if(substotal != null){
            jo1.put("substotal", substotal);
        }
        if(itemtotal != null) {
            jo1.put("itemtotal", itemtotal);
        }
        if(custcount != null) {
            jo1.put("custcount", custcount);
        }
        if(delfincount != null) {
            jo1.put("delfincount", delfincount);
        }
        if(reviewcount != null) {
            jo1.put("reviewcount", reviewcount);
        }
        if(reviewscore != null) {
            jo1.put("reviewscore", reviewscore);
        }
        return jo1;
    }

    @RequestMapping("/custchartimpl")
    public Object custchartimpl() throws Exception {

        List<Custchart> list = custchartService.getMonthlyTotal();
        JSONArray fma = new JSONArray();
        JSONArray ma = new JSONArray();
        for (Custchart c : list) {
            if (c.getGender().equals("2")) {
                fma.add(c.getTotal());
            } else {
                ma.add(c.getTotal());
            }
        }
        JSONObject fmo = new JSONObject();
        JSONObject mo = new JSONObject();

        fmo.put("name", "Female");
        fmo.put("data", fma);
        mo.put("name", "Male");
        mo.put("data", ma);
        JSONArray data = new JSONArray();
        data.add(fmo);
        data.add(mo);

        return data;
    }

    //==============================회원차트 만들기==================================
    @RequestMapping("/chartimpl2")
    public Object chartimpl2(@DateTimeFormat(pattern = "yyyy-MM-dd") Date date1,
                             @DateTimeFormat(pattern = "yyyy-MM-dd") Date date2){

        JSONObject jo2 = new JSONObject();
        Chart chart2 = new Chart(date1, date2);

        Integer mantotalsales = chartService.mantotalsales(chart2);
        Integer womantotalsales = chartService.womantotalsales(chart2);

        JSONArray ja = new JSONArray();
        jo2.put("ja", ja);

        jo2.put("mantotalsales", mantotalsales);
        jo2.put("womantotalsales", womantotalsales);

        return jo2;
    }

}


