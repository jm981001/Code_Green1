package com.itwillbs.Code_Green.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.Code_Green.service.RecipeService;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.File_boardVO;
import com.itwillbs.Code_Green.vo.PageInfo;
import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

@Controller
public class RecipeController {
	
	@Autowired
	private RecipeService service;
	
	// 레시피 메인(리스트)
	@GetMapping(value = "/recipe_main.bo")
	public String recipe_main(@RequestParam(defaultValue = "") String searchType,
							  @RequestParam(defaultValue = "") String keyword,
							  Model model) {
		
		List<BoardVO> recipeList = service.getRecipeList(searchType, keyword);
		System.out.println(recipeList);
		
//		List<File_boardVO> recipe_fileList = service.getRecipeFileList();
		model.addAttribute("recipeList", recipeList);
//		model.addAttribute("recipe_fileList", recipe_fileList);
		return "recipe/recipe_main";
	}
	
	
	//레시피 폼
	@GetMapping(value = "/recipe_write.bo")
	public String recipe_write() {
		
		return "recipe/recipe_write";
	}
	
	// 레시피 작성
	@PostMapping(value = "/recipe_writePro.bo")
	public String recipe_writePro(@ModelAttribute BoardVO board, @ModelAttribute File_boardVO fileBoard, Model model, HttpSession session) {
		
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

				int insertCount = service.writeRecipeBoard(board);
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
						model.addAttribute("msg", "파일 업로드 실패하였습니다.");
						return "member/fail_back";
					}
					
				} else {
					
					model.addAttribute("msg", "글 등록에 실패하였습니다.");
					return "member/fail_back";
				}
	}
	
	
	//레시피 상세보기
	@GetMapping(value = "/recipe_detail.bo")
	public String recipe_detail(@RequestParam int board_idx, Model model) {
	
		BoardVO recipe = service.getRecipe(board_idx);
		
		model.addAttribute("recipe", recipe);
		
		return "recipe/recipe_detail";
	}
	
	// 레시피 수정 - 원본글 불러오기
	@GetMapping(value = "/recipe_modify.bo")
	public String recipe_modify(@RequestParam int board_idx, Model model) {
	
		BoardVO recipe = service.getRecipe(board_idx);
		
		model.addAttribute("recipe", recipe);
		
		return "recipe/recipe_modify";
	}
	
	
}
