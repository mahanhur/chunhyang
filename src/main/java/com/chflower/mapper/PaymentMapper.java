package com.chflower.mapper;

import com.chflower.dto.Payment;
import com.chflower.frame.CHMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper


public interface PaymentMapper extends CHMapper<Integer, Payment> {
}
