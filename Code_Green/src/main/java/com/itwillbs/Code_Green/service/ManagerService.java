package com.itwillbs.Code_Green.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.ManagerMapper;
import com.itwillbs.Code_Green.vo.ManagerVO;

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
	public ManagerVO getMemberInfo(String manager_id) {
		return mapper.selectManagerInfo(manager_id);
	}

}
