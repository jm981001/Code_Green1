package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.ItemCategoryMapper;
import com.itwillbs.Code_Green.vo.ItemVO;

@Service
public class ItemCategoryService {
	
	@Autowired
	private ItemCategoryMapper mapper;
	
	//음료 카테고리
	public List<ItemVO> select_dairy_drink() {
		return mapper.select_dairy_drink();
	}

	//생선 카테고리
	public List<ItemVO> select_fish() {
		return mapper.select_fish();
	}
}
