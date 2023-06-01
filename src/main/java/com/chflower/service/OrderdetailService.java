package com.chflower.service;

import com.chflower.dto.Orderdetail;
import com.chflower.frame.CHService;
import com.chflower.mapper.OrderdetailMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class OrderdetailService implements CHService<Integer, Orderdetail> {

    @Autowired
    OrderdetailMapper mapper;

    @Override
    public void register(Orderdetail orderdetail) throws Exception {
        mapper.insert(orderdetail);
    }

    @Override
    public void remove(Integer i) throws Exception {
        mapper.delete(i);
    }

    @Override
    public void modify(Orderdetail orderdetail) throws Exception {
        mapper.update(orderdetail);
    }

    @Override
    public Orderdetail get(Integer i) throws Exception {
        return mapper.select(i);
    }

    @Override
    public List<Orderdetail> get() throws Exception {
        return mapper.selectall();
    }


    public List<Orderdetail> selectOrderdetail(Integer oid) throws Exception {
        return mapper.selectOrderdetail(oid);
    }
}