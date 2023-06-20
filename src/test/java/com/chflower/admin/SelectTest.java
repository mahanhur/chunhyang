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
        service.facelogin("마동석");
    }
}

