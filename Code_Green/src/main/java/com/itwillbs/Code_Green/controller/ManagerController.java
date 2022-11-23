package com.itwillbs.Code_Green.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.xml.ws.ServiceMode;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.Code_Green.service.ManagerService;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.File_ItemVO;
import com.itwillbs.Code_Green.vo.ItemVO;
import com.itwillbs.Code_Green.vo.ManagerVO;
import com.itwillbs.Code_Green.vo.PageInfo;
import com.itwillbs.Code_Green.vo.QnaVO;
import com.itwillbs.Code_Green.vo.SellVO;

@Controller
public class ManagerController {
	
	@Autowired
	private ManagerService service;

	@PostMapping(value = "/ManagerLoginPro.me")
	public String managerloginPro(@ModelAttribute ManagerVO manager, Model model, HttpSession session,
			String manager_id) {

		ManagerVO selectManager = service.getManagerInfo(manager_id);
//		System.out.println(selectManager);

		// ------------------ BCryptPasswordEncoder 활용한 로그인 판별 ----------------------
		// 1. BCryptPasswordEncoder 객체 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		// 2. member 테이블에서 id 에 해당하는 패스워드 조회 후 리턴값 저장(getPasswd())
		// => 파라미터 : 아이디 리턴타입 : String(passwd)
		String passwd = service.getPasswd(manager.getManager_id());
//				System.out.println(passwd);

		// 3. 조회 결과를 활용하여 로그인 성공 여부 판별
		// 1) 아이디가 없을 경우(passwd 값이 null) 실패
		// 2) 패스워드 비교(BCryptPasswordEncoder 객체의 matches() 메서드 활용)
		// 2-1) 다를 경우 실패
		// 2-2) 같을 경우 성공

		if (passwd == null || !encoder.matches(manager.getManager_pass(), passwd)) {
			model.addAttribute("msg", "기업 로그인 실패! 힝~");
//			System.out.println(manager.getManager_id() + ", " + manager.getManager_pass());
			return "member/fail_back";
		} else {
			session.setAttribute("sId", manager.getManager_id());
			if (selectManager.getManager_storecode() != null) {
				session.setAttribute("sCode", selectManager.getManager_storecode());
			}
			return "redirect:/";
		}

	}

	@PostMapping(value = "/ManagerJoinPro.me")
	public String joinManagerPro(@ModelAttribute ManagerVO manager, Model model, HttpSession session) {
		
		// ------------------ BCryptPasswordEncoder 활용한 해싱 ----------------------
		
		// 1. BCryptPasswordEncoder 객체 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		// 2. BCryptPasswordEncoder 객체의 encode() 메서드를 호출하여 해싱 결과 리턴
		String securePasswd = encoder.encode(manager.getManager_pass());
		// 3. MemberVO 객체의 패스워드에 암호문 저장
		manager.setManager_pass(securePasswd);
		
		
		String uploadDir = "/resources/brand_logo"; // 가상의 업로드 경로
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
		MultipartFile mFile = manager.getFile();
		
		String originalFileName = mFile.getOriginalFilename();
		long fileSize = mFile.getSize();
		System.out.println("파일명 : " + originalFileName);
		System.out.println("파일크기 : " + fileSize + " Byte");
		
		// 파일명 중복 방지를 위한 대책
		// 시스템에서 랜덤ID 값을 추출하여 파일명 앞에 붙여 "랜덤ID값_파일명" 형식으로 설정
		// 랜덤ID 는 UUID 클래스 활용(UUID : 범용 고유 식별자)
		String uuid = UUID.randomUUID().toString();
		System.out.println("업로드 될 파일명 : " + uuid + "_" + originalFileName);
		
		// BoardVO 객체에 원본 파일명과 업로드 될 파일명 저장
		// => 단, uuid 를 결합한 파일명을 사용할 경우 원본 파일명과 실제 파일명을 구분할 필요 없이
		//    하나의 컬럼에 저장해두고, 원본 파일명이 필요할 경우 "_" 를 구분자로 지정하여
		//    문자열을 분리하면 두번째 파라미터가 원본 파일명이 된다!
		manager.setManager_realfile(originalFileName); // 실제로는 불필요한 컬럼
		manager.setManager_original_file(uuid + "_" + originalFileName);
		
		
		
		int insertCount = service.joinManager(manager);

		if (insertCount > 0) { // 가입 성공
			System.out.println("가입 성공!");
			return "redirect:/join_result";
		} else { // 가입 실패
			model.addAttribute("msg", "가입 실패!");
			return "member/fail_back";
		}
	}
	
