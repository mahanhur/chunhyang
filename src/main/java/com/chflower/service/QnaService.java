package com.chflower.service;

import com.chflower.dto.Board;
import com.chflower.dto.Qna;
import com.chflower.frame.CHService;
import com.chflower.mapper.QnaMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class QnaService implements CHService<String, Qna> {
    @Autowired
    QnaMapper mapper;
    @Override
    public void register(Qna qna) throws Exception {
        mapper.insert(qna);
    }

    @Override
    public void remove(String s) throws Exception {

    }

    @Override
    public void modify(Qna qna) throws Exception {
        mapper.update(qna);
    }

    @Override
    public Qna get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Qna> get() throws Exception {
        return mapper.selectall();
    }
    public Qna getOne(Integer i) throws Exception {
        return mapper.getOne(i);
    }

}
