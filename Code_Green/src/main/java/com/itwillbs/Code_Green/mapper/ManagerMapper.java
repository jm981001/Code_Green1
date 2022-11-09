package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.ItemVO;
import com.itwillbs.Code_Green.vo.ManagerVO;
import com.itwillbs.Code_Green.vo.QnaVO;

public interface ManagerMapper {

	// 1. 기업 가입에 필요한 insertManager() 메서드 정의
	// => 파라미터 : ManagerVO 객체(member), 리턴타입 : int
	public int insertManager(ManagerVO manager);
	
	// 2. 로그인에 필요한 loginManager() 메서드 정의
	// => 파라미터 : MemberVO 객체(manager), 리턴타입 : managerVO
	public ManagerVO loginManager(ManagerVO manager);

	// 3. 브랜드 정보 조회에 필요한 selectManagerInfo() 메서드 정의
	// => 파라미터 : 아이디, 리턴타입 : ManagerVO
	public ManagerVO selectManagerInfo(String id);

	
	//상품 목록 조회
//	public List<ItemVO> selectItemList(String sId);
	
	public List<ItemVO> selectItemList(@Param("id") String id,@Param("startRow") int startRow,@Param("listLimit") int listLimit,
										@Param("searchType") String searchType,@Param("keyword") String keyword);

	//상품 갯수 조회
	public int selectItemListCount(@Param("searchType") String searchType,@Param("keyword")  String keyword);
	
	//문의글 목록 조회
	public List<QnaVO> selectQnaBoardList();
	
	//문의글 상세 조회
	public QnaVO selectQnaInfo(@Param ("subject") String subject, @Param("id") String id);



	//팔로우 목록조회
//	public MemberVO selectFollowInfo(String idx);
}
