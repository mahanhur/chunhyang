package com.chflower.item;

import com.chflower.dto.Item;
import com.chflower.dto.Subsitem;
import com.chflower.service.ItemService;
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
    ItemService service;
    @Test
    void contextLoads() throws Exception {
        Item obj = new Item(1,"10.jpg","abc",10,10000,"아름다운 에비씨","11.jpg","12.jpg","13.jpg","14.jpg",null,"blue",2,"M");
        service.register(obj);

        log.info("-----------------------------------------------------------");
        log.info("등록정상");
        log.info("-----------------------------------------------------------");

    }
    

}
