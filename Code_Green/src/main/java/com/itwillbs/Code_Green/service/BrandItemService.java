package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.BrandItemMapper;
import com.itwillbs.Code_Green.vo.ItemVO;
import com.itwillbs.Code_Green.vo.ManagerVO;

@Service
public class BrandItemService {
	
	@Autowired
	private BrandItemMapper mapper;

	// 브랜드리스트 선택, 메인에 출력 
	public List<ManagerVO> selectBrandList() {
		return mapper.selectBrandList();
	}
	
	// 브랜드 팔로우 유무체크 
	public int brandFollowCheck(int manager_idx, String member_id) {
		return mapper.selectBrandFollow(manager_idx,member_id);
	}
	
	// 아이템 전체리스트 메인에 출력
	public List<ItemVO> selectAllList() {
		return mapper.selectAllList();
	}
	
	// 브랜드별 아이템들 페이지출력용 
	public List<ItemVO> selectBrandPageList(int manager_idx) {
		return mapper.selectBrandPageList(manager_idx);
	}
	
	
	
	
	
	
	
}
