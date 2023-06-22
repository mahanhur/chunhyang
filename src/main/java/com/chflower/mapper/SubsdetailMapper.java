package com.chflower.mapper;

import com.chflower.dto.Cal;
import com.chflower.dto.Subsdetail;
import com.chflower.frame.CHMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface SubsdetailMapper extends CHMapper<Integer, Subsdetail> {
    public void dateupdate(Subsdetail subsdetail);
    public List<Subsdetail> get2(Integer subsdetail_id) ;

    public List<Cal> getcount ();
}
