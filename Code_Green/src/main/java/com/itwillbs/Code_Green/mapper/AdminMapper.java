package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.AdminVO;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.ManagerVO;
import com.itwillbs.Code_Green.vo.MemberVO;
import com.itwillbs.Code_Green.vo.QnaVO;
import com.itwillbs.Code_Green.vo.ReportVO;

public interface AdminMapper {

	// 2. 로그인에 필요한 loginAdmin() 메서드 정의
	// => 파라미터 : AdminVO 객체(admin), 리턴타입 : AdminVO
	public AdminVO loginAdmin(AdminVO admin);
	
	
	//----------------------------------------------------------
	
	//회원 목록 갯수 조회
	public int selectMemberListCount(
			@Param("searchType") String searchType, @Param("keyword") String keyword);

	//회원 목록 전체 조회
	List<MemberVO> selectMemberList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType, @Param("keyword") String keyword);

	//회원 상세정보 조회
	MemberVO selectMemberInfo(String id);

	//회원정보 수정(이름만)
	int updateMemberInfo(@Param("member") MemberVO member,@Param("newName") String newName,@Param("id") String id);

	//회원 삭제
	int deleteMember(String id);
	
	
	//----------------------------------------------------------
	
	//기업목록 갯수(승인완료) 조회
	public int selectManagerListCount(
			@Param("searchType") String searchType,@Param("keyword") String keyword);

	//기업목록(승인완료) 조회
	List<ManagerVO> selectManagerList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType,@Param("keyword") String keyword);
	
	//기업목록 갯수(미승인) 조회
	public int selectAuthListCount(
			@Param("searchType") String searchType,@Param("keyword") String keyword);
	
	//기업목록(미승인) 조회
	public List<ManagerVO> selectManagerAuthList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType,@Param("keyword") String keyword);

	//기업 상세정보 조회
	public ManagerVO selectManagerInfo(String id);

	//기업 삭제
	public int deleteManager(String id);
	
	
	//----------------------------------------------------------
	
	//1:1 문의글 갯수
	public int selectOneListCount(@Param("searchType") String searchType, @Param("keyword") String keyword);
	
	//1:1 문의글 목록
	public List<QnaVO> selectOneQnaList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType,@Param("keyword") String keyword);

	//1:1 문의 상세내용
	public QnaVO selectOneQnaInFo(@Param("subject") String subject, @Param("id") String id);

	//1:1 문의글 삭제
	public int deleteOneQnaBoard(String id);

	
	//----------------------------------------------------------
	
	
	//커뮤니티 게시판 목록
	public List<BoardVO> selectBoardList();
	
	//후기 게시글 갯수 조회 | 검색
	public int selectReviewListCount(
			@Param("searchType") String searchType, @Param("keyword") String keyword);

	//후기 게시판 목록
	public List<BoardVO> selectReviewList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType,@Param("keyword") String keyword);
	
	//게시판 삭제
	public int deleteBoard(int board_idx);
	
	//----------------------------------------------------------
	
	//신고글(처리대기) 갯수 조회
	public int selectReportListCount(
			@Param("searchType") String searchType, @Param("keyword") String keyword);
	
	//신고글 목록(처리대기)
	public List<ReportVO> selectReportList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType,@Param("keyword") String keyword);

	//신고글(처리완료) 갯수 조회
	public int selectReportSuccessListCount(
			@Param("searchType") String searchType, @Param("keyword") String keyword);
	
	//신고글 목록(처리완료)
	public List<ReportVO> selectReportSuccessList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType,@Param("keyword") String keyword);
	
	//신고글 상세조회(reporter)
	public ReportVO selectReportInfo(int report_idx);
	
	//신고된 원본글 상세조회!
	public BoardVO selectOriginBoard(int board_idx);

	//신고글 삭제(리포터)
	public int deleteReport(int report_idx);

	//신고글 상태 변경(처리대기 => 처리완료)
	public int updateReportStatus(@Param("board_idx") int board_idx,@Param("report") ReportVO report);


	


	


	


	

	

	

			



			

		
	
	
	
	
	
	

}
