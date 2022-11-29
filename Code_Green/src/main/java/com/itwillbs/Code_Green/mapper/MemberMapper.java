package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.FollowVO;
import com.itwillbs.Code_Green.vo.MemberVO;
import com.itwillbs.Code_Green.vo.SellVO;

public interface MemberMapper {
	
	// 로그인
	// BCryptPasswordEncoder 활용 로그인에 필요한 selectPasswd() 메서드 정의
	// => 파라미터 : 아이디, 리턴타입 String
	public String selectPasswd(String member_id);

	// 회원 정보 조회에 필요한 selectMemberInfo() 메서드 정의
	// => 파라미터 : 아이디, 리턴타입 : MemberVO
	public MemberVO selectMemberInfo(String id);

	// 멤버 수정
	public int modifyMemberInfo(MemberVO member);	
	
	// 회원 가입에 필요한 insertMember() 메서드 정의
	// => 파라미터 : MemberVO 객체(member), 리턴타입 : int
	public int insertMember(MemberVO member);

	// 회원 가입시 기본 적립금 추가
	public void setCoin(int member_idx);

	// 탈퇴 여부 확인
	public String checkDel(String member_id);
	
	
	
	
	
	
	
	// ============================================ 마이페이지 ================================================================
	
	
	// 마이페이지 - 내정보 카운트 테이블
	public MemberVO selectMyCountInfo(int member_idx);
	
	// 마이페이지 - 메인:최근주문목록(1개월내)
	public List<SellVO> selectMyRecentOrderList(@Param("sIdx") int sIdx, @Param("month")int month);

	// 마이페이지 - 팔로우브랜드 리스트
	public List<FollowVO> selectFollowList(@Param("startRow")int startRow,@Param("listLimit") int listLimit,@Param("member_id") String member_id);

	// 마이페이지 - 팔로우브랜드 리스트 카운트
	public int selectFollowListCount(int member_idx);
	
	// 마이페이지 - 팔로우브랜드 언팔로우
	public int deleteFollowBrand(@Param("rf_member_idx")int rf_member_idx, @Param("rf_manager_idx") int rf_manager_idx);

	


	
	

	

	



}
