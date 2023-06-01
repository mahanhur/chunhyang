package com.chflower.service;

import com.chflower.dto.Point;
import com.chflower.frame.CHService;
import com.chflower.mapper.PointMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PointService implements CHService<String, Point> {

    @Autowired
    PointMapper mapper;

    @Override
    public void register(Point point) throws Exception {
    }

    @Override
    public void remove(String cust_id) throws Exception {
    }

    @Override
    public void modify(Point point) throws Exception {
    }

    @Override
    public Point get(String cust_id) throws Exception {
        return mapper.select(cust_id);
    }

    @Override
    public List<Point> get() throws Exception {
        return mapper.selectall();
    }
}
