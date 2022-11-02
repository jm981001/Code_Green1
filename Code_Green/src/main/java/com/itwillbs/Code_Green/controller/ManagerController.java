package com.itwillbs.Code_Green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManagerController {
	
	//------------매니저페이지 메인-------------------------------------------
	@RequestMapping(value = "manager_index", method = RequestMethod.GET)
	public String index() {
		return "manager/index";
	}
	
	//------------매니저페이지 상품목록-------------------------------------------
		@RequestMapping(value = "products", method = RequestMethod.GET)
		public String products() {
			return "manager/products";
		}
		
	//------------매니저페이지 상품관리-------------------------------------------
		@RequestMapping(value = "product_manage", method = RequestMethod.GET)
		public String product_manage() {
			return "manager/product_manage";
		}
		
   //------------매니저페이지 상품수정-------------------------------------------
		@RequestMapping(value = "edit_product", method = RequestMethod.GET)
		public String edit_product() {
			return "manager/edit_product";
		}		
		
		
	//------------매니저페이지 제품등록-------------------------------------------
		@RequestMapping(value = "product_registe", method = RequestMethod.GET)
		public String product_registe() {
			return "manager/product_registe";
		}		
		
		
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
		
	//------------매니저페이지 매출관리-------------------------------------------
		@RequestMapping(value = "sales_main", method = RequestMethod.GET)
		public String sales_main() {
			return "manager/sales_main";
		}


	//------------매니저페이지 답변관리-------------------------------------------
		@RequestMapping(value = "answerboardlist", method = RequestMethod.GET)
		public String answerboardlist() {
			return "manager/answerboardlist";
		}
		
		
	//------------매니저페이지 답글달기-------------------------------------------
		@RequestMapping(value = "review_board_manage", method = RequestMethod.GET)
		public String review_board_manage() {
			return "manager/review_board_manage";
		}		
		
	//------------매니저페이지 팔로워-------------------------------------------
		@RequestMapping(value = "follower_list", method = RequestMethod.GET)
		public String follower_list() {
			return "manager/follower_list";
		}
		
		
	//------------매니저페이지 정산-------------------------------------------
		@RequestMapping(value = "sales_management", method = RequestMethod.GET)
		public String sales_management() {
			return "manager/sales_management";
		}
		
	//------------매니저페이지 내브랜드정보-------------------------------------------
		@RequestMapping(value = "brand_mypage", method = RequestMethod.GET)
		public String brand_mypage() {
			return "manager/brand_mypage";
		}

	//------------매니저페이지 내브랜드정보수정-------------------------------------------
		@RequestMapping(value = "brand_settings", method = RequestMethod.GET)
		public String brand_settings() {
			return "manager/brand_settings";
		}
	
	

}
