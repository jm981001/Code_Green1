package com.itwillbs.Code_Green.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.AdminMapper;
import com.itwillbs.Code_Green.vo.AdminVO;
import com.itwillbs.Code_Green.vo.ManagerVO;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;

	public AdminVO loginAdmin(AdminVO admin) {
		return mapper.loginAdmin(admin);
	}

}
