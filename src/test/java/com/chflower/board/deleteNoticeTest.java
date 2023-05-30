package com.chflower.board;

import com.chflower.dto.Board;
import com.chflower.service.BoardService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class deleteNoticeTest {
    @Autowired
    BoardService boardService;
    @Test
    void contextLoads() throws Exception {
        boardService.remove(4);
        log.info("-----------------------------------------------------------");

        log.info("-----------------------------------------------------------");

    }

}
