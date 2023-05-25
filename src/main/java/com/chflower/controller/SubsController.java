package com.chflower.controller;

import com.chflower.dto.Subsitem;
import com.chflower.service.SubsitemService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
@RequestMapping("/subs")
public class SubsController {

    @Autowired
    SubsitemService subsitemService;
    String dir = "subs";
    @RequestMapping("")
    public String item(Model model){
        List<Subsitem> list = null;
        try {
            list = subsitemService.get();
            model.addAttribute("slist",list);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        model.addAttribute("center", dir);
        return "index";
    }


}
