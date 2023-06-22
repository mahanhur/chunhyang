package com.chflower.service;

import com.chflower.dto.Custchart;
import com.chflower.frame.CHService;
import com.chflower.mapper.CustchartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustchartService implements CHService<Integer, Custchart> {

    @Autowired
    CustchartMapper custchartMapper;

    @Override
    public void register(Custchart custchart) throws Exception {

    }

    @Override
    public void remove(Integer integer) throws Exception {

    }

    @Override
    public void modify(Custchart custchart) throws Exception {

    }

    @Override
    public Custchart get(Integer integer) throws Exception {
        return null;
    }

    @Override
    public List<Custchart> get() throws Exception {
        return null;
    }


    public List<Custchart> getMonthlyTotal() throws Exception {
        return custchartMapper.getMonthlyTotal();
    }
    public List<Custchart> getGenderTotal() throws Exception {
        return custchartMapper.getGenderTotal();
    }
}
