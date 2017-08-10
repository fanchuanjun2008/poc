package com.yonyou.iuap.poc.dao;

import com.yonyou.iuap.poc.entity.DemoKhxx;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.mybatis.type.PageResult;
import com.yonyou.iuap.persistence.mybatis.anotation.MyBatisRepository;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.PageRequest;

import java.util.List;


@MyBatisRepository
public interface DemoKhxxMapper {
	
	//单个增删改查
	int insert(DemoKhxx record);

	int insertSelective(DemoKhxx record);
	
	int updateByPrimaryKeySelective(DemoKhxx record);

    int updateByPrimaryKey(DemoKhxx record);

    int deleteByPrimaryKey(String pk);

    DemoKhxx selectByPrimaryKey(String pk);
    
    
	PageResult<DemoKhxx> selectAllByPage(@Param("page") PageRequest pageRequest, @Param("search") SearchParams searchParams);
    
   //批量操作
    void batchInsert(List<DemoKhxx> addList);

    void batchUpdate(List<DemoKhxx> updateList);

    void batchDeleteByPrimaryKey(List<DemoKhxx> list);

}
