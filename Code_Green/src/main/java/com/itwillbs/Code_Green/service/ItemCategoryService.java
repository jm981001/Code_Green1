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
	
	// 전체 상품
	public List<ItemVO> select_all(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.select_all(startRow, listLimit, searchType, keyword);
	}
	
	// 유제품/음료
	public List<ItemVO> select_dairy_drink(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.select_dairy_drink(startRow, listLimit, searchType, keyword);
	}

	// 생선
	public List<ItemVO> select_fish(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.select_fish(startRow, listLimit, searchType, keyword);
	}

	// 과일/채소
	public List<ItemVO> select_fruit_vegi(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.select_fruit_vegi(startRow, listLimit, searchType, keyword);
	}

	// 냉동/간편식품
	public List<ItemVO> select_iced_easy(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.select_iced_easy(startRow, listLimit, searchType, keyword);
	}
	
	// 특가 상품
	public List<ItemVO> select_sale() {
		return mapper.select_sale();
	}

	// 간식류
	public List<ItemVO> select_snack(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.select_snack(startRow, listLimit, searchType, keyword);
	}

	
	
	// 전체 글 목록 갯수 조회(전체 상품)
	public int selectAllListCount() {
		return mapper.selectAllListCount();
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

	// 전체 글 목록 갯수 조회(간식류)
	public int selectSnackListCount() {
		return mapper.selectSnackListCount();
	}
	
	

	// 낮은 가격순(유제품/음료)
	public List<ItemVO> selectCheapDairyDrinkList(int startRow, int listLimit) {
		return mapper.selectCheapDairyDrinkList(startRow, listLimit);
	}

	// 높은 가격순(유제품/음료)
	public List<ItemVO> selectExpensiveDairyDrinkList(int startRow, int listLimit) {
		return mapper.selectExpensiveDairyDrinkList(startRow, listLimit);
	}

	// 낮은 가격순(전체 상품)
	public List<ItemVO> selectCheapAllList(int startRow, int listLimit) {
		return mapper.selectCheapAllList(startRow, listLimit);
	}

	// 높은 가격순(전체 상품)
	public List<ItemVO> selectExpensiveAllList(int startRow, int listLimit) {
		return mapper.selectExpensiveAllList(startRow, listLimit);
	}

	// 낮은 가격순(해산물)
	public List<ItemVO> selectCheapFishList(int startRow, int listLimit) {
		return mapper.selectCheapFishList(startRow, listLimit);
	}

	// 높은 가격순(해산물)
	public List<ItemVO> selectExpensiveFishList(int startRow, int listLimit) {
		return mapper.selectExpensiveFishList(startRow, listLimit);
	}

	// 낮은 가격순(과일/채소)
	public List<ItemVO> selectCheapFruitVegiList(int startRow, int listLimit) {
		return mapper.selectCheapFruitVegiList(startRow, listLimit);
	}

	// 높은 가격순(과일/채소)
	public List<ItemVO> selectExpensiveFruitVegiList(int startRow, int listLimit) {
		return mapper.selectExpensiveFruitVegiList(startRow, listLimit);
	}

	// 낮은 가격순(냉동/간편식품)
	public List<ItemVO> selectCheapIcedEasyList(int startRow, int listLimit) {
		return mapper.selectCheapIcedEasyList(startRow, listLimit);
	}

	// 높은 가격순(냉동/간편식품)
	public List<ItemVO> selectExpensiveIcedEasyList(int startRow, int listLimit) {
		return mapper.selectExpensiveIcedEasyList(startRow, listLimit);
	}

	// 낮은 가격순(간식류)
	public List<ItemVO> selectCheapSnackList(int startRow, int listLimit) {
		return mapper.selectCheapSnackList(startRow, listLimit);
	}

	// 높은 가격순(간식류)
	public List<ItemVO> selectExpensiveSnackList(int startRow, int listLimit) {
		return mapper.selectExpensiveSnackList(startRow, listLimit);
	}
	


}
