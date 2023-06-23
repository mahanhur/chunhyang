package com.chflower.service;

import com.chflower.dto.Subs;
import com.chflower.frame.CHService;
import com.chflower.mapper.SubsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubsService implements CHService<Integer, Subs> {

    @Autowired
    SubsMapper mapper;

    @Override
    public void register(Subs subs) throws Exception {
        mapper.insert(subs);
    }

    @Override
    public void remove(Integer subs_id) throws Exception {
        mapper.delete(subs_id);
    }

    @Override
    public void modify(Subs subs) throws Exception {

    }

    @Override
    public Subs get(Integer subs_id) throws Exception {
        return mapper.select(subs_id);
    }

    @Override
    public List<Subs> get() throws Exception {
        return mapper.selectall();
    }

    public int selectcount() {
        return mapper.selectcount();
    }
}
