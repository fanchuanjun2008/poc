package com.yonyou.iuap.poc.dao;

import com.yonyou.iuap.poc.entity.DemoPzxx;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.mybatis.type.PageResult;
import com.yonyou.iuap.persistence.mybatis.anotation.MyBatisRepository;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.PageRequest;

import java.util.List;


@MyBatisRepository
public interface DemoPzxxMapper {
	
	//单个增删改查
	int insert(DemoPzxx record);

	int insertSelective(DemoPzxx record);
	
	int updateByPrimaryKeySelective(DemoPzxx record);

    int updateByPrimaryKey(DemoPzxx record);

    int deleteByPrimaryKey(String pk);

    DemoPzxx selectByPrimaryKey(String pk);
    
    
	PageResult<DemoPzxx> selectAllByPage(@Param("page") PageRequest pageRequest, @Param("search") SearchParams searchParams);
    
   //批量操作
    void batchInsert(List<DemoPzxx> addList);

    void batchUpdate(List<DemoPzxx> updateList);

    void batchDeleteByPrimaryKey(List<DemoPzxx> list);

}
