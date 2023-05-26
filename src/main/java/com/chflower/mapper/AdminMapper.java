package com.chflower.mapper;

import com.chflower.dto.Admin;
import com.chflower.frame.CHMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface AdminMapper extends CHMapper<Integer, Admin> {

}
