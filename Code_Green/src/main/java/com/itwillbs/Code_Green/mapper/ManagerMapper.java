package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.ItemVO;
import com.itwillbs.Code_Green.vo.ManagerVO;
import com.itwillbs.Code_Green.vo.MemberVO;
import com.itwillbs.Code_Green.vo.QnaVO;

public interface ManagerMapper {

	// 1. 기업 가입에 필요한 insertManager() 메서드 정의
	// => 파라미터 : ManagerVO 객체(member), 리턴타입 : int
	public int insertManager(ManagerVO manager);
	
	// 2. 로그인에 필요한 selectPasswd() 메서드 정의
	// => 파라미터 : String manager_id, 리턴타입 : String
	public String selectPasswd(String manager_id);

	// 3. 브랜드 정보 조회에 필요한 selectManagerInfo() 메서드 정의
	// => 파라미터 : 아이디, 리턴타입 : ManagerVO
	public ManagerVO selectManagerInfo(String id);
    
	// 브랜드 상세정보조회(브랜드마이페이지)
	public ManagerVO selectBrandInfo(String id);
	
	// 브랜드 정보수정조회(브랜드마이페이지)
//	public ManagerVO modifyBrandInfo(String sId);
	
	// 브랜드 정보수정(브랜드마이페이지)
	public int updateBrandInfo(ManagerVO manager);
		
	//상품 목록 조회 (복수개의 파라미터는 @Param 어노테이션으로 이름 설정)
	public List<ItemVO> selectItemList(
			@Param("id") String id,@Param("startRow") int startRow,@Param("listLimit") int listLimit,
			@Param("searchType") String searchType,@Param("keyword") String keyword);

	//상품 상세 조회
     public ItemVO selectItemInfo(String item_idx);
	
	//상품 갯수 조회
	public int selectItemListCount(
			@Param("searchType") String searchType,@Param("keyword")  String keyword);
	
	//문의글 목록 조회
	public List<QnaVO> selectQnaBoardList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit, 
			@Param("searchType") String searchType,@Param("keyword") String keyword);
	
	//문의글 상세 조회
	public QnaVO selectQnaInfo(String qna_idx);
	
	//문의글 갯수 조회
	public int selectQnaBoardListCount(
			@Param("searchType") String searchType, @Param("keyword") String keyword);







	
	


	//팔로우 목록조회
//	public MemberVO selectFollowInfo(String idx);
}
