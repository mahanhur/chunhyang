package com.chflower.controller;

import com.chflower.dto.*;
import com.chflower.service.*;
import com.chflower.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;


@Slf4j
@Controller
@RequestMapping("/chart")
public class ChartController {

    @Autowired
    SubsitemService subsitemService;
    @Autowired
    SubsService subsService;
    @Autowired
    SubsdetailService subsdetailService;
    @Autowired
    DelinfoService delinfoService;
    @Autowired
    ChartService chartService;

    String dir = "chart";
    @RequestMapping("/livechart")
    public String livechart(Model model){
        model.addAttribute("center",  dir+"/livechart");
        return "index";
    }
    @RequestMapping("/livechart2")
    public String livechart2(Model model, Date date1, Date date2){

        model.addAttribute("center",  dir+"/livechart2");
        return "index";
    }
    @RequestMapping("/chart")
    public String chart(Model model){

        List<Chart> subsamount1 ;
        subsamount1 = chartService.subsamounttop10();
        model.addAttribute("subsamount", subsamount1);

        List<Chart> itemamount1 ;
        itemamount1 = chartService.itemamounttop10();
        model.addAttribute("itemamount", itemamount1);

        List<Chart> subsamount2 ;
        subsamount2 = chartService.subsamountworst10();
        model.addAttribute("subsamount2", subsamount2);

        List<Chart> itemamount2 ;
        itemamount2 = chartService.itemamountworst10();
        model.addAttribute("itemamount2", itemamount2);

        model.addAttribute("center",  dir+"/chart");
        return "index";
    }

    @RequestMapping("/custchart")
    public String custchart(Model model){

        List<Chart> subsamount1 ;
        subsamount1 = chartService.subsamounttop10();
        model.addAttribute("subsamount", subsamount1);

        List<Chart> itemamount1 ;
        itemamount1 = chartService.itemamounttop10();
        model.addAttribute("itemamount", itemamount1);

        List<Chart> subsamount2 ;
        subsamount2 = chartService.subsamountworst10();
        model.addAttribute("subsamount2", subsamount2);

        List<Chart> itemamount2 ;
        itemamount2 = chartService.itemamountworst10();
        model.addAttribute("itemamount2", itemamount2);

        model.addAttribute("center",  dir+"/custchart");
        return "index";
    }


}
