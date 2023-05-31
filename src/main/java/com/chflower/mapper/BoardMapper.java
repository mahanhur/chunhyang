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
    Board getFaOne(Integer i);
    public List<Board> getEvent(String s) throws Exception;
    Board getEventOne(Integer i);
    //sql에서 인서트 업데이트~~등의 결과값은 row값이라서 인티져 타입이다(노션에 참고할곳 싸이트 링크해놓음)
    Integer updateNotice(Board board);

}

