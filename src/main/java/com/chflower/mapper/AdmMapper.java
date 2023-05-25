package com.chflower.mapper;

import com.chflower.dto.Adm;

import com.chflower.frame.CHMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface AdmMapper extends CHMapper<String, Adm> {

}
