package com.chflower.board;

import com.chflower.dto.Board;
import com.chflower.service.BoardService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class updateNoticeTest {
    @Autowired
    BoardService boardService;
    @Test
    void contextLoads() throws Exception {
//        boardService.updateNotice(new Board("d",10000,"1",
//                "테스트잘되냐","하노노노노노노논",null,null,null,null));
        log.info("-----------------------------------------------------------");

        log.info("-----------------------------------------------------------");

    }

}
