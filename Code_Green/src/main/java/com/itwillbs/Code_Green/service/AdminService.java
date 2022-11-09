package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.AdminMapper;
import com.itwillbs.Code_Green.vo.AdminVO;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.ManagerVO;
import com.itwillbs.Code_Green.vo.MemberVO;
import com.itwillbs.Code_Green.vo.QnaVO;
import com.itwillbs.Code_Green.vo.ReportVO;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;

	public AdminVO loginAdmin(AdminVO admin) {
		return mapper.loginAdmin(admin);
	}

	//----------------------
	
	
		//전체 회원목록 조회
		public List<MemberVO> getMemberList(int startRow, int listLimit, String searchType, String keyword) {
			// TODO Auto-generated method stub
			return mapper.selectMemberList(startRow, listLimit, searchType, keyword);
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
		
		

		//회원관리 검색기능
		public int getBoardListCount(String searchType, String keyword) {
			// TODO Auto-generated method stub
			return mapper.selectMemberListCount(searchType, keyword);
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
		//기업 삭제(1개)
		public int removeManager(String id) {
			// TODO Auto-generated method stub
			return mapper.deleteManager(id);
		}
		
		
		//여기부터는 1:1 게시글
		
		
		//1:1게시글 목록 조회(1개)
		public List<QnaVO> getOneQnaBoardList() {
			// TODO Auto-generated method stub
			return mapper.selectOneQnaList();
		}
		//1:1게시글 상세정보 조회(1개)
		public QnaVO getOneQnaInfo(String subject, String id) {
			// TODO Auto-generated method stub
			return mapper.selectOneQnaInFo(subject, id);
		}
		
		//1:1 게시글 삭제
		public int removeOneQnaRemove(String id) {
			// TODO Auto-generated method stub
			return mapper.deleteOneQnaBoard(id);
		}


		//여기부터는 게시글 관리(커뮤,레시피 등)
		
		
		
		//게시판 관리 목록
		public List<BoardVO> getBoardList() {
			// TODO Auto-generated method stub
			return mapper.selectBoardList();
		}
		//신고글  목록
		public List<ReportVO> getReportList() {
			// TODO Auto-generated method stub
			return mapper.selectReportList();
		}
		
		
	
	
	
	
}
