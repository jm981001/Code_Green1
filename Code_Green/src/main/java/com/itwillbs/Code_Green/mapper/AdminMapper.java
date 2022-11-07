package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.AdminVO;
import com.itwillbs.Code_Green.vo.ManagerVO;
import com.itwillbs.Code_Green.vo.MemberVO;

public interface AdminMapper {

	// 2. 로그인에 필요한 loginAdmin() 메서드 정의
	// => 파라미터 : AdminVO 객체(admin), 리턴타입 : AdminVO
	public AdminVO loginAdmin(AdminVO admin);
	
	
	//----------------------------------------------------------
	
	
	//회원 목록 전체 조회
		List<MemberVO> selectMemberList();

		//회원 상세정보 조회
		MemberVO selectMemberInfo(String id);

		//회원정보 수정(이름만)
		int updateMemberInfo(@Param("member") MemberVO member,@Param("newName") String newName,@Param("id") String id);

		//회원 삭제
		int deleteMember(String id);
		
		
		//회원 페이지 검색
		
		
		
		//----------------------------------------------------------

		
		
		//기업 목록 전체 조회
		List<ManagerVO> selectManagerList();

		//기업 상세정보 조회
		public ManagerVO selectManagerInfo(String id);


		//기업 삭제
		public int deleteManager(String id);
	
	
	
	
	
	

}
