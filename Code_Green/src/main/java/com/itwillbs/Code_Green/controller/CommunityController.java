package com.itwillbs.Code_Green.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itwillbs.Code_Green.service.CommunityService;
import com.itwillbs.Code_Green.vo.BoardVO;
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
	public String communityWritePro(@ModelAttribute BoardVO board,Model model) {
		int insertCount = service.writeBoard(board);
		
		if(insertCount > 0) {
			return "redirect:/CommunityList.bo";
			
		} else {
			
			model.addAttribute("msg", "글 등록에 실패하였습니다. \n 다시한번 시도해주세요.");
			return "member/fail_back";
		}
	}
	
	//-----------------커뮤니티 사진업로드 수행 1 ---------------------------------------
	@RequestMapping(value="/imageUpload.bo", method = RequestMethod.POST) 
	public void imageUpload(
							HttpServletRequest request, HttpSession session,
							HttpServletResponse response, 
							MultipartHttpServletRequest multiFile , 
							@RequestParam MultipartFile upload) throws Exception{ 
	
		
				// 랜덤 문자 생성 
				UUID uid = UUID.randomUUID();
				
				OutputStream out = null; 
				PrintWriter printWriter = null; 
				
				//인코딩 
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=utf-8");
				
				try{ 
					//파일 이름 가져오기 
					String fileName = upload.getOriginalFilename();
					byte[] bytes = upload.getBytes(); 
					
					//이미지 경로 생성 
					String real = session.getServletContext().getRealPath("/resources/commUpload");
					String ckUploadPath = real + "/" + uid + "_" + fileName; 
					File folder = new File(real);
					
					//해당 디렉토리 확인 
					if(!folder.exists()){ 
						try{ folder.mkdirs(); // 폴더 생성 
						}catch(Exception e){ 
							e.getStackTrace(); 
							} 
						}
					
					out = new FileOutputStream(new File(ckUploadPath)); 
					out.write(bytes); 
					out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화 
					
					String callback = request.getParameter("CKEditorFuncNum"); 
					printWriter = response.getWriter(); 
					String fileUrl = "ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면 
					
					// 업로드시 메시지 출력
					printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}"); 
					printWriter.flush(); 
					
				}catch(IOException e){ 
					e.printStackTrace(); 
					} finally { 
						try { if(out != null) { out.close(); } 
						if(printWriter != null) { printWriter.close(); } 
						} catch(IOException e) { e.printStackTrace(); } 
					} 
				return; 
		
		
	}
	
	//-----------------커뮤니티 사진업로드 수행2 ---------------------------------------
	
	@RequestMapping(value="/ckImgSubmit.do") 
	public void ckSubmit(@RequestParam(value="uid") String uid, 
						 @RequestParam(value="fileName") String fileName,
			 			 HttpSession session, HttpServletRequest request, 
			 			 HttpServletResponse response) throws ServletException, IOException{ 
		
			//서버에 저장된 이미지 경로 
			String real = session.getServletContext().getRealPath("/resources/commUpload");
			String sDirPath = real+ "/" + uid + "_" + fileName; 
			File imgFile = new File(sDirPath); 
			
			//사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다. 
			if(imgFile.isFile()){ byte[] buf = new byte[1024]; 
			int readByte = 0; 
			int length = 0; 
			byte[] imgBuf = null; 
			
			FileInputStream fileInputStream = null; 
			ByteArrayOutputStream outputStream = null; 
			ServletOutputStream out = null; 
			
			try{ 
				fileInputStream = new FileInputStream(imgFile); 
				outputStream = new ByteArrayOutputStream(); 
				out = response.getOutputStream(); 
				
				while((readByte = fileInputStream.read(buf)) != -1){ 
					outputStream.write(buf, 0, readByte); 
					} 
				
				imgBuf = outputStream.toByteArray(); 
				length = imgBuf.length; 
				out.write(imgBuf, 0, length); 
				out.flush(); 
				
			}catch(IOException e){ 
				e.getMessage();
			}finally { 
				outputStream.close();
				fileInputStream.close();
				out.close();
				} 
			} 
			
	}
	
	//------------ 커뮤니티 글 수정 폼 ------------------------------------------- 
	@GetMapping(value = "/CommunityModify.bo")
	public String communityModify(@RequestParam int board_idx, Model model ) {
		BoardVO board = service.getBoard(board_idx);
		
		model.addAttribute("board", board);
		
		return "community/community_modify";
	}
	
	//------------ 커뮤니티 글 수정 업데이트로직------------------------------------------- 
	@PostMapping(value = "/CommunityModifyPro.bo")
	public String communityModifyPro() {
		
		
		return "redirect:/CommunityDetail.bo?board_idx=" ;
	}

	
	
	//------------ 커뮤니티 글 삭제 페이지------------------------------------------- 
	@GetMapping(value = "/CommunityDelete.bo")
	public String communityDelete(@ModelAttribute BoardVO board,@RequestParam int pageNum, Model model) {
		int deleteCount = service.removeBoard(board);
		
		if(deleteCount == 0) {

			model.addAttribute("msg", "글 삭제 실패!<br>다시 확인해주세요");
			return "member/fail_back";
			
		} else {
			
			return "redirect:/CommunityList.bo?pageNum=" + pageNum;
		}
		
	}
		
	
	//------------ 커뮤니티 글 신고 기능 (신고테이블에 입력) ------------------------------------------- 
		
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
	
		
	// 추천하기 로직 수행 
	@PostMapping("/BestCountUpdate.bo")
	public String bestCountUpdate(@RequestParam int rf_board_idx,@RequestParam String member_id, Model model) {
		System.out.println(rf_board_idx);
		System.out.println(member_id);
		
		// 가져온 아이디와 보드넘버로 board_best테이블에 존재유무 판단하기
		int existCount = service.selectBoardBest(rf_board_idx,member_id);
		String msg = "";

		if(existCount > 0) { // 판단해서 있으면 삭제하기
			
			int resultDeleteCount = service.deleteBoardBest(rf_board_idx,member_id);
			if(resultDeleteCount > 0) {
				model.addAttribute("msg", "추천이 취소되었습니다!");
			}
			return "member/fail_back";
		} else {	// 판단해서 없으면 추가하기
			
			int resultInsertCount = service.insertBoardBest(rf_board_idx,member_id);
			
			if(resultInsertCount > 0) {
				model.addAttribute("msg", "추천했습니다!!");
			}
			return "member/fail_back";
		}
		
//		model.addAttribute("msg", msg);
//		System.out.println(msg);
//		return "community/msg_back";
		
	}
	
	// 추천수 카운팅 로직
	@ResponseBody
	@PostMapping("/BestCounting.bo")
	public int bestBoardCounting(int rf_board_idx) {
		
		int count = service.countBoardBest(rf_board_idx);
//		System.out.println(count);
		return count;
	}
		
	
	
	
	// 댓글쓰기
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
	
	// 댓글목록 출력
	@ResponseBody
	@PostMapping("/ReplyList.re")
	public List<ReplyVO> replyList(@RequestParam int reply_bo_ref){
		
		List<ReplyVO> replyList = service.replyList(reply_bo_ref);
		System.out.println(replyList);
		return replyList;
	}
		
}
