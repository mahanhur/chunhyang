package com.chflower.service;

import com.chflower.dto.Cart;
import com.chflower.frame.CHService;
import com.chflower.mapper.CartMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class CartService implements CHService<Integer, Cart> {
    @Autowired
    CartMapper mapper;

    @Override
    public void register(Cart cart) throws Exception {
        mapper.insert(cart);
    }

    @Override
    public void remove(Integer i) throws Exception {
        mapper.delete(i);
    }

    @Override
    public void modify(Cart cart) throws Exception {
        mapper.update(cart);
    }

    @Override
    public Cart get(Integer i) throws Exception {
        return mapper.select(i);
    }

    @Override
    public List<Cart> get() throws Exception {
        return mapper.selectall();
    }

    public List<Cart> getMyCart(String cid) throws Exception {
        return mapper.getmycart(cid);
    }
    public int countMyCart(String cust_id) throws Exception {
        return mapper.countmycart(cust_id);
    }
    public void delMycart(String cust_id) throws Exception {
        mapper.delmycart(cust_id);
    }
}
