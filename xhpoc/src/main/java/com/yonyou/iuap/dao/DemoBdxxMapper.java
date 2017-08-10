package com.yonyou.iuap.dao;

import com.yonyou.iuap.poc.entity.DemoBdxx;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.mybatis.type.PageResult;
import com.yonyou.iuap.persistence.mybatis.anotation.MyBatisRepository;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.PageRequest;

import java.util.List;


@MyBatisRepository
public interface DemoBdxxMapper {
	
	//单个增删改查
	int insert(DemoBdxx record);

	int insertSelective(DemoBdxx record);
	
	int updateByPrimaryKeySelective(DemoBdxx record);

    int updateByPrimaryKey(DemoBdxx record);

    int deleteByPrimaryKey(String pk);

    DemoBdxx selectByPrimaryKey(String pk);
    
    
	PageResult<DemoBdxx> selectAllByPage(@Param("page") PageRequest pageRequest, @Param("search") SearchParams searchParams);
    
   //批量操作
    void batchInsert(List<DemoBdxx> addList);

    void batchUpdate(List<DemoBdxx> updateList);

    void batchDeleteByPrimaryKey(List<DemoBdxx> list);
    
}
