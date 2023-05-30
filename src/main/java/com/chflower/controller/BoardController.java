package com.chflower.controller;

import com.chflower.dto.Board;
import com.chflower.service.BoardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    BoardService boardService;
    String dir = "board/";

    @RequestMapping("/notice")
    public String notice(Model model) throws Exception {
        List<Board> list = null;
        list = boardService.getNotice("1");
//        log.info("data={}", list.get(0).getNoti_contents());
        model.addAttribute("noticelist",list);
        model.addAttribute("center",dir+"notice");
        return "index";
    }
    @RequestMapping("/fa")
    public String fa(Model model) throws Exception {
        List<Board> list = null;
        list = boardService.getFa("2");
        model.addAttribute("falist",list);
        model.addAttribute("center",dir+"fa");
        return "index";
    }
    @RequestMapping("/event")
    public String event(Model model) throws Exception {
        List<Board> list = null;
        list = boardService.getEvent("3");
        model.addAttribute("eventlist",list);
        model.addAttribute("center",dir+"event");
        return "index";
    }
}
