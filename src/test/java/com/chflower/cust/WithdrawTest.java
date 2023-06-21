package com.chflower.cust;

import com.chflower.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class WithdrawTest {
    @Autowired
    CustService service;

        @Test
        void contextLoads() {
            try {
                service.withdraw("test01");
            //
        } catch (Exception e) {
            log.info("오류");
        }
    }
}
