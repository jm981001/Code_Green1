package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.TotalMapper;
import com.itwillbs.Code_Green.vo.TotalVO;

@Service
public class TotalService {

	@Autowired
	private TotalMapper mapper;

	public List<TotalVO> getChart() {
		// TODO Auto-generated method stub
		return mapper.selectSellChart();
	}
	
}
