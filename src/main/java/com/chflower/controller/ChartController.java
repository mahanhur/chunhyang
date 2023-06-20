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

import java.util.Date;
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
    @RequestMapping("/chart")
    public String chart(Model model){
        List<Chart> subscnt ;
        subscnt = chartService.subscnttop10();
        model.addAttribute("subscnt", subscnt);

        model.addAttribute("center",  dir+"/chart");
        return "index";
    }



}
