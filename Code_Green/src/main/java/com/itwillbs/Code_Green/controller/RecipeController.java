package com.itwillbs.Code_Green.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.Code_Green.service.RecipeService;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.File_boardVO;
import com.itwillbs.Code_Green.vo.ItemVO;
import com.itwillbs.Code_Green.vo.PageInfo;
import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

@Controller
public class RecipeController {
	
	@Autowired
	private RecipeService service;
	
	// 레시피 메인(리스트)
	@GetMapping(value = "/recipe_main.bo")
	public String recipe_main(@RequestParam(defaultValue = "") String keyword,
							  @RequestParam(defaultValue = "1") int pageNum,
							  Model model) {
		
		int listLimit = 6; 
		
		int pageListLimit = 10; 

		int startRow = (pageNum - 1) * listLimit;
		
		// 전체 레시피 목록 조회
		List<BoardVO> recipeList = service.getRecipeList(startRow, listLimit, keyword);
		
		// 레시피 글 목록 갯수 조회
		int listCount = service.getRecipeCount();
		
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("recipeList", recipeList);
		
		System.out.println(recipeList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "recipe/recipe_main";
	}
	
	
	// 레시피 폼
	@GetMapping(value = "/recipe_write.bo")
	public String recipe_write(@RequestParam String id, Model model) {
		
		// 해당 기업이 올린 상품 조회
		List<ItemVO> myItem = service.getmyItem(id);
		
		model.addAttribute("myItem", myItem);
		
		return "recipe/recipe_write";
	}
	
	// 레시피 작성
	@PostMapping(value = "/recipe_writePro.bo")
	public String recipe_writePro(
								  @ModelAttribute BoardVO board, 
			                      @ModelAttribute File_boardVO fileBoard,
			                      @RequestParam(name = "item_idx", required = false) String item_idx,
			                      Model model, 
			                      HttpSession session) {
		
		// 레시피에 사용한 아이템 번호
		int use_item_idx = Integer.parseInt(item_idx);
		
		// 가상 업로드 경로에 대한 실제 업로드 경로 알아내기
		// => 단, request 객체에 getServletContext() 메서드 대신, session 객체로 동일한 작업 수행
		//    (request 객체에 해당 메서드 없음)
		String uploadDir = "/resources/recUpload"; // 가상의 업로드 경로
//				// => webapp/resources 폴더 내에 upload 폴더 생성 필요
		String saveDir = session.getServletContext().getRealPath(uploadDir);
//				System.out.println("실제 업로드 경로 : " + saveDir);
		
		File f = new File(saveDir); // 실제 경로를 갖는 File 객체 생성
		// 만약, 해당 경로 상에 디렉토리(폴더)가 존재하지 않을 경우 생성
		if(!f.exists()) { // 해당 경로가 존재하지 않을 경우
			// 경로 상의 존재하지 않는 모든 경로 생성
			f.mkdirs();
		}
		
		// BoardVO 객체에 전달된 MultipartFile 객체 꺼내기
		// => 복수개의 파일이 각각 다른 name 속성으로 전달된 경우
		// => 각각의 MultipartFile 객체를 통해 getFile() 메서드 호출
//						MultipartFile mFile = board.getFile();
		
		String uuid = UUID.randomUUID().toString();
		
	
		MultipartFile mFile1 = fileBoard.getFile_1();
		MultipartFile mFile2 = fileBoard.getFile_2();
		
		String originalFileName1 = mFile1.getOriginalFilename();
		String originalFileName2 = mFile2.getOriginalFilename();

		
		// ========================================================
		
		if(!originalFileName1.equals("")) {
			fileBoard.setFile1(uuid + "_" + originalFileName1);
//					System.out.println("업로드 될 파일명 : " + uuid + "_" + originalFileName1);
		}

		if(!originalFileName2.equals("")) {
			fileBoard.setFile2(uuid + "_" + originalFileName2);
//					System.out.println("업로드 될 파일명 : " + uuid + "_" + originalFileName2);
		}
		
		// ===========================================================

		int insertCount = service.writeRecipe(board, use_item_idx);
		int file_insertCount = service.writeRecipeFile(fileBoard);
		
		if(insertCount > 0) {
			if(file_insertCount > 0) {
				try {
					if(fileBoard.getFile1() != null) {
						mFile1.transferTo(new File(saveDir, fileBoard.getFile1()));
					}
					if(fileBoard.getFile2() != null) {
						mFile2.transferTo(new File(saveDir, fileBoard.getFile2()));
					}
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

				return "redirect:/recipe_main.bo";
			} else {
				model.addAttribute("msg", "파일 업로드가 되지 않았습니다.<br>다시 시도해 주세요.");
				return "member/fail_back";
			}
			
		} else {
			
			model.addAttribute("msg", "레시피 등록이 되지 않았습니다<br>다시 시도해 주세요.");
			return "member/fail_back";
		}
	}
	
	
	// 레시피 상세보기
	@GetMapping(value = "/recipe_detail.bo")
	public String recipe_detail(@RequestParam int board_idx, @RequestParam String manager_id, Model model) {
		
		System.out.println(manager_id);
		// 등록한 레시피 불러오기
		BoardVO recipe = service.getRecipe(board_idx);
		
		// 레시피에 사용한 상품 불러오기
		ItemVO use_item = service.getUseItem(board_idx);
		
		// 레시피 작성자(브랜드) 관련상품 불러오기
		List<ItemVO> related_item = service.getRelatedItem(manager_id);
		
		model.addAttribute("recipe", recipe);
		
		model.addAttribute("use_item" ,use_item);

		model.addAttribute("related_item" ,related_item);
		
		System.out.println(related_item);
		
		return "recipe/recipe_detail";
	}
	
	// 레시피 수정 - 원본글 불러오기
	@GetMapping(value = "/recipe_modify.bo")
	public String recipe_modify(@RequestParam int board_idx, @RequestParam String id, Model model) {
	
		BoardVO recipe = service.getRecipe(board_idx);
		
		model.addAttribute("recipe", recipe);
		
		// 해당 기업이 올린 상품 조회
		List<ItemVO> myItem = service.getmyItem(id);
		
		model.addAttribute("myItem", myItem);
		
		return "recipe/recipe_modify";
	}
	
	// 레시피 글 수정 / 파일 수정
	@PostMapping(value = "/recipe_modifyPro.bo")
	public String recipe_modifyPro(@ModelAttribute BoardVO board,
								   @ModelAttribute File_boardVO fileBoard,
								   @RequestParam int board_idx,
								   @RequestParam(name = "item_idx", required = false) String item_idx,
								   HttpSession session,Model model) {
		
		int use_item_idx = Integer.parseInt(item_idx);
		
		// 기존 실제파일명을 변수에 저장 ( 새파일 업로드시 삭제필요 )
		String oldRealFile1 = fileBoard.getFile1();
		String oldRealFile2 = fileBoard.getFile2();
		
		String uuid = UUID.randomUUID().toString();
		String uploadDir = "/resources/recUpload";	// 가상의 업로드 경로
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
		
		// 새 파일 업로드 여부 판별 저장 변수 선언(true : 새 파일 업로드)
		boolean isNewFile1 = false, isNewFile2 = false; 
		
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
		
		
		// ----파일 수정----
		// 새 파일 선택 여부와 관계없이 공통으로 수정 작업 요청
		int updateFileCount = service.modifyRecipeFile(fileBoard);
		
		if(updateFileCount == 0) {
			
			model.addAttribute("msg","파일 수정이 되지 않았습니다.<br>다시 시도해 주세요.");
			return "member/fail_back";
			
		} else {
			if(isNewFile1) {
				try {
					mFile1.transferTo(new File(saveDir, fileBoard.getFile1()));
					File f1 = new File(saveDir, oldRealFile1); 
					
					if(f1.exists()) {
						f1.delete();
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
					File f2 = new File(saveDir, oldRealFile2); 
					
					if(f2.exists()) {
						f2.delete();
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
		
		//  ----글 수정----
		int updateCount = service.modifyRecipe(board, use_item_idx);
		
		System.out.println(updateCount);
		
		if(updateCount == 0) {
			model.addAttribute("msg", "레시피 수정이 되지 않았습니다.<br>다시 시도해 주세요.");
			return "member/fail_back";
		}
		
		return "redirect:/recipe_detail.bo?board_idx=" + board_idx + "&manager_id=" + board.getBoard_id();
	}
	
	// 레시피 삭제 폼
	@GetMapping(value = "/recipe_delete.bo")
	public String recipe_delete() {
	
		return "recipe/recipe_delete";
	}
	
	// 레시피 삭제
	@PostMapping(value = "/recipe_deletePro.bo")
	public String recipe_deletePro(@RequestParam int board_idx, Model model, HttpSession session) {
		
		//글 삭제 전 실제 업로드된 파일 삭제작업
		String realFile1 = service.getRealFile1(board_idx);
		String realFile2 = service.getRealFile2(board_idx);
		
		int deleteCount = service.removeRecipe(board_idx);
		int deleteFileCount = service.removeRecipeFile(board_idx);
		
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
			
			return "redirect:/recipe_main.bo";
			
		} else {
			model.addAttribute("msg", "레시피 삭제가 되지 않았습니다.<br>다시 시도해주세요.");
			return "member/fail_back";
		}
			
	}

	
	
}
