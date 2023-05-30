package com.chflower.service;

import com.chflower.dto.Delinfo;
import com.chflower.frame.CHService;
import com.chflower.mapper.DelinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DelinfoService implements CHService<Integer, Delinfo> {

    @Autowired
    DelinfoMapper mapper;

    @Override
    public void register(Delinfo delinfo) throws Exception {
        mapper.insert(delinfo);
    }

    @Override
    public void remove(Integer del_id) throws Exception {
        mapper.delete(del_id);
    }

    @Override
    public void modify(Delinfo delinfo) throws Exception {
        mapper.update(delinfo);
    }

    @Override
    public Delinfo get(Integer del_id) throws Exception {
        return mapper.select(del_id);
    }

    @Override
    public List<Delinfo> get() throws Exception {
        return mapper.selectall();
    }

}
