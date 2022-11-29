package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.Code_Green.mapper.MemberMapper;
import com.itwillbs.Code_Green.vo.FollowVO;
import com.itwillbs.Code_Green.vo.ManagerVO;
import com.itwillbs.Code_Green.vo.MemberVO;
import com.itwillbs.Code_Green.vo.SellVO;

@Service
public class MemberService {

	@Autowired
	private MemberMapper mapper;

	// 로그인
	// BCryptPasswordEncoder 활용한 로그인을 위해 패스워드 조회 - getPasswd()
	// => 파라미터 : 아이디, 리턴타입 : String
	public String getPasswd(String member_id) {
		return mapper.selectPasswd(member_id);
	}

	// 회원 정보 조회 수행 getMemberInfo()
	// => 파라미터 : 아이디, 리턴타입 : MemberVO(member)
	public MemberVO getMemberInfo(String member_id) {
		return mapper.selectMemberInfo(member_id);
	}
	// 회원 수정 modifyMemberInfo()
	// => 파라미터 : 아이디, 리턴타입 : MemberVO(member)
	public int modifyMemberInfo(MemberVO member) {
		return mapper.modifyMemberInfo(member);
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
	public String checkDel(String member_id) {
		return mapper.checkDel(member_id);
	}
	
	
	
	// ================================== 마이페이지 ============================================
	
	
	// 마이페이지 - 내정보 카운트 테이블
	public MemberVO getMyCountInfo(int member_idx) {
		return mapper.selectMyCountInfo(member_idx);
	}
	
	// 마이페이지 - 최근주문목록(1개월내)
	public List<SellVO> getMyRecentOrderList(int sIdx, int month) {
		return mapper.selectMyRecentOrderList(sIdx, month);
	}

	// 마이페이지 - 팔로우브랜드 리스트
	public List<FollowVO> getFollowList(int startRow, int listLimit, String member_id) {
		return mapper.selectFollowList(startRow, listLimit, member_id);
	}

	// 마이페이지 - 팔로우브랜드 리스트 카운트
	public int getFollowListCount(int member_idx) {
		return mapper.selectFollowListCount(member_idx);
		}
	
	
	// 마이페이지 - 팔로우브랜드 언팔로우
	public int deleteFollow(int rf_member_idx, int rf_manager_idx) {
		return mapper.deleteFollowBrand(rf_member_idx, rf_manager_idx);
	}

	

	

	

	

}
