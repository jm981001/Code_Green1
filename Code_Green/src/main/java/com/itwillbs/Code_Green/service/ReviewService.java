package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.ReviewMapper;
import com.itwillbs.Code_Green.vo.BoardStarVO;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.File_ItemVO;
import com.itwillbs.Code_Green.vo.File_boardVO;

@Service
public class ReviewService {
	@Autowired
	private ReviewMapper mapper;

	
	//리뷰 등록
	public int registReview(BoardVO board) {
		return mapper.insertReview(board);
	}

	//리뷰 삭제
	public int removeReview(String board_idx) {
		return mapper.deleteReview(board_idx);
	}

	//마이페이지 작성글 리스트 
	public List<BoardVO> boardList(int startRow, int listLimit, String member_id) {
		return  mapper.selectBoardList(startRow, listLimit, member_id);
	}

	//마이페이지 작성글 갯수
	public int getBoardListCount() {
		return mapper.selectItemListCount();
	}

	//리뷰 파일업로드
	public int registReview_file(File_boardVO file) {
		return mapper.insertFile(file);
	}

	//별점 등록
	public int StarScore(BoardStarVO star) {
		return mapper.insertStar(star);
		
	}

}
