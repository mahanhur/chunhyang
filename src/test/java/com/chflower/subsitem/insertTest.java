package com.chflower.subsitem;

import com.chflower.dto.Subsitem;
import com.chflower.service.SubsitemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
public class insertTest {
    @Autowired
    SubsitemService service;
    @Test
    void contextLoads() throws Exception {
        service.register(new Subsitem("6개월 프리미엄", 200000, "6개월 프리미엄", "6premium.jpg"));
        List<Subsitem> subs = null;
        subs = service.get();
        log.info("-----------------------------------------------------------");
        log.info(subs.toString());
        log.info("-----------------------------------------------------------");

    }

}
