package com.chflower.service;

import com.chflower.dto.Chart;
import com.chflower.frame.CHService;
import com.chflower.mapper.ChartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChartService implements CHService<Integer, Chart> {

    @Autowired
    ChartMapper mapper;


    @Override
    public void register(Chart chart) throws Exception {
    }

    @Override
    public void remove(Integer s) throws Exception {
    }

    @Override
    public void modify(Chart chart) throws Exception {
    }

    @Override
    public Chart get(Integer s) throws Exception {
        return null;
    }

    @Override
    public List<Chart> get() throws Exception {
        return null;
    }
    public List<Chart> subsamounttop10() {
        return mapper.subsamounttop10();
    }
    public List<Chart> itemamounttop10() {
        return mapper.itemamounttop10();
    }
    public List<Chart> subsamountworst10() {
        return mapper.subsamountworst10();
    }
    public List<Chart> itemamountworst10() {
        return mapper.itemamountworst10();
    }

    public Integer substotal(Chart chart) {
        return mapper.substotal(chart);
    }

    public Integer itemtotal(Chart chart) {
        return mapper.itemtotal(chart);
    }


}
