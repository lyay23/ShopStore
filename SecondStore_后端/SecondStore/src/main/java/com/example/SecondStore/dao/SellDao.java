package com.example.SecondStore.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.SecondStore.entity.Sell;
import org.apache.ibatis.annotations.Mapper;

/**
 * 商家(Sell)表数据库访问层
 */
@Mapper
public interface SellDao extends BaseMapper<Sell> {

}