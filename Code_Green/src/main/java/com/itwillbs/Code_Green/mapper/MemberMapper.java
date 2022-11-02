package com.itwillbs.Code_Green.mapper;

import com.itwillbs.Code_Green.vo.MemberVO;

public interface MemberMapper {

	// 2. 로그인에 필요한 loginMember() 메서드 정의
	// => 파라미터 : MemberVO 객체(member), 리턴타입 : MemberVO
	public MemberVO loginMember(MemberVO member);

	// 3. 회원 정보 조회에 필요한 selectMemberInfo() 메서드 정의
	// => 파라미터 : 아이디, 리턴타입 : MemberVO
	public MemberVO selectMemberInfo(String id);
}
