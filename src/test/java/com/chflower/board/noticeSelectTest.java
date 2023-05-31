package com.chflower.board;

import com.chflower.dto.Board;
import com.chflower.service.BoardService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class noticeSelectTest {

    @Autowired
    BoardService boardService;
    @Test
void contextLoads() {
        Board notice = null;
    try {
        notice = boardService.getNoticeOne(1);
        log.info("----------------------------------------------------");
        log.info(notice.toString());
        log.info("----------------------------------------------------");
    } catch (Exception e) {
        log.info("조회 에러......");
        e.printStackTrace();
        }
    }
}

