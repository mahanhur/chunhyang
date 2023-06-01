package com.chflower.service;

import com.chflower.dto.Payment;
import com.chflower.frame.CHService;
import com.chflower.mapper.PaymentMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class PaymentService implements CHService<Integer, Payment> {

    @Autowired
    PaymentMapper mapper;

    @Override
    public void register(Payment payment) throws Exception {
        mapper.insert(payment);
    }

    @Override
    public void remove(Integer i) throws Exception {
        mapper.delete(i);
    }

    @Override
    public void modify(Payment payment) throws Exception {
        mapper.update(payment);
    }

    @Override
    public Payment get(Integer i) throws Exception {
        return mapper.select(i);
    }

    @Override
    public List<Payment> get() throws Exception {
        return mapper.selectall();
    }

}