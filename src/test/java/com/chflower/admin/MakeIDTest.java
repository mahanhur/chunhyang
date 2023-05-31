package com.chflower.admin;

import com.chflower.dto.Admin;
import com.chflower.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class MakeIDTest {

    @Autowired
    AdminService service;
    @Test
void contextLoads() {
        Integer a = null;
    try {
        a = service.makeid();
        log.info("----------------------------------------------------");
//        log.info(intValue());
        log.info("----------------------------------------------------");
    } catch (Exception e) {
        log.info("조회 에러......");
        e.printStackTrace();
        }
    }
}

