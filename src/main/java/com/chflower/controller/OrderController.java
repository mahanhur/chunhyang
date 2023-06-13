package com.chflower.controller;

import com.chflower.dto.Order;
import com.chflower.dto.Orderdetail;
import com.chflower.dto.Payment;
import com.chflower.service.*;
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
    @Autowired
    OrderdetailService orderdetailService;
    @Autowired
    PaymentService paymentService;

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
    public String detail(Model model, int order_id, Order order, Orderdetail orderdetail,
                         Payment payment) throws Exception {
        order = orderService.get(order_id);
        payment = paymentService.get(order_id);
//        item = itemService.get(item_id);


        List<Orderdetail> list = new ArrayList<>();
        list = orderdetailService.selectOrderdetail(order_id);
//
//        List<Orderdetail> olist = new ArrayList<>();
//
//        for (Orderdetail obj : list) {
//            if (obj.getOrder_id() == orderdetail.getOrder_id()) {
//                olist.add(obj);
//            }
//        }
        log.info("++++++++++++++++++"+list);
//        log.info("=================="+olist);


        model.addAttribute("olist", list);
        model.addAttribute("order", order);
        model.addAttribute("payment", payment);
//        model.addAttribute("item", item);
        model.addAttribute("center", dir+"detail");
        return "index";
    }
}
