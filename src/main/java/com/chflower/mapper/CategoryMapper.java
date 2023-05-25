package com.chflower.mapper;

import com.chflower.dto.Category;
import com.chflower.frame.CHMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CategoryMapper extends CHMapper<Integer, Category> {
}
