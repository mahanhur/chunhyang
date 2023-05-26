package com.chflower.mapper;

import com.chflower.dto.Notice;
import com.chflower.frame.CHMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface NoticeMapper extends CHMapper<Integer, Notice> {

}
