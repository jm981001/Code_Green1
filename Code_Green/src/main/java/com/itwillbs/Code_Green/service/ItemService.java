package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.ItemMapper;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.ItemVO;


@Service
public class ItemService {

	@Autowired
	private ItemMapper mapper;
	
	//상품 조회수 증가
	public void increaseReadcount(int item_idx) {
		mapper.updateReadcount(item_idx);
	}


	//상품 상세정보 조회
	public ItemVO getItem(int item_idx) {
		return mapper.selectItem(item_idx);
	}

	//상품 후기 조회
	public List<BoardVO> getReview(int startRow, int listLimit, String searchType,int item_idx) {
		return mapper.selectReview(startRow, listLimit,searchType,item_idx);
	}

	// 상품 후기 갯수 조회
	public int getReviewListCount(String searchType) {
		return mapper.selectReviewListCount(searchType);
	}


	//상품 리스트
	public List<ItemVO> itemList(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectItemList(startRow, listLimit, searchType, keyword);
	}

	//상품 갯수
	public int getItemListCount(String searchType, String keyword) {
		return mapper.selectItemListCount(searchType, keyword);
	}
	
}
