package com.itwillbs.Code_Green.mapper;

import com.itwillbs.Code_Green.vo.QnaVO;

public interface QnaMapper {

	//상품 문의 등록
	int insertQna(QnaVO qna);

	//상품 문의 삭제
	int deleteQna(String qna_idx);

}
