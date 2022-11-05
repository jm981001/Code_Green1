package com.itwillbs.Code_Green.mapper;

import com.itwillbs.Code_Green.vo.ManagerVO;

public interface ManagerMapper {

	// 2. 로그인에 필요한 loginManager() 메서드 정의
	// => 파라미터 : MemberVO 객체(manager), 리턴타입 : managerVO
	public ManagerVO loginManager(ManagerVO manager);

	// 3. 브랜드 정보 조회에 필요한 selectManagerInfo() 메서드 정의
	// => 파라미터 : 아이디, 리턴타입 : ManagerVO
	public ManagerVO selectManagerInfo(String id);
}
