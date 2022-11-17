package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.CommunityMapper;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.ReplyVO;
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

	// 추천하기 테이블에 아이디존재유무 판단하기
	public int selectBoardBest(int rf_board_idx, String member_id) {
		return mapper.selectBoardBest(rf_board_idx,member_id);
	}
	
	// 추천하기 테이블에서 추천한 아이디 행 삭제하기 
	public int deleteBoardBest(int rf_board_idx, String member_id) {
		return mapper.deleteBoardBest(rf_board_idx,member_id);
	}
	
	// 추천하기 테이블에 추천아이디 행 추가하기 
	public int insertBoardBest(int rf_board_idx, String member_id) {
		return mapper.insertBoardBest(rf_board_idx,member_id);
	}
	
	// 추천 수 카운팅 
	public int countBoardBest(int rf_board_idx) {
		return mapper.countBoardBest(rf_board_idx);
	}
	
	// 댓글 쓰기등록 (기본)
	public int writeReply(ReplyVO replyVO) {
		System.out.println(replyVO);
		 return mapper.insertReply(replyVO);
	}
	
	// 댓글 목록 출력
	public List<ReplyVO> replyList(int reply_bo_ref) {
		return mapper.selectReplyList(reply_bo_ref);
	}

	// 새글 작성(사진제외)
	public int writeCommunityBoard(BoardVO board) {
		return mapper.insertCommunityBoard(board);
	}

	// 글 수정폼 페이지에 글데이터 가져오기
	public BoardVO getBoard(int board_idx) {
		return mapper.selectBoardModify(board_idx);
	}
	
	// 대댓글 순서번호(reply_re_seq) 조정
	public void increaseReplyReSeq(ReplyVO reply) {
		mapper.updateReplyReSeq(reply);
	}
		
	// 대댓글 쓰기등록
	public int writeReReply(ReplyVO reply) {
		return mapper.insertReReply(reply);
	}

	// 댓글 삭제 
	public int deleteReply(int reply_idx) {
		return mapper.deleteReply(reply_idx);
	}

		
	

	
	
	
}
