package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.CoinMapper;
import com.itwillbs.Code_Green.vo.CoinVO;

@Service
public class CoinService {
	@Autowired
	private CoinMapper mapper;
	//적립금 목록
	public List<CoinVO> getCoinList(int startRow, int listLimit, String member_id) {
		return mapper.selectCoinList(startRow, listLimit, member_id);
	}
	//적립금 목록 갯수
	public int getCoinListCount() {
		return mapper.selectCoinListCount();
	}



}
