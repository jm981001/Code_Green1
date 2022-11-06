package com.itwillbs.Code_Green.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.ReviewMapper;
import com.itwillbs.Code_Green.vo.BoardVO;

@Service
public class ReviewService {
	@Autowired
	private ReviewMapper mapper;

	
	//리뷰 등록
	public int registReview(BoardVO board) {
		return mapper.insertReview(board);
	}
}
