package com.chflower.controller;


import com.chflower.dto.Board;
import com.chflower.dto.Qna;
import com.chflower.service.QnaService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/qna")
public class QnAController {

    @Autowired
    QnaService qnaService;
    String dir = "qna/";
    @Value("${uploadimgdir}") /*이미지 저장경로*/
    String imgdir;

    @RequestMapping("/qna")
    public String qna(Model model) throws Exception {
        List<Qna> list = null;
        list = qnaService.get();
        model.addAttribute("qlist",list);
        model.addAttribute("center",dir+"qna");
        return "index";
    }
    @RequestMapping("/qnadetail")
    public String qnadetail(Model model, int qna_id) throws Exception {
        Qna qna = null;
        qna = qnaService.getOne(qna_id);
        model.addAttribute("gqna",qna);
        model.addAttribute("center",dir+"qnadetail");
        return "index";
    }

    @RequestMapping("/answerimpl")
    public String answerimpl(Model model, Qna qna) throws Exception {
        qnaService.register(qna);
        return "redirect:/qna/qnadetail?qna_id="+qna.getQna_id();
    }

    @RequestMapping("/updateanswerimpl")
    public String updateanswerimpl(Qna qna) throws Exception {
        qnaService.modify(qna);
        return "redirect:/qna/qnadetail?qna_id="+qna.getQna_id();
    }
}
