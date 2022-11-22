package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.ItemVO;
import com.itwillbs.Code_Green.vo.ManagerVO;

public interface BrandItemMapper {
	
	// 브랜드리스트 가져와서 메인에 출력
	List<ManagerVO> selectBrandList();

	// 브랜드 팔로우 유무확인
	int selectBrandFollow(@Param("manager_idx")int manager_idx, @Param("member_id") String member_id);


}
