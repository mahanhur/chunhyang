package com.chflower.mapper;

import com.chflower.dto.Message;
import com.chflower.frame.CHMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MessageMapper extends CHMapper<Integer, Message> {

    public List<Message> selectreceiver(String m_receiver);
}
