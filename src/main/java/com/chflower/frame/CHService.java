package com.chflower.frame;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface CHService <K, V>{

    @Transactional
    public void register(V v) throws Exception;
    @Transactional
    public void remove(K k) throws Exception;
    @Transactional
    public void modify(V v) throws Exception;
    @Transactional(readOnly = true)
    public V get(K k) throws Exception;
    @Transactional(readOnly = true)
    public List<V> get() throws Exception;
}