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
	
	// 브랜드별 아이템리스트 출력
	public List<ItemVO> selectBrandItemList(int manager_idx) {
		return mapper.selectBrandItemList(manager_idx);
	}
	
	// 브랜드별 정보 및 아이템수 출력
	public ManagerVO selectBrandDetail(int manager_idx) {
		return mapper.selectBrandDetail(manager_idx);
	}
	
	
}
