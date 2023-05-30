package com.chflower.mapper;

import com.chflower.dto.Delinfo;
import com.chflower.dto.Subs;
import com.chflower.frame.CHMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface DelinfoMapper extends CHMapper<Integer, Delinfo> {

}
