package com.itwillbs.Code_Green.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.QnaMapper;
import com.itwillbs.Code_Green.vo.QnaVO;

@Service
public class QnaService {
	@Autowired
	private QnaMapper mapper;
	
	
	//상품 문의 등록
	public int registQna(QnaVO qna) {
		return mapper.insertQna(qna);
	}

	//상품 문의 삭제
	public int removeReview(String qna_idx) {
		return mapper.deleteQna(qna_idx);
	}

}
