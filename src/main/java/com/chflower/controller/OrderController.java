package com.chflower.controller;

import com.chflower.dto.Item;
import com.chflower.dto.Itemimg;
import com.chflower.dto.Order;
import com.chflower.service.ItemService;
import com.chflower.service.ItemimgService;
import com.chflower.service.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    ItemService itemService;
    @Autowired
    ItemimgService itemimgService;
    @Autowired
    OrderService orderService;

    @Value("${uploadimgdir}") /*이미지 저장경로*/
            String uploadimgdir;
    String dir = "order/";


    //127.0.0.1/order
    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Order> list = null;
        list = orderService.get();

        model.addAttribute("olist", list);
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "all");
        return "index";
    }


    @RequestMapping("/delitem")
    public String delitem(Model model, int item_id) throws Exception {
        log.info("=========================================="+ item_id);

        itemService.remove(item_id);
        itemimgService.remove(item_id);

        return "redirect:/item";
    }
    @RequestMapping("/detail")
    public String detail(Model model, int item_id, Item item, Itemimg itemimg) throws Exception {

        item = itemService.get(item_id);
        List<Itemimg> list= new ArrayList<>();
        list = itemimgService.get();
        log.info("---------------------"+list);

        List<Itemimg> ilist = new ArrayList<>();
        for (Itemimg obj : list) {
            if (obj.getItem_id() == item_id) {
                ilist.add(obj);
            }
        }
            log.info("=================="+ilist);

        model.addAttribute("detail", item);
        model.addAttribute("img", itemimg);
        model.addAttribute("ilist", ilist);
        model.addAttribute("center", dir+"detail");
        return "index";
    }
}
