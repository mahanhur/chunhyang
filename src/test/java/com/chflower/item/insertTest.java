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
//        Item obj = new Item(1,"null","Lavender",10,10000,"향기로운 라벤다",null,null,null,null,null,"blue",2,"M");
//        Item obj = new Item(1,"Lavender",10,10000,"향기로운 라벤다","blue",2,"M");
  //      service.register(obj);

        log.info("-----------------------------------------------------------");
        log.info("등록정상");
        log.info("-----------------------------------------------------------");

    }
    

}
