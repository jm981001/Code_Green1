package com.itwillbs.Code_Green.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.Code_Green.service.ReviewService;
import com.itwillbs.Code_Green.vo.BoardStarVO;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.File_boardVO;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	//------------리뷰작성-------------------------------------------
	@PostMapping(value = "/ReviewWritePro.bo")
	public String reviewWritePro( @ModelAttribute BoardVO board,@ModelAttribute File_boardVO file, Model model,int item_idx , HttpSession session, @ModelAttribute BoardStarVO star) {
//		@RequestParam String board_idx
		
		String uploadDir = "/resources/commUpload"; // 가상의 업로드 경로
		// => webapp/resources 폴더 내에 upload 폴더 생성 필요
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		System.out.println("실제 업로드 경로 : " + saveDir);
		
		File f = new File(saveDir); // 실제 경로를 갖는 File 객체 생성
		// 만약, 해당 경로 상에 디렉토리(폴더)가 존재하지 않을 경우 생성
		if(!f.exists()) { // 해당 경로가 존재하지 않을 경우
			// 경로 상의 존재하지 않는 모든 경로 생성
			f.mkdirs();
		}
		
		// BoardVO 객체에 전달된 MultipartFile 객체 꺼내기
		MultipartFile mFile = file.getFile_1();
		MultipartFile mFile2 = file.getFile_2();
		
		String originalFileName = mFile.getOriginalFilename();
		String originalFileName2 = mFile2.getOriginalFilename();
		String uuid = UUID.randomUUID().toString();
		System.out.println("업로드 될 파일명 : " + uuid + "_" + originalFileName);
		
		file.setFile1(uuid + "_" + originalFileName);
		file.setFile2(uuid + "_" + originalFileName2);
		
		int insertCount = service.registReview(board);
		int file_insertCount = service.registReview_file(file);
		int starCount= service.StarScore(star);
		model.addAttribute("item_idx", item_idx);
		System.out.println("상품번호 " +item_idx);
//		model.addAttribute("board_idx", board_idx);
//		System.out.println("게시판번호 " +board_idx);
		
		if(insertCount > 0) {
			if(file_insertCount > 0) {
				try {
					mFile.transferTo(new File(saveDir, file.getFile1()));
					mFile2.transferTo(new File(saveDir, file.getFile2()));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				return "redirect:/ItemDetail.bo";
			} else {
				model.addAttribute("msg", "파일업로드 실패!");
				return "member/fail_back";
			}
		}else {
			model.addAttribute("msg", "글 쓰기 실패!");
			return "member/fail_back";
		}
		
	}	
	
	
	
	//------------리뷰 등록 처리-------------------------------------------
	
	
	
	//------------리뷰 수정 (할...꺼야..?)-------------------------------------------
	@GetMapping(value = "/ReviewModify.bo")
	public String brand_main() {
		return "item/review_modify";
	}
	
	
	
	//------------리뷰 삭제-------------------------------------------
	

	
	@GetMapping(value = "/ReviewDelete.bo")
	public String deletePro(@RequestParam String board_idx, Model model, HttpSession session,@RequestParam String item_idx) {
		// Service - removeBoard() 메서드 호출하여 삭제 작업 요청
		// => 파라미터 : BoardVO 객체, 리턴타입 : int(deleteCount)
			int deleteCount = service.removeReview(board_idx);
			model.addAttribute("item_idx", item_idx);
			// 삭제 실패 시 "패스워드 틀림!" 메세지 저장 후 fail_back.jsp 페이지로 포워딩
			// 아니면, BoardList.bo 서블릿 요청(페이지번호 전달)
			if(deleteCount > 0) {
				return "redirect:/ItemDetail.bo";
//				return "redirect:/ItemList.bo?";
			}
		return "member/fail_back";
	}	
	
	//------------내 리뷰 리스트 (할...꺼야...?)-------------------------------------------
	


	
	
	
	
	
	
	
}
