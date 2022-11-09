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

//	로그인
	public ManagerVO loginManager(ManagerVO manager) {
		return mapper.loginManager(manager);
	}

//	 브랜드 정보 조회 수행 getManagerInfo()
//	=> 파라미터 : 아이디, 리턴타입 : ManagerVO(manager)
	public ManagerVO getManagerInfo(String manager_id) {
		return mapper.selectManagerInfo(manager_id);
	}
//	//팔로우 목록조회
//	public MemberVO followInfo(String idx) {
//		return mapper.selectFollowInfo(idx);
//	}
	
	//상품 리스트
	public List<ItemVO> itemList(String id, int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectItemList (id, startRow, listLimit, searchType, keyword);
	}
	// 상품 갯수
	public int getItemListCount(String searchType, String keyword) {
		return mapper.selectItemListCount(searchType, keyword);
	}
	
	
	
	
	// 문의글 리스트
	public List<QnaVO> getQnaBoardList() {
		return mapper.selectQnaBoardList();
	}
	
	// 문의글 상세조회
	public QnaVO getQnaInfo(String subject, String id) {
		
		return mapper.selectQnaInfo(subject, id);
	}



	

}
