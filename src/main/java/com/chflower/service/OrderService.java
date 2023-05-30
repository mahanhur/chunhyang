package com.chflower.service;

import com.chflower.dto.Order;
import com.chflower.frame.CHService;
import com.chflower.mapper.OrderMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class OrderService implements CHService<Integer, Order> {

    @Autowired
    OrderMapper mapper;

    @Override
    public void register(Order order) throws Exception {
        mapper.insert(order);
    }

    @Override
    public void remove(Integer i) throws Exception {
        mapper.delete(i);
    }

    @Override
    public void modify(Order order) throws Exception {
        mapper.update(order);
    }

    @Override
    public Order get(Integer i) throws Exception {
        return mapper.select(i);
    }

    @Override
    public List<Order> get() throws Exception {
        return mapper.selectall();
    }

}