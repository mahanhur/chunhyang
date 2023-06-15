package com.chflower.service;

import com.chflower.dto.Message;
import com.chflower.frame.CHService;
import com.chflower.mapper.MessageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageService implements CHService<Integer, Message> {

    @Autowired
    MessageMapper mapper;


    @Override
    public void register(Message message) throws Exception {
        mapper.insert(message);
    }

    @Override
    public void remove(Integer s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Message message) throws Exception {
        mapper.update(message);
    }

    @Override
    public Message get(Integer s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Message> get() throws Exception {
        return mapper.selectall();
    }

    public List<Message> selectreceiver(String m_receiver) {
        return mapper.selectreceiver(m_receiver);
    }
}
