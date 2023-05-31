package com.chflower.controller;

import com.chflower.dto.Board;
import com.chflower.service.BoardService;
import com.chflower.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    BoardService boardService;
    String dir = "board/";
    @Value("${uploadimgdir}") /*이미지 저장경로*/
    String imgdir;

    @RequestMapping("/notice")
    public String notice(Model model) throws Exception {
        List<Board> list = null;
        list = boardService.getNotice("1");
//        log.info("data={}", list.get(0).getNoti_contents());
        model.addAttribute("noticelist",list);
        model.addAttribute("center",dir+"notice");
        return "index";
    }

    @RequestMapping("/addnotice")
    public String addnotice(Model model){
        model.addAttribute("center",dir+"addnotice");
        return "index";
    }
    @RequestMapping("/addnoticeimpl")
    public String addnoticeimpl(Model model, Board notice) throws Exception {
        notice.setNotiboard_id("1");

        MultipartFile mf1 = notice.getImg1();
        String imgname1 = mf1.getOriginalFilename();
        notice.setNoti_image1(imgname1);
        MultipartFile mf2 = notice.getImg2();
        String imgname2 = mf2.getOriginalFilename();
        notice.setNoti_image2(imgname2);

        boardService.register(notice);
        FileUploadUtil.saveFile(mf1,imgdir);
        FileUploadUtil.saveFile(mf2,imgdir);
        return "redirect:/board/notice";
    }

    @RequestMapping("/noticedetail")
    public String noticedetail(Model model, int noti_id) throws Exception {
        Board notice = null;
        notice = boardService.getNoticeOne(noti_id);
        model.addAttribute("gnotice",notice);
        model.addAttribute("center",dir+"noticedetail");
        return "index";
    }
    @RequestMapping("/updatenoticeimpl")
    public String updatenoticeimpl(Board notice) throws Exception {
        MultipartFile mf1 = notice.getImg1();
        String new_imgname1 = mf1.getOriginalFilename();
        MultipartFile mf2 = notice.getImg2();
        String new_imgname2 = mf2.getOriginalFilename();

        /*이하 파일업로드를 위한..코드...좀더 효율적으로 할순 없을까?*/
        if((new_imgname1.equals("") || new_imgname1 == null)
                &&(new_imgname2.equals("") || new_imgname2 == null)){
            boardService.updateNotice(notice);
        }else if((!new_imgname1.equals("") || new_imgname1 != null)
                &&(new_imgname2.equals("") || new_imgname2 == null)){
            notice.setNoti_image1(new_imgname1);
            boardService.updateNotice(notice);
            FileUploadUtil.saveFile(mf1,imgdir);
        }else if((!new_imgname2.equals("") || new_imgname2 != null)
                &&(new_imgname1.equals("") || new_imgname1 == null)) {
            notice.setNoti_image2(new_imgname2);
            boardService.updateNotice(notice);
            FileUploadUtil.saveFile(mf2, imgdir);
        }else{
            notice.setNoti_image1(new_imgname1);
            notice.setNoti_image2(new_imgname2);
            boardService.updateNotice(notice);
            FileUploadUtil.saveFile(mf1,imgdir);
            FileUploadUtil.saveFile(mf2,imgdir);
        }
        return "redirect:/board/noticedetail?noti_id="+notice.getNoti_id();
    }
    @RequestMapping("/deletenoticeimpl")
    public String deletenoticeimpl(Integer noti_id) throws Exception {
        boardService.remove(noti_id);
        return "redirect:/board/notice";
    }

    @RequestMapping("/fa")
    public String fa(Model model) throws Exception {
        List<Board> list = null;
        list = boardService.getFa("2");
        model.addAttribute("falist",list);
        model.addAttribute("center",dir+"fa");
        return "index";
    }
    @RequestMapping("/addfa")
    public String addfa(Model model){
        model.addAttribute("center",dir+"addfa");
        return "index";
    }
    @RequestMapping("/addfaimpl")
    public String addfaimpl(Model model, Board fa) throws Exception {
        fa.setNotiboard_id("2");
        fa.setNoti_image1("");;
        fa.setNoti_image2("");
        boardService.register(fa);
        return "redirect:/board/fa";
    }
    @RequestMapping("/fadetail")
    public String fadetail(Model model, int noti_id) throws Exception {
        Board fa = null;
        fa = boardService.getFaOne(noti_id);
        model.addAttribute("gfa",fa);
        model.addAttribute("center",dir+"fadetail");
        return "index";
    }
    @RequestMapping("/deletefaimpl")
    public String deletefaimpl(Integer noti_id) throws Exception {
        boardService.remove(noti_id);
        return "redirect:/board/fa";
    }
    @RequestMapping("/updatefaimpl")
    public String updatefaimpl(Board fa) throws Exception {
        fa.setNoti_image1("");
        fa.setNoti_image2("");
        boardService.updateNotice(fa);
        return "redirect:/board/fadetail?noti_id="+fa.getNoti_id();
    }
    @RequestMapping("/event")
    public String event(Model model) throws Exception {
        List<Board> list = null;
        list = boardService.getEvent("3");
        model.addAttribute("eventlist",list);
        model.addAttribute("center",dir+"event");
        return "index";
    }
    @RequestMapping("/addevent")
    public String addevent(Model model){
        model.addAttribute("center",dir+"addevent");
        return "index";
    }
    @RequestMapping("/addeventimpl")
    public String addeventimpl(Model model, Board event) throws Exception {
        event.setNotiboard_id("3");

        MultipartFile mf1 = event.getImg1();
        String imgname1 = mf1.getOriginalFilename();
        event.setNoti_image1(imgname1);
        MultipartFile mf2 = event.getImg2();
        String imgname2 = mf2.getOriginalFilename();
        event.setNoti_image2(imgname2);

        boardService.register(event);
        FileUploadUtil.saveFile(mf1,imgdir);
        FileUploadUtil.saveFile(mf2,imgdir);
        return "redirect:/board/event";
    }
    @RequestMapping("/eventdetail")
    public String eventdetail(Model model, int noti_id) throws Exception {
        Board fa = null;
        fa = boardService.getEventOne(noti_id);
        model.addAttribute("gevent",fa);
        model.addAttribute("center",dir+"eventdetail");
        return "index";
    }
    @RequestMapping("/deleteeventimpl")
    public String deleteeventimpl(Integer noti_id) throws Exception {
        boardService.remove(noti_id);
        return "redirect:/board/event";
    }
}
