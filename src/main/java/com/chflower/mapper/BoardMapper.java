package com.chflower.mapper;

import com.chflower.dto.Board;
import com.chflower.frame.CHMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface BoardMapper extends CHMapper<Object, Board> {
    public List<Board> getNotice(String s) throws Exception;
    Board getNoticeOne(Integer i);
    public List<Board> getFa(String s) throws Exception;
    public List<Board> getEvent(String s) throws Exception;

    //sql에서 인서트 업데이트~~등의 결과값은 row값이라서 인티져 타입이다
    Integer updateNotice(Board board);

}

