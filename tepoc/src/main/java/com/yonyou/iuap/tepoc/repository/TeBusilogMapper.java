package com.yonyou.iuap.tepoc.repository;

import com.yonyou.iuap.tepoc.entity.TeBusilogVO;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.mybatis.type.PageResult;
import com.yonyou.iuap.persistence.mybatis.anotation.MyBatisRepository;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.PageRequest;

import java.util.List;


@MyBatisRepository
public interface TeBusilogMapper {
	
	//单个增删改查
	int insert(TeBusilogVO record);

	int insertSelective(TeBusilogVO record);
	
	int updateByPrimaryKeySelective(TeBusilogVO record);

    int updateByPrimaryKey(TeBusilogVO record);

    int deleteByPrimaryKey(String pk);

    TeBusilogVO selectByPrimaryKey(String pk);
    
    
	PageResult<TeBusilogVO> selectAllByPage(@Param("page") PageRequest pageRequest, @Param("search") SearchParams searchParams);
    
   //批量操作
    void batchInsert(List<TeBusilogVO> addList);

    void batchUpdate(List<TeBusilogVO> updateList);

    void batchDeleteByPrimaryKey(List<TeBusilogVO> list);
    
}
