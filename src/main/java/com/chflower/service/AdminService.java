package com.chflower.service;

import com.chflower.dto.Admin;
import com.chflower.frame.CHService;
import com.chflower.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService implements CHService<Integer, Admin> {

    @Autowired
    AdminMapper mapper;


    @Override
    public void register(Admin admin) throws Exception {
        mapper.insert(admin);
    }

    @Override
    public void remove(Integer s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Admin admin) throws Exception {
        mapper.update(admin);
    }

    @Override
    public Admin get(Integer s) throws Exception {
        return mapper.select(s);
    }
    public Admin makeid() throws Exception {
        return mapper.makeid();
    }

    @Override
    public List<Admin> get() throws Exception {
        return mapper.selectall();
    }
}
