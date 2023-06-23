package com.chflower.service;

import com.chflower.dto.Cnt;
import com.chflower.frame.CHService;
import com.chflower.mapper.CntMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CntService implements CHService<Integer, Cnt> {

    @Autowired
    CntMapper mapper;


    @Override
    public void register(Cnt cnt) throws Exception {
        mapper.insert(cnt);
    }

    @Override
    public void remove(Integer s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Cnt cnt) throws Exception {
        mapper.update(cnt);
    }

    @Override
    public Cnt get(Integer s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Cnt> get() throws Exception {
        return mapper.selectall();
    }

    public void subscntinsert() {
        mapper.subscntinsert();
    };
    public void itemcntinsert() {
        mapper.itemcntinsert();
    };
    public int cntsubs() {
        return mapper.cntsubs();
    };
    public int cntitem() {
        return mapper.cntitem();
    };

}
