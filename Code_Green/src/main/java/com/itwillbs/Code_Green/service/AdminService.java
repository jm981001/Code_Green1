package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.AdminMapper;
import com.itwillbs.Code_Green.vo.AdminVO;
import com.itwillbs.Code_Green.vo.ManagerVO;
import com.itwillbs.Code_Green.vo.MemberVO;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;

	public AdminVO loginAdmin(AdminVO admin) {
		return mapper.loginAdmin(admin);
	}

	//----------------------
	
	
	//전체 회원목록 조회
		public List<MemberVO> getMemberList() {
			// TODO Auto-generated method stub
			return mapper.selectMemberList();
		}

		//회원 상세정보 조회(1개)
		public MemberVO memberInfo(String id) {
			// TODO Auto-generated method stub
			return mapper.selectMemberInfo(id);
		}

		//회원 수정
		public int modifyMember(MemberVO member, String newName, String id) {

			return mapper.updateMemberInfo(member,newName, id);
		}
		
		//회원 삭제
		public int removeMember(String id) {
			// TODO Auto-generated method stub
			return mapper.deleteMember(id);
		}
		
		
		
		
		//여기부터는 기업
		

		// 기업 목록 조회
		public List<ManagerVO> getManagerList() {
			// TODO Auto-generated method stub
			return mapper.selectManagerList();
		}

		//기업 상세정보 조회(1개)
		public ManagerVO getManagerInfo(String id) {
			// TODO Auto-generated method stub
			return mapper.selectManagerInfo(id);
		}

		public int removeManager(String id) {
			// TODO Auto-generated method stub
			return mapper.deleteManager(id);
		}
	
	
	
	
}
