package com.chflower.service;

import com.chflower.dto.Cust;
import com.chflower.frame.CHService;
import com.chflower.mapper.CustMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class CustService implements CHService <String, Cust> {

    @Autowired
    CustMapper mapper;
    @Override
    public void register(Cust cust) throws Exception {
        mapper.insert(cust);
    }

    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Cust cust) throws Exception {
        mapper.update(cust);
    }
    public void withdraw(String cust_id) throws Exception {
        mapper.withdraw(cust_id);
    }
    @Override
    public Cust get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Cust> get() throws Exception {
        return mapper.selectall();
    }
}
