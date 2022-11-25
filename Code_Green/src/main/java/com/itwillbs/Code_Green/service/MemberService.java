package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.MemberMapper;
import com.itwillbs.Code_Green.vo.FollowVO;
import com.itwillbs.Code_Green.vo.ManagerVO;
import com.itwillbs.Code_Green.vo.MemberVO;

@Service
public class MemberService {

	@Autowired
	private MemberMapper mapper;

	// BCryptPasswordEncoder 활용한 로그인을 위해 패스워드 조회 - getPasswd()
	// => 파라미터 : 아이디, 리턴타입 : String
	public String getPasswd(String member_id) {
		return mapper.selectPasswd(member_id);
	}
	
	// 로그인
//	public MemberVO loginMember(MemberVO member) {
//		return mapper.loginMember(member);
//	}

	// 회원 정보 조회 수행 getMemberInfo()
	// => 파라미터 : 아이디, 리턴타입 : MemberVO(member)
	public MemberVO getMemberInfo(String member_id) {
		return mapper.selectMemberInfo(member_id);
	}

	// 회원 가입 joinMember() 메서드
	// => 파라미터 : MemberVO 객체 리턴타입 : int(insertCount)
	public int joinMember(MemberVO member) {
		return mapper.insertMember(member);
	}

	//회원 가입시 기본 적립금 지급 
	public void setCoin(int member_idx) {
		mapper.setCoin(member_idx);
	}

	// 마이페이지 - 팔로우브랜드 리스트
	public List<FollowVO> getFollowList(String member_id) {
		return mapper.selectFollowList(member_id);
	}

	// 마이페이지 - 내정보 카운트 테이블
	public MemberVO getMyCountInfo(int member_idx) {
		return mapper.selectMyCountInfo(member_idx);
	}

	

}
