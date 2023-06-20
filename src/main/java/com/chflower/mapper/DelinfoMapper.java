package com.chflower.mapper;

import com.chflower.dto.Delinfo;
import com.chflower.dto.Subs;
import com.chflower.dto.Subsdetail;
import com.chflower.frame.CHMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface DelinfoMapper extends CHMapper<Integer, Delinfo> {
    public List<Delinfo> center(String del_state) ;
    public Delinfo count();
}
