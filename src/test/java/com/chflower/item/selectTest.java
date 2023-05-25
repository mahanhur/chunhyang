package com.chflower.item;

import com.chflower.dto.Admin;
import com.chflower.dto.Item;
import com.chflower.service.AdminService;
import com.chflower.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
public class selectTest {
    @Autowired
    ItemService service;

    @Test
    void contextLoads() throws Exception {
        List<Item> list = null;
        list = service.get();
        log.info("------------------------------------------------------------------------------");
        for (Item obj : list) {
            log.info(obj.toString());
            log.info("------------------------------------------------------------------------------");
        }
    }
}
