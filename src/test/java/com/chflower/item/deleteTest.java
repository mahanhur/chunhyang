package com.chflower.item;

import com.chflower.dto.Item;
import com.chflower.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
class deleteTest {
    @Autowired
    ItemService service;

    @Test
    void contextLoads() {
        List<Item> list = null;

        try {
            service.remove(203);
            log.info("삭제완료");
        } catch (Exception e) {

            log.info("......에러다.........");
            e.printStackTrace();
        }

    }
}

