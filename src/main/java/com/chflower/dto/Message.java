package com.chflower.dto;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Message {
    private int m_id;
    private String m_sender;
    private String m_receiver;
    private String m_content;
    private Date m_rdate;
    private int m_check;
    private Date m_checktime;

    public Message(String m_sender, String m_receiver, String m_content) {
        this.m_sender = m_sender;
        this.m_receiver = m_receiver;
        this.m_content = m_content;
    }
}