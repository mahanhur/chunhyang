package com.chflower.mapper;

import com.chflower.dto.Custchart;
import com.chflower.frame.CHMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CustchartMapper extends CHMapper<Integer, Custchart> {
    List<Custchart> getMonthlyTotal();
    List<Custchart> getGenderTotal();
    List<Custchart> getAgeTotal();
}
