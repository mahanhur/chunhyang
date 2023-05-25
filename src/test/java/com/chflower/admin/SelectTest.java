package com.chflower.admin;

import com.chflower.dto.Admin;
import com.chflower.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectTest {

    @Autowired
    AdminService service;
    @Test
void contextLoads() {
        Admin a = null;
    /*Cust cust = null;*/
    try {
        a = service.get(10000);
        log.info("----------------------------------------------------");
        log.info(a.toString());
        log.info("----------------------------------------------------");
    } catch (Exception e) {
        log.info("조회 에러......");
        e.printStackTrace();
        }
    }
}

