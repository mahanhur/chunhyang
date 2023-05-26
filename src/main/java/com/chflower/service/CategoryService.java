package com.chflower.service;


import com.chflower.dto.Category;
import com.chflower.frame.CHService;
import com.chflower.mapper.CategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService implements CHService<Integer, Category> {
    @Autowired
    CategoryMapper mapper;

    @Override
    public void register(Category category) throws Exception {
        mapper.insert(category);
    }

    @Override
    public void remove(Integer integer) throws Exception {

    }

    @Override
    public void modify(Category category) throws Exception {

    }

    @Override
    public Category get(Integer s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Category> get() throws Exception {
        return mapper.selectall();
    }
}
