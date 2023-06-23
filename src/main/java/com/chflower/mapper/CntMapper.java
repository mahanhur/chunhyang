package com.chflower.mapper;

import com.chflower.dto.Cnt;
import com.chflower.dto.Subs;
import com.chflower.frame.CHMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CntMapper extends CHMapper<Integer, Cnt> {
    int cntsubs();
    int cntitem();
    void subscntinsert();
    void itemcntinsert();
}
