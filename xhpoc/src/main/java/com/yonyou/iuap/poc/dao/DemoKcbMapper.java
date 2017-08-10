package com.yonyou.iuap.poc.dao;

import com.yonyou.iuap.poc.entity.DemoKcb;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.mybatis.type.PageResult;
import com.yonyou.iuap.persistence.mybatis.anotation.MyBatisRepository;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.PageRequest;

import java.util.List;


@MyBatisRepository
public interface DemoKcbMapper {
	
	//单个增删改查
	int insert(DemoKcb record);

	int insertSelective(DemoKcb record);
	
	int updateByPrimaryKeySelective(DemoKcb record);

    int updateByPrimaryKey(DemoKcb record);

    int deleteByPrimaryKey(String pk);

    DemoKcb selectByPrimaryKey(String pk);
    
    
	PageResult<DemoKcb> selectAllByPage(@Param("page") PageRequest pageRequest, @Param("search") SearchParams searchParams);
    
   //批量操作
    void batchInsert(List<DemoKcb> addList);

    void batchUpdate(List<DemoKcb> updateList);

    void batchDeleteByPrimaryKey(List<DemoKcb> list);
    
}
