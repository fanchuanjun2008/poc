package com.yonyou.iuap.poc.dao;

import com.yonyou.iuap.poc.entity.DemoFhb;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.mybatis.type.PageResult;
import com.yonyou.iuap.persistence.mybatis.anotation.MyBatisRepository;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.PageRequest;

import java.util.List;


@MyBatisRepository
public interface DemoFhbMapper {
	
	//单个增删改查
	int insert(DemoFhb record);

	int insertSelective(DemoFhb record);
	
	int updateByPrimaryKeySelective(DemoFhb record);

    int updateByPrimaryKey(DemoFhb record);

    int deleteByPrimaryKey(String pk);

    DemoFhb selectByPrimaryKey(String pk);
    
    
	PageResult<DemoFhb> selectAllByPage(@Param("page") PageRequest pageRequest, @Param("search") SearchParams searchParams);
    
   //批量操作
    void batchInsert(List<DemoFhb> addList);

    void batchUpdate(List<DemoFhb> updateList);

    void batchDeleteByPrimaryKey(List<DemoFhb> list);
    
}
