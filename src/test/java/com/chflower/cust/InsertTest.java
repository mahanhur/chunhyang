package com.chflower.cust;

import com.chflower.dto.Cust;
import com.chflower.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

@Slf4j
@SpringBootTest
class InsertTest {
    @Autowired
    CustService service;
    @Test
    void contextLoads() {
        Cust obj = new Cust("test01", "김하연", "pwd01", "01022223333", 10, "test@naver.com", null);
        try {
            service.register(obj);
            log.info("등록 정상");
        } catch (Exception e) {
            if(e instanceof DuplicateKeyException){
                log.info("ID가 중복 되었습니다.-------------------------------");

            }else{
                log.info("시스템 장애입니다.----------------------------------");
                e.printStackTrace();
            }
        }
    }
}
