package com.itwillbs.Code_Green.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.Code_Green.service.CommunityService;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.File_boardVO;
import com.itwillbs.Code_Green.vo.PageInfo;
import com.itwillbs.Code_Green.vo.ReplyVO;
import com.itwillbs.Code_Green.vo.ReportVO;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService service;
	
	
	
	//------------ 어서와 비건은 처음이지 페이지 -------------------------------------------
		@RequestMapping(value = "welcome_vegun", method = RequestMethod.GET)
		public String welcome_vegun() {
			return "community/welcome_vegun";
		}

		
		
		
	//------------ 커뮤니티 메인(커뮤니티 글목록) 페이지 -------------------------------------------
	@GetMapping(value = "/CommunityList.bo")	
	public String list(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int pageNum, Model model){
		// -------------------------------------------------------------------
		// 페이징 처리를 위한 계산 작업
		int listLimit = 15; // 한 페이지 당 표시할 게시물 목록 갯수 
		int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
		
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
		
		// Service 객체의 getBoardList() 메서드를 호출하여 게시물 목록 조회
		// => 파라미터 : 시작행번호, 페이지 당 목록 갯수
		// => 리턴타입 : List<BoardVO>(communityList)
		List<BoardVO> communityList = service.getCommunityList(startRow, listLimit, searchType, keyword);
		// -------------------------------------------
		// Service 객체의 getBoardListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
		// => 파라미터 : 없음, 리턴타입 : int(listCount)
		int listCount = service.getCommunityListCount(searchType, keyword);
		
		// 페이지 계산 작업 수행
		// 전체 페이지 수 계산
		// Math 클래스의 ceil() 메서드를 활용하여 소수점 올림 처리를 통해 전체 페이지 수 계산
		// => listCount / listLimit 를 실수 연산으로 수행하여 소수점까지 계산하고
		//    Math.ceil() 메서드를 통해 올림 처리 후 결과값을 정수로 변환
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		// 시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		// 끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;
		
		// 만약, 끝 페이지 번호(endPage)가 최대 페이지 번호(maxPage)보다 클 경우 
		// 끝 페이지 번호를 최대 페이지 번호로 교체
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 페이징 처리 정보를 저장하는 PageInfo 클래스 인스턴스 생성 및 데이터 저장
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
//				System.out.println(pageInfo);
		// --------------------------------------------------------------------------------
		// 게시물 목록(boardList) 과 페이징 처리 정보(pageInfo)를 Model 객체에 저장
		model.addAttribute("communityList", communityList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword",keyword);
		
		return "community/community_main";
	}
	
	
	
	
	//------------ 커뮤니티 글 상세보기 페이지 -------------------------------------------
	@GetMapping(value = "/CommunityDetail.bo")
	public String communityDetail(@RequestParam int board_idx,Model model) {
		// service 객체의 increaseReadcount() 메서드 호출하여 게시물 조회 증가
		service.increaseReadcount(board_idx);
		
		// service 객체의 getBoardDetail() 메서드를 호출하여 게시물 상세정보 조회 
		// => 파라미터 : 글번호, 리턴타입 : BoardVO(board)
		BoardVO cBoard = service.getBoardDetail(board_idx);
		
		// Model 객체에 BoardVO 객체 추가
		model.addAttribute("cBoard", cBoard);
	
		return "community/community_detail";
	}
	
	//------------ 커뮤니티 새글 작성 폼 페이지 -------------------------------------------
	@GetMapping(value = "/CommunityWrite.bo")
	public String communityWrite() {
		return "community/community_write";
	}
	
	
	//------------ 커뮤니티 새글 작성 로직 -------------------------------------------
	@PostMapping(value = "/CommunityWritePro.bo")
	public String communityWritePro(@ModelAttribute BoardVO board,@ModelAttribute File_boardVO fileBoard, Model model, HttpSession session) {
		// 가상 업로드 경로에 대한 실제 업로드 경로 알아내기
		// => 단, request 객체에 getServletContext() 메서드 대신, session 객체로 동일한 작업 수행
		//    (request 객체에 해당 메서드 없음)
		String uploadDir = "/resources/commUpload"; // 가상의 업로드 경로
		// => webapp/resources 폴더 내에 upload 폴더 생성 필요
		String saveDir = session.getServletContext().getRealPath(uploadDir);
//		System.out.println("실제 업로드 경로 : " + saveDir);
		
		File f = new File(saveDir); // 실제 경로를 갖는 File 객체 생성
		// 만약, 해당 경로 상에 디렉토리(폴더)가 존재하지 않을 경우 생성
		if(!f.exists()) { // 해당 경로가 존재하지 않을 경우
			// 경로 상의 존재하지 않는 모든 경로 생성
			f.mkdirs();
		}
		
		// BoardVO 객체에 전달된 MultipartFile 객체 꺼내기
		// => 복수개의 파일이 각각 다른 name 속성으로 전달된 경우
		// => 각각의 MultipartFile 객체를 통해 getFile() 메서드 호출
//				MultipartFile mFile = board.getFile();
		
		String uuid = UUID.randomUUID().toString();
		
	
		MultipartFile mFile1 = fileBoard.getFile_1();
		MultipartFile mFile2 = fileBoard.getFile_2();
		MultipartFile mFile3 = fileBoard.getFile_3();
		
		String originalFileName1 = mFile1.getOriginalFilename();
		String originalFileName2 = mFile2.getOriginalFilename();
		String originalFileName3 = mFile3.getOriginalFilename();

		
		// ========================================================
		
		if(!originalFileName1.equals("")) {
			fileBoard.setFile1(uuid + "_" + originalFileName1);
//			System.out.println("업로드 될 파일명 : " + uuid + "_" + originalFileName1);
		}

		if(!originalFileName2.equals("")) {
			fileBoard.setFile2(uuid + "_" + originalFileName2);
//			System.out.println("업로드 될 파일명 : " + uuid + "_" + originalFileName2);
		}
		
		if(!originalFileName3.equals("")) {
			fileBoard.setFile3(uuid + "_" + originalFileName3);
//			System.out.println("업로드 될 파일명 : " + uuid + "_" + originalFileName3);
		}
		
		// ===========================================================

		int insertCount = service.writeCommunityBoard(board);
		
		// 사진파일이 하나도 등록안될경우 + 사진등록 될 경우 
		int file_insertCount = 0;
		if(!(originalFileName1.equals("") 
				&& originalFileName2.equals("") 
				&& originalFileName3.equals(""))){
			file_insertCount = service.writeCommunityFile(fileBoard);
		}
		
		if(insertCount > 0) {
			if(file_insertCount > 0) {
				try {
					if(fileBoard.getFile1() != null) {
						mFile1.transferTo(new File(saveDir, fileBoard.getFile1()));
					}
					if(fileBoard.getFile2() != null) {
						mFile2.transferTo(new File(saveDir, fileBoard.getFile2()));
					}
					if(fileBoard.getFile3() != null) {
						mFile3.transferTo(new File(saveDir, fileBoard.getFile3()));
					}
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

				return "redirect:/CommunityList.bo";
			} else {
				model.addAttribute("msg", "파일 업로드 실패!");
				return "member/fail_back";
			}
			
		} else {
			
			model.addAttribute("msg", "글 등록에 실패하였습니다. \n 다시한번 시도해주세요.");
			return "member/fail_back";
		}
	} 
	
	
	
	//------------ 커뮤니티 글 수정 폼으로 가기(원글불러오기) ------------------------------------------- 
	@GetMapping(value = "/CommunityModify.bo")
	public String communityModify(@ModelAttribute BoardVO board, Model model) {
		BoardVO boardMove = service.getBoard(board);
		
		model.addAttribute("board", boardMove);
		
		return "community/community_modify";
	}
	
	//------------ 커뮤니티 글 수정 업데이트로직(새로덮어쓰기)------------------------------------------- 
	@PostMapping(value = "/CommunityModifyPro.bo")
	public String communityModifyPro(@ModelAttribute BoardVO board,
									 @ModelAttribute File_boardVO fileBoard, 
									 HttpSession session,
									 @RequestParam(defaultValue = "1") int pageNum,
									 Model model) {
		
		// 기존 실제파일명을 변수에 저장 ( 새파일 업로드시 삭제필요 )
		String oldRealFile1 = fileBoard.getFile1();
		String oldRealFile2 = fileBoard.getFile2();
		String oldRealFile3 = fileBoard.getFile3();
		
		String uuid = UUID.randomUUID().toString();
		String uploadDir = "/resources/commUpload";	// 가상의 업로드 경로
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		
		File f = new File(saveDir); // 실제 경로를 갖는 File 객체 생성
		// 만약, 해당 경로 상에 디렉토리(폴더)가 존재하지 않을 경우 생성
		if(!f.exists()) { // 해당 경로가 존재하지 않을 경우
			// 경로 상의 존재하지 않는 모든 경로 생성
			f.mkdirs();
		}
		
		// BoardVO 객체에 전달된 MultipartFile 객체 꺼내기
		MultipartFile mFile1 = fileBoard.getFile_1();
		MultipartFile mFile2 = fileBoard.getFile_2();
		MultipartFile mFile3 = fileBoard.getFile_3();
		
		// 새 파일 업로드 여부 판별 저장 변수 선언(true : 새 파일 업로드)
		boolean isNewFile1 = false, isNewFile2 = false, isNewFile3 = false; 
		
		// MultipartFile 객체의 원본 파일명이 널스트링("") 인지 판별
		// => 주의! 새 파일 업로드 여부와 관계없이 MultipartFile 객체는 항상 생성됨(null 판별 불가)
		// => 또한, 원본 파일명이 널스트링일 경우에는 기존 파일명이 이미 VO 객체에 저장되어 있음
		if(!mFile1.getOriginalFilename().equals("")) {
			String originalFileName = mFile1.getOriginalFilename();
			System.out.println("파일명1 : " + originalFileName);
			
			// BoardVO 객체에 원본 파일명과 업로드 될 파일명 저장
			// => 단, uuid 를 결합한 파일명을 사용할 경우 원본 파일명과 실제 파일명을 구분할 필요 없이
			//    하나의 컬럼에 저장해두고, 원본 파일명이 필요할 경우 "_" 를 구분자로 지정하여
			//    문자열을 분리하면 두번째 파라미터가 원본 파일명이 된다!
			fileBoard.setFile1(uuid + "_" + originalFileName);
			// 새 파일 업로드 표시
			isNewFile1 = true;
		} 
		
		if(!mFile2.getOriginalFilename().equals("")) {
			String originalFileName = mFile2.getOriginalFilename();
			System.out.println("파일명2 : " + originalFileName);
			
			// BoardVO 객체에 원본 파일명과 업로드 될 파일명 저장
			// => 단, uuid 를 결합한 파일명을 사용할 경우 원본 파일명과 실제 파일명을 구분할 필요 없이
			//    하나의 컬럼에 저장해두고, 원본 파일명이 필요할 경우 "_" 를 구분자로 지정하여
			//    문자열을 분리하면 두번째 파라미터가 원본 파일명이 된다!
			fileBoard.setFile2(uuid + "_" + originalFileName);
			// 새 파일 업로드 표시
			isNewFile2 = true;
		}	
		
		if(!mFile3.getOriginalFilename().equals("")) {
			String originalFileName = mFile3.getOriginalFilename();
			System.out.println("파일명3 : " + originalFileName);
			
			// BoardVO 객체에 원본 파일명과 업로드 될 파일명 저장
			// => 단, uuid 를 결합한 파일명을 사용할 경우 원본 파일명과 실제 파일명을 구분할 필요 없이
			//    하나의 컬럼에 저장해두고, 원본 파일명이 필요할 경우 "_" 를 구분자로 지정하여
			//    문자열을 분리하면 두번째 파라미터가 원본 파일명이 된다!
			fileBoard.setFile3(uuid + "_" + originalFileName);
			// 새 파일 업로드 표시
			isNewFile3 = true;
		} 
		
		
		// ==================== 덮어쓰기 과정시작 =========================
		// 새 파일 선택 여부와 관계없이 공통으로 수정 작업 요청
		int updateFileCount = service.modifyFile(fileBoard);
		
		if(updateFileCount == 0) {
			
			model.addAttribute("msg","파일수정 실패");
			return "member/fail_back";
			
		} else {
			if(isNewFile1) {
				try {
					mFile1.transferTo(new File(saveDir, fileBoard.getFile1()));

					File f1_1 = new File(saveDir, oldRealFile1); 
//					System.out.println("File f1_1 = new File(saveDir, oldRealFile1);  -> "+ f1_1);
					if(f1_1.exists()) {
						f1_1.delete();
					}
					
				} catch (IllegalStateException e) {
					System.out.println("IllegalStateException");
					e.printStackTrace();
				} catch (IOException e) {
					System.out.println("IOException");
					e.printStackTrace();
				}
			}
			
			if(isNewFile2) {
				try {
					mFile2.transferTo(new File(saveDir, fileBoard.getFile2()));
					File f2_2 = new File(saveDir, oldRealFile2); 
//					System.out.println("File f2_2 = new File(saveDir, oldRealFile1);  -> "+ f2_2);
					if(f2_2.exists()) {
						f2_2.delete();
					}
					
				} catch (IllegalStateException e) {
					System.out.println("IllegalStateException");
					e.printStackTrace();
				} catch (IOException e) {
					System.out.println("IOException");
					e.printStackTrace();
				}
			}
			
			if(isNewFile3) {
				try {
					mFile3.transferTo(new File(saveDir, fileBoard.getFile3()));
					File f3_3 = new File(saveDir, oldRealFile3); 
//					System.out.println("File f3_3 = new File(saveDir, oldRealFile1);  -> "+ f3_3);
					if(f3_3.exists()) {
						f3_3.delete();
					}
				} catch (IllegalStateException e) {
					System.out.println("IllegalStateException");
					e.printStackTrace();
				} catch (IOException e) {
					System.out.println("IOException");
					e.printStackTrace();
				}
			}
		}
		
		// ========================= 글 수정 ===============================
		
		int updateCount = service.modifyBoard(board);
		model.addAttribute("pageNum", pageNum);
		System.out.println(updateCount);
		System.out.println(board);
		if(updateCount == 0) {
			model.addAttribute("msg", "글 수정 실패");
			return "member/fail_back";
		}
		
		return "redirect:/CommunityDetail.bo?board_idx=" + board.getBoard_idx() + "&pageNum=" + pageNum;
	}

	
	
	
	//------------ 커뮤니티 글 삭제 페이지------------------------------------------- 
	@GetMapping(value = "/CommunityDelete.bo")
	public String communityDelete(@RequestParam int board_idx, Model model, HttpSession session,@RequestParam int pageNum) {
		
		//글 삭제 전 실제 업로드된 파일 삭제작업
		String realFile1 = service.getRealFile1(board_idx);
		String realFile2 = service.getRealFile2(board_idx);
		String realFile3 = service.getRealFile3(board_idx);
		System.out.println("realFile1 -> "+realFile1);
		System.out.println("realFile2 -> "+realFile2);
		System.out.println("realFile2 -> "+realFile3);
		
		int deleteCount = service.removeBoard(board_idx);
		int deleteFileCount = service.removeFile(board_idx);
		System.out.println("deleteCount 갯수 -> "+deleteCount);
		System.out.println("deleteFileCount 갯수 -> "+deleteFileCount);
		// ----------------------------------------------------------
		
		if(deleteCount > 0) {
			String uploadDir = "/resources/commUpload"; // 가상의 업로드 경로
			// => webapp/resources 폴더 내에 upload 폴더 생성 필요
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			System.out.println("실제 업로드 경로 : " + saveDir);
			
			if(!realFile1.equals("N")) {
				File f1 = new File(saveDir, realFile1); // 실제 경로를 갖는 File 객체 생성
				if(f1.exists()) { // 해당 경로에 파일이 존재할 경우
					f1.delete();
				}
			}
			if(!realFile2.equals("N")) {
				File f2 = new File(saveDir, realFile2); // 실제 경로를 갖는 File 객체 생성
				if(f2.exists()) { // 해당 경로에 파일이 존재할 경우
					f2.delete();
				}
			}
			if(!realFile3.equals("N")) {
				File f3 = new File(saveDir, realFile3); // 실제 경로를 갖는 File 객체 생성
				if(f3.exists()) { // 해당 경로에 파일이 존재할 경우
					f3.delete();
				}
			}
			
			model.addAttribute("pageNum", pageNum);
			return "redirect:/CommunityList.bo?pageNum=" + pageNum;
			
		} else {
			model.addAttribute("msg", "글 삭제 실패!<br>다시 확인해주세요");
			return "member/fail_back";
		}
		
	}
		
	
	//------------------- 커뮤니티 글 신고 기능 (신고테이블에 입력) ------------------------------------------- 
		
	@PostMapping(value = "/ReportBoard.re")	
	public String reportBoard(@ModelAttribute ReportVO report,Model model,@RequestParam int pageNum) {
		
		int reportCount = service.reportBoard(report);
		
		if(reportCount == 0) {
			
			model.addAttribute("msg", "신고글 제출 실패!<br>확인 후 다시 시도해주세요.");
			return "member/fail_back";
			
		} else {
			
			return "redirect:/CommunityDetail.bo?board_idx=" + report.getBoard_idx() + "&pageNum=" + pageNum;
			
		}
		
		
	}
	
		
	//-------------------------------- 추천하기 로직 수행------------------------------------------- 
	@ResponseBody
	@PostMapping("/BestCountUpdate.bo")
	public void bestCountUpdate(@RequestParam int rf_board_idx,@RequestParam String member_id, Model model, HttpServletResponse response) {
		System.out.println(rf_board_idx);
		System.out.println(member_id);
		
		// 가져온 아이디와 보드넘버로 board_best테이블에 존재유무 판단하기
		int existCount = service.selectBoardBest(rf_board_idx,member_id);
		String msg = "";

		
		if(existCount > 0) { // 판단해서 있으면 삭제하기
			
			int resultDeleteCount = service.deleteBoardBest(rf_board_idx,member_id);
			if(resultDeleteCount > 0) {
//				model.addAttribute("msg", "추천이 취소되었습니다!");
				msg = "추천이 취소되었습니다!";
			}
		} else {	// 판단해서 없으면 추가하기
			
			int resultInsertCount = service.insertBoardBest(rf_board_idx,member_id);
			
			if(resultInsertCount > 0) {
//				model.addAttribute("msg", "추천했습니다!!");
				msg = "추천했습니다!";

			}
		}
		
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(msg);
		} catch (IOException e) {
			e.printStackTrace();
		}
//		model.addAttribute("msg", msg);
//		System.out.println(msg);
//		return "community/msg_back";
		
	}
	
	//-------------------------------- 추천수 카운팅 -------------------------------------------
	@ResponseBody
	@PostMapping("/BestCounting.bo")
	public int bestBoardCounting(int rf_board_idx) {
		
		int count = service.countBoardBest(rf_board_idx);
//		System.out.println(count);
		return count;
	}
		
	//------------------------------- 댓글수 카운팅 -------------------------------------------
	@ResponseBody
	@PostMapping("/ReplyCounting.bo")
	public int ReplyCounting(int reply_bo_ref) {
		
		int rCount = service.countReply(reply_bo_ref);
		return rCount;
	}
	
	
	//-------------------------------- 댓글 작성 -------------------------------------------
	@ResponseBody
	@PostMapping("/ReplyWrite.re")
	public Map<String,Object> replyWrite(
			@RequestParam int reply_bo_ref, 
			@RequestParam String reply_id,
			@RequestParam String reply_content){
		
		System.out.println(reply_bo_ref);
		System.out.println(reply_id);
		System.out.println(reply_content);
		
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		ReplyVO replyVO = new ReplyVO();
		replyVO.setReply_bo_ref(reply_bo_ref);
		replyVO.setReply_id(reply_id);
		replyVO.setReply_content(reply_content);
		int resultCount = service.writeReply(replyVO);
		
		if(resultCount > 0) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
		
		return map;
	}
	
	//-------------------------------- 대댓글 작성 ----------------------------------------- 
	@ResponseBody
	@PostMapping("/reReplyWrite.re")
	public void reReplyWrite(@ModelAttribute ReplyVO reply, Model model) {
		System.out.println("대댓내용 : " + reply);
		
		// 순서번호(reply_re_seq) 조정 
		service.increaseReplyReSeq(reply);
		System.out.println("순서번호 조정후 : " + reply);
		
		
		// 대댓글 등록
		int reResultCount = service.writeReReply(reply);
		System.out.println("대댓등록 후 결과 : " + reply);
		
		String msg = "";
		if(reResultCount > 0) {
			msg += "답댓글작성 완료";
		} else {
			msg += "답댓글작성 실패";
		}
//		System.out.println(msg);	// 확인용
		
	}
	
	
	//-------------------------------- 댓글 전체 목록 출력 -------------------------------------------
	@ResponseBody
	@PostMapping("/ReplyList.re")
	public List<ReplyVO> replyList(@RequestParam int reply_bo_ref){
		
		List<ReplyVO> replyList = service.replyList(reply_bo_ref);
		System.out.println(replyList);
		return replyList;
	}
	
	//-------------------------------- 댓글 삭제 ------------------------------------------- 
	@GetMapping("/replyDelete.re")
	public String deleteReply(@RequestParam int reply_idx,Model model,int pageNum, int board_idx) {
		
		int deleteReplyCount = service.deleteReply(reply_idx);
		
		String msg = "";
		if(deleteReplyCount > 0) {
			msg += "선택한 댓글이 삭제되었습니다.";
		} else {
			msg += "댓글삭제에 실패하였습니다.\n 다시시도해주세요.";
		}
		
		System.out.println(msg);
		return "redirect:/CommunityDetail.bo?board_idx=" + board_idx + "&pageNum=" + pageNum;
	}
	
	
}
