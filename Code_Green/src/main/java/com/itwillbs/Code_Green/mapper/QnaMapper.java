package com.itwillbs.Code_Green.mapper;

import java.util.List;

import com.itwillbs.Code_Green.vo.QnaVO;

public interface QnaMapper {

	//상품 문의 상세정보 조회
	QnaVO selectQna1(int qna_idx);
	
	//상품 문의 등록
	int insertQna(QnaVO qna);

	//상품 문의 삭제
	int deleteQna(String qna_idx);

	//상품 문의 수정
	int updateQna(QnaVO qna);

	// 1:1문의 목록출력(첫화면)
	List<QnaVO> selectMantomanList(String qna_id);


}
