package com.chflower.mapper;

import com.chflower.dto.Orderdetail;
import com.chflower.frame.CHMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper


public interface OrderdetailMapper extends CHMapper<Integer, Orderdetail> {
    public List<Orderdetail> selectOrderdetail(Integer oid);

}
