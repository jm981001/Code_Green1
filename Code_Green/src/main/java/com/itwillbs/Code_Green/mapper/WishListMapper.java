package com.itwillbs.Code_Green.mapper;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.WishListVO;

public interface WishListMapper {
	
	//위시리스트 있는지 없는지
	int checkWish(WishListVO wishList, @Param("item_idx")int item_idx, @Param("member_id")String member_id);
	
	//위시리스트 추가
	int insertWish(WishListVO wishList, @Param("item_idx")int item_idx, @Param("member_id")String member_id);

	//위시리스트 삭제
	int removeWish(WishListVO wishList, @Param("item_idx")int item_idx, @Param("member_id")String member_id);

}
