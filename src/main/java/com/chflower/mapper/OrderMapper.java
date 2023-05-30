package com.chflower.mapper;

import com.chflower.dto.Order;
import com.chflower.frame.CHMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper


public interface OrderMapper extends CHMapper<Integer, Order> {
}
