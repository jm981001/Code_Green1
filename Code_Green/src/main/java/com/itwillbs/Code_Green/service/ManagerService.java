package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.ManagerMapper;
import com.itwillbs.Code_Green.vo.ItemVO;
import com.itwillbs.Code_Green.vo.ManagerVO;
import com.itwillbs.Code_Green.vo.MemberVO;
import com.itwillbs.Code_Green.vo.QnaVO;

@Service
public class ManagerService {

	@Autowired
	private ManagerMapper mapper;

//	가입
	public int joinManager(ManagerVO manager) {
		return mapper.insertManager(manager);
	}
//	로그인
	// BCryptPasswordEncoder 활용한 로그인을 위해 패스워드 조회 - getPasswd()
	// => 파라미터 : 아이디, 리턴타입 : String
	public String getPasswd(String manager_id) {
		return mapper.selectPasswd(manager_id);
	}
	

//	 브랜드 정보 조회 수행 getManagerInfo()
//	=> 파라미터 : 아이디, 리턴타입 : ManagerVO(manager)
	public ManagerVO getManagerInfo(String manager_id) {
		return mapper.selectManagerInfo(manager_id);
	}
	
	// 브랜드 정보조회(브랜드마이페이지)
	public ManagerVO getBrandInfo(String sId) {
		return mapper.selectBrandInfo(sId);
	}
	// 브랜드 정보수정(브랜드마이페이지)
	public int modifyManager(ManagerVO manager, String id) {
		return mapper.updateBrandInfo(manager,id);
	}
	
//	//팔로우 목록조회
//	public MemberVO followInfo(String idx) {
//		return mapper.selectFollowInfo(idx);
//	}
	//상품 목록 조회
	
	public List<ItemVO> getItemList(String id, int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectItemList (id, startRow, listLimit, searchType, keyword);
	}
	// 상품 갯수 조회
	public int getItemListCount(String searchType, String keyword) {
		return mapper.selectItemListCount(searchType, keyword);
	}
	
	// 상품 상세조회
	public ItemVO getItemInfo(String item_idx) {
		return mapper.selectItemInfo(item_idx);
	}


//	 문의글 리스트
	public List<QnaVO> getQnaBoardList(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectQnaBoardList(startRow,listLimit,searchType,keyword);
	}
	
	
	//문의글 갯수 조회
	public int getQnaBoardListCount(String searchType, String keyword) {
		return mapper.selectQnaBoardListCount(searchType, keyword);
	}

	
	// 문의글 상세조회
	public QnaVO getQnaInfo(String qna_idx) {
		return mapper.selectQnaInfo(qna_idx);
	}


	




	

}
