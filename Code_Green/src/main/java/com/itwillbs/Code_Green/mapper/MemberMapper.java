package com.itwillbs.Code_Green.mapper;

import java.util.List;

import com.itwillbs.Code_Green.vo.FollowVO;
import com.itwillbs.Code_Green.vo.MemberVO;

public interface MemberMapper {
	
	// 2.로그인
	// BCryptPasswordEncoder 활용 로그인에 필요한 selectPasswd() 메서드 정의
	// => 파라미터 : 아이디, 리턴타입 String
	public String selectPasswd(String member_id);

	// 3. 회원 정보 조회에 필요한 selectMemberInfo() 메서드 정의
	// => 파라미터 : 아이디, 리턴타입 : MemberVO
	public MemberVO selectMemberInfo(String id);

	// 4. 회원 가입에 필요한 insertMember() 메서드 정의
	// => 파라미터 : MemberVO 객체(member), 리턴타입 : int
	public int insertMember(MemberVO member);

	// 5. 회원 가입시 기본 적립금 추가
	public void setCoin(int member_idx);

	// 마이페이지 - 팔로우브랜드 리스트
	public List<FollowVO> selectFollowList(String member_id);



}
