package com.chflower.service;

import com.chflower.dto.Notice;
import com.chflower.frame.CHService;
import com.chflower.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService implements CHService<Integer, Notice> {

    @Autowired
    NoticeMapper mapper;

    @Override
    public void register(Notice notice) throws Exception {
        mapper.insert(notice);
    }
    @Override
    public void remove(Integer integer) throws Exception {

    }

    @Override
    public void modify(Notice notice) throws Exception {

    }

    @Override
    public Notice get(Integer s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Notice> get() throws Exception {
        return mapper.selectall();
    }
}
