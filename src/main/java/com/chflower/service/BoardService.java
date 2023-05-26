package com.chflower.service;

import com.chflower.dto.Board;
import com.chflower.frame.CHService;
import com.chflower.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService implements CHService<Integer, Board> {

    @Autowired
    BoardMapper mapper;

    @Override
    public void register(Board board) throws Exception {
        mapper.insert(board);
    }
    @Override
    public void remove(Integer integer) throws Exception {

    }

    @Override
    public void modify(Board board) throws Exception {

    }

    @Override
    public Board get(Integer s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Board> get() throws Exception {
        return mapper.selectall();
    }

    public List<Board> getNotice(String s) throws Exception {
        return mapper.getNotice(s);
    }

    public List<Board> getFa(String s) throws Exception {
        return mapper.getFa(s);
    }
    public List<Board> getEvent(String s) throws Exception {
        return mapper.getEvent(s);
    }
}