	//------------매니저페이지 메인(로그인시 각 브랜드별 페이지)-------------------------------------------
		@GetMapping(value = "/ManagerInfo.me")
		public String getManagerInfo(
			@RequestParam String manager_id, Model model, HttpSession session) {
		// 세션 아이디 가져와서 sId 변수에 저장
		String sId = (String)session.getAttribute("sId");
		System.out.println(manager_id + ", " + sId);
		if(manager_id == null || sId == null || manager_id.equals("") || (!manager_id.equals(sId) && !sId.equals("admin"))) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "member/fail_back";
		} else {
			ManagerVO Manager = service.getManagerInfo(manager_id); ; // 파라미터는 검색할 아이디 전달
			
			System.out.println(Manager);
			model.addAttribute("manager", Manager);
			
		}
		
		SellVO sellTotal = service.getTotalMoney();
		int sell_count = service.getTotalsellCount();
		
		model.addAttribute("sellTotal", sellTotal);
		model.addAttribute("sellCount", sell_count);
		
		return "manager/index";
		
		
	}
	
		//------------매니저페이지 메인-------------------------------------------
		@RequestMapping(value = "manager_index", method = RequestMethod.GET)
		public String index() {
			return "manager/index";
		}
		
	
	//------------매니저페이지 내브랜드정보조회-------------------------------------------
		
	@GetMapping(value = "brand_mypage")
	public String brand_mypage(@RequestParam String id, Model model, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		System.out.println("sId : " + sId );
			
		ManagerVO brandInfo = service.getBrandInfo(sId);
		System.out.println(brandInfo);
		
		model.addAttribute("brandInfo",brandInfo);
		System.out.println();
		
		return "manager/brand_mypage";
	
	}
	
	//------------매니저페이지 내브랜드정보 수정----------------------------
	@GetMapping(value = "brand_mypage_modify")
	public String modifyManager(Model model, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		System.out.println("sId : " + sId );
		
		ManagerVO brandInfo = service.getBrandInfo(sId);
		model.addAttribute("brandInfo",brandInfo);
		
		return "manager/brand_mypage_modify";
	}
	
		
	
	//------------매니저페이지 내브랜드정보 수정 업데이트(브랜드 로고 파일도 같이수정...)----------------------------
	
	@GetMapping(value = "brand_mypage_modifyPro.bo")
	public String modifyManagerPro(@ModelAttribute ManagerVO manager,
									Model model, HttpSession session) {

		

		// 기존 실제파일명을 변수에 저장 ( 새파일 업로드시 삭제필요 )
		String oldRealFile1 = manager.getManager_realfile();
		String oldRealFile2 = manager.getManager_original_file();
		
		String uuid = UUID.randomUUID().toString();
		String uploadDir = "/resources/commUpload";	// 가상의 업로드 경로
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		
		File f = new File(saveDir); // 실제 경로를 갖는 File 객체 생성
		// 만약, 해당 경로 상에 디렉토리(폴더)가 존재하지 않을 경우 생성
		if(!f.exists()) { // 해당 경로가 존재하지 않을 경우
			// 경로 상의 존재하지 않는 모든 경로 생성
			f.mkdirs();
		}	
		// ManagerVO 객체에 전달된 MultipartFile 객체 꺼내기
		MultipartFile mFile1 = manager.getFile();
		
		// 새 파일 업로드 여부 판별 저장 변수 선언(true : 새 파일 업로드)
		boolean isNewFile1 = false; 
		
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
			manager.setManager_original_file(uuid + "_" + originalFileName);
			// 새 파일 업로드 표시
			isNewFile1 = true;
		} 
		
		
		// ======================정보수정 ======================
		int updateCount = service.modifyManager(manager);
		System.out.println("정보수정" + updateCount);
		System.out.println("수정정보" + manager );
		
		
		if(updateCount > 0) {
//			model.addAttribute("msg", "수정 성공!");
//			model.addAttribute("manager",manager);
			return "redirect:/brand_mypage?id=" + manager.getManager_id();
		}
		model.addAttribute("fail", "수정 실패!");
		return "manager/mn_fail_back";
	}
	
		//------------매니저페이지 내브랜드정보 삭제----------------------------
		
	@GetMapping(value = "brand_mypage_delete")
	public String brandDelete(@ModelAttribute ManagerVO manager, @RequestParam String manager_id,
			                   Model model, HttpSession session) {
	
		String sId = (String)session.getAttribute("sId");
		
		int deleteCount = service.deleteManager(manager_id);
		System.out.println("정보삭제" + deleteCount);
		
		if(deleteCount > 0) {
//			model.addAttribute("msg", "탈퇴 성공!");
//			model.addAttribute("manager_id", manager_id);
//			model.addAttribute("manager", manager);
			session.invalidate();
			return "redirect:/";
			
		}else {
			
			model.addAttribute("fail", "탈퇴 실패");
			return "manager/mn_fail_back";
		}
		
		
	}

	
	
	//------------매니저페이지 (각브랜드별)상품목록조회(페이징처리같이)-------------------------------------------
	@GetMapping(value = "/products")
	public String itemList ( Model model, HttpSession session,
							@RequestParam(defaultValue = "1")int pageNum,
							@RequestParam(defaultValue = "")String searchType,
							@RequestParam(defaultValue = "")String keyword) {
		
		String id = (String)session.getAttribute("sId");
		System.out.println("id : " + id );
		System.out.println("searchType : " + searchType);
		System.out.println("keyword : " + keyword);
		
		//페이징처리
		int listLimit = 10;// 한 페이지 당 표시할 게시물 목록 갯수 
		int pageListLimit = 10;// 한 페이지 당 표시할 페이지 목록 갯수
		
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum -1) * listLimit;
		
		// Service 객체의 getItemList() 메서드를 호출하여 게시물 목록 조회
		// => 파라미터 : 시작행번호, 페이지 당 목록 갯수
		// => 리턴타입 : List<ItemVO>(itemList)
		List<ItemVO> itemList = service.getItemList(id, startRow, listLimit, searchType, keyword);
		
		// Service 객체의 getItemListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
		// => 파라미터 : 없음, 리턴타입 : int(listCount)
		int listCount = service.getItemListCount(searchType, keyword);
