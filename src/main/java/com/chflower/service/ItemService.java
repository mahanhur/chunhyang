package com.chflower.service;

import com.chflower.dto.Item;
import com.chflower.frame.CHService;
import com.chflower.mapper.ItemMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class ItemService implements CHService<Integer, Item> {

    @Autowired
    ItemMapper mapper;

    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param item
     */
    @Override
    public void register(Item item) throws Exception {
        mapper.insert(item);
    }

    @Override
    public void remove(Integer i) throws Exception {
        mapper.delete(i);
    }

    @Override
    public void modify(Item item) throws Exception {
        mapper.update(item);
    }

    @Override
    public Item get(Integer i) throws Exception {
        return mapper.select(i);
    }

    @Override
    public List<Item> get() throws Exception {
        return mapper.selectall();
    }

    public int selectLargestid() throws Exception {
        return mapper.selectLargestid();
    }



}