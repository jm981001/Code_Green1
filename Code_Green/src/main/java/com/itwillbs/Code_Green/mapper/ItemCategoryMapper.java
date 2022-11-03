package com.itwillbs.Code_Green.mapper;

import java.util.List;

import com.itwillbs.Code_Green.vo.ItemVO;

public interface ItemCategoryMapper {

	//카테고리 음료
	List<ItemVO> select_dairy_drink();

	//카테고리 해산물
	List<ItemVO> select_fish();

}