//		System.out.println("검색결과(목록 수)" + listCount);
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
		PageInfo pageinfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
	
		// 상품 목록(itemList) 과 페이징 처리 정보(pageInfo)를 Model 객체에 저장
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageInfo", pageinfo);
//		System.out.println("상품목록" + itemList);
		
		return "manager/products";
	}
	
	
		
		
	
	//------------ 상품 상세 조회-------------------------------------------	
	@RequestMapping(value = "/products_detail", method = RequestMethod.GET)
	public String qna_Item_Detail( Model model, HttpSession session, String item_idx) {
		
		String sId = (String)session.getAttribute("sId");
		
		System.out.println("item_idx : " + item_idx);
		
	
		ItemVO ItemInfo = service.getItemInfo(item_idx);
		System.out.println("상품 상세 : " + ItemInfo);
		
		model.addAttribute("ItemInfo", ItemInfo);
		
		return "manager/products_detail";
	}
	
	
		

		
	//------------매니저페이지 상품등록 폼페이지-------------------------------------------
		@RequestMapping(value = "product_register", method = RequestMethod.GET)
		public String product_register() {
				return "manager/product_register";
			}		
				
		
	//------------매니저페이지 상품등록-------------------------------------------
		@RequestMapping(value = "product_registerPro.bo", method = RequestMethod.GET)
		public String product_registerPro(@ModelAttribute ItemVO item, @ModelAttribute File_ItemVO fileItem, 
				                           Model model, HttpSession session ) {
			
			String uploadDir = "/resources/itemUpload";
			String saveDir = session.getServletContext().getRealPath(uploadDir);

			File f = new File(saveDir); // 실제 경로를 갖는 File 객체 생성
			// 만약, 해당 경로 상에 디렉토리(폴더)가 존재하지 않을 경우 생성
			if(!f.exists()) { // 해당 경로가 존재하지 않을 경우
				// 경로 상의 존재하지 않는 모든 경로 생성
				f.mkdirs();
			}
			
			String uuid = UUID.randomUUID().toString();
			

			MultipartFile mFile1 = fileItem.getFile_1();
			MultipartFile mFile2 = fileItem.getFile_2();
			
			String originalFileName1 = mFile1.getOriginalFilename();
			String originalFileName2 = mFile2.getOriginalFilename();

			// ========================================================
			
			if(!originalFileName1.equals("")) {
				fileItem.setFile1(uuid + "_" + originalFileName1);
//				System.out.println("업로드 될 파일명 : " + uuid + "_" + originalFileName1);
			}

			if(!originalFileName2.equals("")) {
				fileItem.setFile2(uuid + "_" + originalFileName2);
//				System.out.println("업로드 될 파일명 : " + uuid + "_" + originalFileName2);
			}
		
			// ===========================================================
			
			int insertCount = service.newProducts(item);
			int file_insertCount = service.newProductsFile(fileItem);
			
			if(insertCount > 0) {
				if(file_insertCount > 0) {
					try {
						if(fileItem.getFile1() != null) {
							mFile1.transferTo(new File(saveDir, fileItem.getFile1()));
						}
						if(fileItem.getFile2() != null) {
							mFile2.transferTo(new File(saveDir, fileItem.getFile2()));
						}
						
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}

					return "redirect:/products";
				} else {
					model.addAttribute("msg", "파일 업로드 실패!");
					return "manager/mn_fail_back";
				}
				
			} else {
				
				model.addAttribute("msg", "상품 등록에 실패하였습니다. \n 다시한번 시도해주세요.");
				return "manager/mn_fail_back";
			}
	
			
			
			
		}		
		
		
	 //------------매니저페이지 상품수정 업데이트-------------------------------------------
		@GetMapping(value = "product_modify")
		public String edit_product(@ModelAttribute ItemVO item, 
									@ModelAttribute File_ItemVO fileItem, 
                                    Model model, HttpSession session ) { 
			
			
			// 기존 실제파일명을 변수에 저장 ( 새파일 업로드시 삭제필요 )
			String oldRealFile1 = fileItem.getFile1();
			String oldRealFile2 = fileItem.getFile2();
			
			String uuid = UUID.randomUUID().toString();
			String uploadDir = "/resources/itemUpload";	// 가상의 업로드 경로
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			
			File f = new File(saveDir); // 실제 경로를 갖는 File 객체 생성
			// 만약, 해당 경로 상에 디렉토리(폴더)가 존재하지 않을 경우 생성
			if(!f.exists()) { // 해당 경로가 존재하지 않을 경우
				// 경로 상의 존재하지 않는 모든 경로 생성
				f.mkdirs();
			}
			
			// ItemVO 객체에 전달된 MultipartFile 객체 꺼내기
			MultipartFile mFile1 = fileItem.getFile_1();
			MultipartFile mFile2 = fileItem.getFile_2();
			
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
				fileItem.setFile1(uuid + "_" + originalFileName);
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
				fileItem.setFile2(uuid + "_" + originalFileName);
				// 새 파일 업로드 표시
				isNewFile2 = true;
			}	
			
			// ==================== 덮어쓰기 과정시작 =========================
			// 새 파일 선택 여부와 관계없이 공통으로 수정 작업 요청
			int updateFileCount = service.modifyItemFile(fileItem);
			
			if(updateFileCount == 0) {
				
				model.addAttribute("msg","파일수정 실패");
				return "member/fail_back";
				
			} else {
				if(isNewFile1) {
					try {
						mFile1.transferTo(new File(saveDir, fileItem.getFile1()));

						File f1_1 = new File(saveDir, oldRealFile1); 
//						System.out.println("File f1_1 = new File(saveDir, oldRealFile1);  -> "+ f1_1);
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
						mFile2.transferTo(new File(saveDir, fileItem.getFile2()));
						File f2_2 = new File(saveDir, oldRealFile2); 
//						System.out.println("File f2_2 = new File(saveDir, oldRealFile1);  -> "+ f2_2);
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
				
			}
			return "";
		}
		// ========================= 상품 내용 수정 ===============================

//		int updateCount = service.modifyProducts(item);
		
		
		
		
		
		
		
		
		
	//------------매니저페이지 상품수정 업데이트-------------------------------------------
				
				
		
	//------------매니저페이지 재고관리-------------------------------------------
		@RequestMapping(value = "inventory_management", method = RequestMethod.GET)
		public String inventory_management() {
			return "manager/inventory_management";
		}
		
		
		
		
		
		
	//------------매니저페이지 주문현황-------------------------------------------
		@RequestMapping(value = "orders", method = RequestMethod.GET)
		public String orders() {
			return "manager/orders";
		}
	
		
	//------------매니저페이지 주문관리----------------------------------------
		@RequestMapping(value = "order_detail", method = RequestMethod.GET)
		public String order_detail() {
			return "manager/order_detail";
		}		
		
		//------------매니저페이지 배송관리----------------------------------------
		
		
		
		
		
		
		
	//------------매니저페이지 매출관리-------------------------------------------
		@RequestMapping(value = "sales_main", method = RequestMethod.GET)
		public String sales_main() {
			return "manager/sales_main";
		}



		

	//------------ 문의 글 목록 불러오기(페이징, 검색기능추가)-------------------------------------------	
	
		@GetMapping(value = "/qnaboard_list")
		public String qna_Board( Model model, HttpSession session,
				@RequestParam(defaultValue = "1")int pageNum,
				@RequestParam(defaultValue = "")String searchType,
				@RequestParam(defaultValue = "")String keyword) {
			
		
//			System.out.println(pageNum);
			
			// 페이징 처리를 위한 계산 작업
			int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수 
			int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
			
			// 조회 시작 게시물 번호(행 번호) 계산
			int startRow = (pageNum - 1) * listLimit;
			
			System.out.println(startRow);
			System.out.println(listLimit);
			System.out.println(pageListLimit);
			
			// Service 객체의 getBoardList() 메서드를 호출하여 게시물 목록 조회
			// => 파라미터 : 시작행번호, 페이지 당 목록 갯수
			// => 리턴타입 : List<BoardVO>(boardList)
			List<QnaVO> QnaBoardList = service.getQnaBoardList(startRow, listLimit, searchType, keyword);
			
			// Service 객체의 getBoardListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
			// => 파라미터 : 없음, 리턴타입 : int(listCount)
			int listCount = service.getQnaBoardListCount(searchType, keyword);
		
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
			
			String sId = (String)session.getAttribute("sId");
		
			// 페이징 처리 정보를 저장하는 PageInfo 클래스 인스턴스 생성 및 데이터 저장
			PageInfo pageInfo = new PageInfo(
					pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
//			System.out.println(pageInfo);
			// --------------------------------------------------------------------------------
			// 게시물 목록(boardList) 과 페이징 처리 정보(pageInfo)를 Model 객체에 저장
			model.addAttribute("QnaBoardList", QnaBoardList);
			model.addAttribute("pageInfo", pageInfo);

			System.out.println(QnaBoardList);
			
				return "manager/qnaboard_list";
		}
		
		
		
		//------------ 문의글 상세 조회-------------------------------------------	
		@RequestMapping(value = "/qnaboard_detail", method = RequestMethod.GET)
		public String qna_Board_Detail( Model model, HttpSession session, String qna_idx) {
			
			String sId = (String)session.getAttribute("sId");
			
			System.out.println("qna_idx : " + qna_idx  );
			
		
			QnaVO QnaInfo = service.getQnaInfo(qna_idx);
			System.out.println("문의글 상세 : " + QnaInfo);
			
			model.addAttribute("QnaInfo", QnaInfo);
			
			return "manager/qnaboard_detail";
		}
		
		//------------ 문의글 답변작성-------------------------------------------
		@GetMapping(value = "qnaboard_answer_detailPro")
		public String qnaboard_answer_detailPro(Model model, HttpSession session, QnaVO qna) {
			
			String sId = (String)session.getAttribute("sId");
			
		
			int updateCount = service.registQnaboard(qna);
			
			//빨리하자ㅠㅠㅠ
			
			
			
			return"manager/qnaboard_detail";
			
		}
		
		
		
		
		
		
		//------------ 문의글 답변수정-------------------------------------------	
		@GetMapping(value = "qnaboard_modify")
		public String qnaboard_modify(Model model, HttpSession session, QnaVO qna) {
			
			String sId = (String)session.getAttribute("sId");
			
			int updateCount = service.registQnaboard(qna);
			
			//빨리하자ㅠㅠㅠ
			
			return "qnaboard_answer_detail";
		}
		
		
		//------------ 문의글 답변삭제-------------------------------------------	
		
		@GetMapping(value = "qnaboard_delete")
		public String qnaboard_delete(@RequestParam String id, String idx, Model model, HttpSession session) {
			
			String sId = (String)session.getAttribute("sId");
			
		
			int delectCount = service.removeQnaboard(idx,id);
			System.out.println(delectCount);
			
			if(delectCount > 0) {
				return "qnaboard_list";
			}
			
			model.addAttribute("fail", "삭제실패!");
			return "manager/qnaboard_list";
		}
		
		
		

	//------------매니저페이지 팔로워-------------------------------------------
		@RequestMapping(value = "follower_list", method = RequestMethod.GET)
		public String follower_list() {
			return "manager/follower_list";
		}
		
		//------------매니저페이지 팔로워 목록 불러오기 -------------------------------------------
//		
//@GetMapping(value = "/follower_list")
//public String follower_list(@RequestParam String idx, Model model) {
//	
//	followVO follow = service.followInfo(idx);
//	//조회된 회원 1명의 데이터를 model 객체에 저장 (팔로우)
//	model.addAttribute("follow", follow);
//	
//	
//	return "manager/follower_list";
//}		
		
		
	//------------매니저페이지 정산-------------------------------------------
		@RequestMapping(value = "sales_management", method = RequestMethod.GET)
		public String sales_management() {
			return "manager/sales_management";
		}
		



	

}

