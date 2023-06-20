package com.chflower.mapper;

import com.chflower.dto.Itemimg;
import com.chflower.frame.CHMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper


public interface ItemimgMapper extends CHMapper<Integer, Itemimg> {
    public List<Itemimg> selectimg(int item_id);
}
