package com.chflower.admin;

import com.chflower.dto.Admin;
import com.chflower.dto.Subsitem;
import com.chflower.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
public class selectTest {
    @Autowired
    AdminService service;
    @Test
    void contextLoads() throws Exception {
            List<Admin> admin = null;
            admin = service.get();
            log.info("------------------------------------------------------------------------------");
            log.info(admin.toString());
            log.info("------------------------------------------------------------------------------");
    }

}
