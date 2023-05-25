package com.chflower.service;

import com.chflower.dto.Subsitem;
import com.chflower.frame.CHService;
import com.chflower.mapper.SubsitemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubsitemService implements CHService<Integer, Subsitem> {

    @Autowired
    SubsitemMapper mapper;

    @Override
    public void register(Subsitem subsitem) throws Exception {

    }

    @Override
    public void remove(Integer subsitem_id) throws Exception {

    }

    @Override
    public void modify(Subsitem subsitem) throws Exception {

    }

    @Override
    public Subsitem get(Integer subsitem_id) throws Exception {
        return null;
    }

    @Override
    public List<Subsitem> get() throws Exception {
        return mapper.selectall();
    }
}
