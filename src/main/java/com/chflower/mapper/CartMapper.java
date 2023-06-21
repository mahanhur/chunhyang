package com.chflower.mapper;

import com.chflower.dto.Cart;
import com.chflower.frame.CHMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CartMapper extends CHMapper<Integer, Cart> {
    public List<Cart> getmycart(String cid);
    public int countmycart(String cust_id);

    public void delmycart(String cust_id);
}
