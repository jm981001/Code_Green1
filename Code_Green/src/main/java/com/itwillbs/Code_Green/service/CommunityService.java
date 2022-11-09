package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.CommunityMapper;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.ReportVO;

@Service
public class CommunityService {
	
	@Autowired
	private CommunityMapper mapper;
	

	// 전체 글 목록 조회 
	public List<BoardVO> getCommunityList(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectCommunityList(startRow, listLimit, searchType, keyword);
	}

	// 전체 글 목록 갯수 조회 
	public int getCommunityListCount(String searchType, String keyword) {
		return mapper.selectCommunityListCount(searchType, keyword);
	}

	// 게시글 조회수 증가 
	public void increaseReadcount(int board_idx) {
		mapper.updateReadcount(board_idx);
	}
	
	// 게시글 상세조회
	public BoardVO getBoardDetail(int board_idx) {
		return mapper.selectBoardDetail(board_idx);
	}

	// 게시글 삭제 
	public int removeBoard(BoardVO board) {
		return mapper.deleteBoard(board);
	}

	
	// 관리자에게 신고글 제출(신고테이블에 입력)
	public int reportBoard(ReportVO report) {
		return mapper.insertReport(report);
	}

	
	
	
}
