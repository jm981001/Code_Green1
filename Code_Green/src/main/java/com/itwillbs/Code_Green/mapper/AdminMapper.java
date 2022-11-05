package com.itwillbs.Code_Green.mapper;

import com.itwillbs.Code_Green.vo.AdminVO;

public interface AdminMapper {

	// 2. 로그인에 필요한 loginAdmin() 메서드 정의
	// => 파라미터 : AdminVO 객체(admin), 리턴타입 : AdminVO
	public AdminVO loginAdmin(AdminVO admin);

}
