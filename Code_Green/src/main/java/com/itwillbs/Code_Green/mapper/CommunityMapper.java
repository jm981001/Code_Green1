package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.ReportVO;

public interface CommunityMapper {

	
	// 전체 글 목록 조회
	List<BoardVO> selectCommunityList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType, @Param("keyword") String keyword);

	// 전체 글 목록 갯수 조회 
	int selectCommunityListCount(
			@Param("searchType") String searchType, @Param("keyword") String keyword);

	// 게시글 조회수 증가 
	void updateReadcount(int board_idx);

	// 게시글 상세조회
	BoardVO selectBoardDetail(int board_idx);
	
	// 게시글 삭제 
	int deleteBoard(BoardVO board);

	// 신고하기 (신고테이블에 입력하기)
	int insertReport(ReportVO report);
	
}
