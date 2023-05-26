package com.chflower.admin;

import com.chflower.dto.Admin;

import com.chflower.service.AdminService;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
public class insertTest {
    @Autowired
    AdminService service;
    @Test
    void contextLoads() throws Exception {
        Admin obj = new Admin(123567,"111111","djdjd","3");
        service.register(obj);
        log.info("-----------------------------------------------------------");
        log.info(obj.toString());
        log.info("-----------------------------------------------------------");

    }

}
