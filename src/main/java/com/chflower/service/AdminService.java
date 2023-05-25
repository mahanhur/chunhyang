package com.chflower.service;

import com.chflower.dto.Admin;
import com.chflower.frame.CHService;
import com.chflower.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService implements CHService<String, Admin> {

    @Autowired
    AdminMapper mapper;


    @Override
    public void register(Admin admin) throws Exception {

    }

    @Override
    public void remove(String s) throws Exception {

    }

    @Override
    public void modify(Admin admin) throws Exception {

    }

    @Override
    public Admin get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Admin> get() throws Exception {
        return mapper.selectall();
    }
}
