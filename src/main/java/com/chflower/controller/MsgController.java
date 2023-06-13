package com.chflower.controller;

import com.chflower.dto.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class MsgController {
    @Autowired
    SimpMessagingTemplate template;

    @MessageMapping("/receiveto") // 특정 Id에게 전송
    public void receiveto(Msg msg, SimpMessageHeaderAccessor headerAccessor) {;
        String id = msg.getSendid();
        String target = msg.getReceiveid();
        template.convertAndSend("/send/to/"+id,msg);
        template.convertAndSend("/send/to/"+target,msg);
    }
}
