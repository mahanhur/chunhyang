package com.chflower.subsitem;

import com.chflower.dto.Subsitem;
import com.chflower.mapper.SubsitemMapper;
import com.chflower.service.SubsitemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
public class selectTest {
    @Autowired
    SubsitemService service;
    @Test
    void contextLoads() throws Exception {
            List<Subsitem> subs = null;
            subs = service.get();
            log.info("-----------------------------------------------------------");
            log.info(subs.toString());
            log.info("-----------------------------------------------------------");
    }

}
