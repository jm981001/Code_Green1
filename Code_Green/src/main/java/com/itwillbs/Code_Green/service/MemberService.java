package com.itwillbs.Code_Green.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.MemberMapper;
import com.itwillbs.Code_Green.vo.ManagerVO;
import com.itwillbs.Code_Green.vo.MemberVO;


@Service
public class MemberService {

	@Autowired
	private MemberMapper mapper;
	
	//	로그인
	public MemberVO loginMember(MemberVO member) {
		return mapper.loginMember(member);
	}

	
	// 회원 정보 조회 수행 getMemberInfo()
	// => 파라미터 : 아이디, 리턴타입 : MemberVO(member)
	public MemberVO getMemberInfo(String member_id) {
		return mapper.selectMemberInfo(member_id);
	}

	// 회원 가입 joinMember() 메서드
	// => 파라미터 : MemberVO 객체   리턴타입 : int(insertCount)
	public int joinMember(MemberVO member) {
		return mapper.insertMember(member);
	}


	
	
}
