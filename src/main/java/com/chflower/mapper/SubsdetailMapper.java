package com.chflower.mapper;

import com.chflower.dto.Subsdetail;
import com.chflower.frame.CHMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface SubsdetailMapper extends CHMapper<Integer, Subsdetail> {
    public void dateupdate(Subsdetail subsdetail);
}
