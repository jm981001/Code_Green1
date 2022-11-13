package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.RecipeMapper;
import com.itwillbs.Code_Green.vo.BoardVO;

@Service
public class RecipeService {
	
	@Autowired
	private RecipeMapper mapper;
	
	//레시피 메인 목록 조회
	public List<BoardVO> recipeList(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectRecipeList(startRow, listLimit, searchType, keyword);
	}
	
	// 전체 글 목록 갯수 조회
	// => 파라미터 : 검색타입, 검색어    리턴타입 : int(listCount)
	public int recipeListCount(String searchType, String keyword) {
		return mapper.selectRecipeListCount(searchType, keyword);
	}
	
	// 게시물 조회수 증가
	public void increaseReadcount(int board_idx) {
		mapper.updateReadcount(board_idx);
		
	}
	// 게시물 상세 정보 조회
	// => 파라미터 : 글번호, 리턴타입 : BoardVO(board)
	public BoardVO recipeDetail(int board_idx) {
		return mapper.selectBoard(board_idx);
	}

}
