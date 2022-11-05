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
	
	// 유제품/음료
	public List<ItemVO> select_dairy_drink(int startRow, int listLimit) {
		return mapper.select_dairy_drink(startRow, listLimit);
	}

	// 생선
	public List<ItemVO> select_fish(int startRow, int listLimit) {
		return mapper.select_fish(startRow, listLimit);
	}

	// 과일/채소
	public List<ItemVO> select_fruit_vegi(int startRow, int listLimit) {
		return mapper.select_fruit_vegi(startRow, listLimit);
	}

	// 냉동/간편식품
	public List<ItemVO> select_iced_easy(int startRow, int listLimit) {
		return mapper.select_iced_easy(startRow, listLimit);
	}
	
	// 특가 상품
	public List<ItemVO> select_sale() {
		return mapper.select_sale();
	}

	// 간식류
	public List<ItemVO> select_snack(int startRow, int listLimit) {
		return mapper.select_snack(startRow, listLimit);
	}

	// 전체 글 목록 갯수 조회(유제품/음료)
	public int selectDairyDrinkListCount() {
		return mapper.selectDairyDrinkListCount();
	}

	// 전체 글 목록 갯수 조회(해산물)
	public int selectFishListCount() {
		return mapper.selectFishListCount();
	}

	// 전체 글 목록 갯수 조회(과일/채소)
	public int selectFruitVegiListCount() {
		return mapper.selectFruitVegiListCount();
	}

	// 전체 글 목록 갯수 조회(냉동/간편식품)
	public int selectIcedEasyListCount() {
		return mapper.selectIcedEasyListCount();
	}


	// 전체 글 목록 갯수 조회(특가 상품)
//	public int selectSaleListCount() {
//		return mapper.selectSaleListCount();
//	}

	// 전체 글 목록 갯수 조회(특가 상품)
	public int selectSnackListCount() {
		return mapper.selectSnackListCount();
	}

	// 낮은 가격순(유제품/음료)
	public List<ItemVO> selectCheapDairyDrinkList(int startRow, int listLimit) {
		return mapper.selectCheapDairyDrinkList(startRow, listLimit);
	}

	// 낮은 가격순(유제품/음료) 페이징 - 갯수 카운트
//	public int selectCheapDairyDrinkListCount() {
//		return mapper.selectCheapDairyDrinkListCount();
//	}

}
