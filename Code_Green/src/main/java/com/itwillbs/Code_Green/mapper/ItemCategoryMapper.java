package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.File_ItemVO;
import com.itwillbs.Code_Green.vo.ItemVO;

public interface ItemCategoryMapper {

	// 전체 상품
	List<ItemVO> select_all(@Param("startRow")int startRow, @Param("listLimit")int listLimit);
	
	// 유제품/음료
	List<ItemVO> select_dairy_drink(@Param("startRow")int startRow, @Param("listLimit")int listLimit);

	// 해산물
	List<ItemVO> select_fish(@Param("startRow")int startRow, @Param("listLimit")int listLimit);

	// 과일/채소
	List<ItemVO> select_fruit_vegi(@Param("startRow")int startRow, @Param("listLimit")int listLimit);

	// 냉동/간편식품
	List<ItemVO> select_iced_easy(@Param("startRow")int startRow, @Param("listLimit")int listLimit);

	// 특가 상품
	List<ItemVO> select_sale();

	// 간식류 
	List<ItemVO> select_snack(@Param("startRow")int startRow, @Param("listLimit")int listLimit);
	
	
	// 전체 글 목록 갯수 조회(전체 상품)
	int selectAllListCount();

	// 전체 글 목록 갯수 조회(유제품/음료)
	int selectDairyDrinkListCount();

	// 전체 글 목록 갯수 조회(해산물)
	int selectFishListCount();

	// 전체 글 목록 갯수 조회(과일/채소)
	int selectFruitVegiListCount();

	// 전체 글 목록 갯수 조회(냉동/간편식품)
	int selectIcedEasyListCount();

	// 전체 글 목록 갯수 조회(간식류)
	int selectSnackListCount();

	
	
	// 낮은 가격순(유제품/음료)
	List<ItemVO> selectCheapDairyDrinkList(@Param("startRow")int startRow, @Param("listLimit")int listLimit);

	// 낮은 가격순(유제품/음료) 페이징 - 갯수 카운트
//	int selectCheapDairyDrinkListCount();
	
	

}
