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

	// 전체 브랜드아이템 리스트 메인출력
	List<ItemVO> selectAllList();

	// 브랜드별 아이템들 페이지출력용 
	List<ItemVO> selectBrandPageList(@Param("manager_idx")int manager_idx);

}
