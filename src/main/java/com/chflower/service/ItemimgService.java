package com.chflower.service;

import com.chflower.dto.Itemimg;
import com.chflower.frame.CHService;
import com.chflower.mapper.ItemimgMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class ItemimgService implements CHService<Integer, Itemimg> {

    @Autowired
    ItemimgMapper mapper;

    @Override
    public void register(Itemimg itemimg) throws Exception {
        mapper.insert(itemimg);
    }

    @Override
    public void remove(Integer i) throws Exception {
        mapper.delete(i);
    }

    @Override
    public void modify(Itemimg itemimg) throws Exception {
        mapper.update(itemimg);
    }

    @Override
    public Itemimg get(Integer i) throws Exception {
        return mapper.select(i);
    }

    @Override
    public List<Itemimg> get() throws Exception {
        return mapper.selectall();
    }

}