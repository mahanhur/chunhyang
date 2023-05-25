package com.chflower.mapper;

import com.chflower.dto.Cust;
import com.chflower.frame.CHMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CustMapper extends CHMapper<String, Cust> {
}

