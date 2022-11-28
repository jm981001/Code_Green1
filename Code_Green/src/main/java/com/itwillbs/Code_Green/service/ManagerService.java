package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.ManagerMapper;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.File_ItemVO;
import com.itwillbs.Code_Green.vo.ItemVO;
import com.itwillbs.Code_Green.vo.ManagerVO;
import com.itwillbs.Code_Green.vo.QnaVO;
import com.itwillbs.Code_Green.vo.SellVO;

@Service
public class ManagerService {

	@Autowired
	private ManagerMapper mapper;

//	가입
	public int joinManager(ManagerVO manager) {
		return mapper.insertManager(manager);
	}
//	로그인
	// BCryptPasswordEncoder 활용한 로그인을 위해 패스워드 조회 - getPasswd()
	// => 파라미터 : 아이디, 리턴타입 : String
	public String getPasswd(String manager_id) {
		return mapper.selectPasswd(manager_id);
	}
	

//	 브랜드 정보 조회 수행 getManagerInfo()
//	=> 파라미터 : 아이디, 리턴타입 : ManagerVO(manager)
	public ManagerVO getManagerInfo(String manager_id) {
		return mapper.selectManagerInfo(manager_id);
	}
	
	// 브랜드 상세정보조회(브랜드마이페이지)
	public ManagerVO getBrandInfo(String manager_id) {
		return mapper.selectBrandInfo(manager_id);
	}
	

	// 브랜드 정보수정(브랜드마이페이지)
	public int modifyManager(ManagerVO manager) {
		return mapper.updateBrandInfo(manager);
	}
	
	// 브랜드 삭제(탈퇴)
	public int deleteManager(String manager_id) {
		return mapper.deleteBrand(manager_id);
	}
	//상품 목록 조회
	
	public List<ItemVO> getItemList( int startRow, int listLimit, String searchType, String keyword,String id) {
		return mapper.selectItemList (startRow, listLimit, searchType, keyword,id);
	}
	
		
	// 상품 갯수 조회
	public int getItemListCount(String searchType, String keyword,String id) {
		return mapper.selectItemListCount(searchType, keyword,id);
	}
	
	// 상품 상세조회
	public ItemVO getItemInfo(int item_idx) {
		return mapper.selectItemInfo(item_idx);
	}
	
	
	
	// 새 상품등록(파일제외)
	public int newProducts(ItemVO item, int manager_idx) {
		return mapper.insertProducts(item,manager_idx);
	}
	

	// 새 상품등록- 파일업로드
	public int newProductsFile(File_ItemVO fileItem) {
		return mapper.insertProductsFile(fileItem);
	}
	
	
	 // 상품 등록 원글 불러오기  
		public ItemVO getProducts(int item_idx) {
			return mapper.selectProducts(item_idx);
		}

	
	//상품 파일 수정
	public int modifyItemFile(File_ItemVO fileItem) {
		return mapper.updateItemFileModify(fileItem);
	}
	
	
	// 상품 글 수정
	public int modifyProducts(ItemVO item, int item_idx) {
		return mapper.updateItemModify(item,item_idx);
	}


	
	
//	 문의글 리스트
	public List<QnaVO> getQnaBoardList(int startRow, int listLimit, String searchType, String keyword,String id) {
		return mapper.selectQnaBoardList(startRow,listLimit,searchType,keyword,id);
	}
	
	
	//문의글 갯수 조회
	public int getQnaBoardListCount(String searchType, String keyword,String id) {
		return mapper.selectQnaBoardListCount(searchType, keyword,id);
	}

	
	// 문의글 상세조회
	public QnaVO getQnaInfo(String qna_idx) {
		return mapper.selectQnaInfo(qna_idx);
	}
	
	//총주문수
	public int getTotalsellCount() {
		return mapper.selectTotalsellCount();
	}
	//문의글 답글
	public int registQnaboard(QnaVO qna) {
		return mapper.updateQnaboard(qna);
	}
	//문의글 삭제-수정
	public int removeQnaboard(String qna_idx) {
		return mapper.deleteQnaboard(qna_idx);
	}
	//주문조회
	public List<SellVO> getOrderList(int startRow, int listLimit, String searchType, String keyword,String id) {
		return mapper.selectOrderList(startRow, listLimit, searchType, keyword,id);
	}
	//주문 갯수조회
	public int getOrderListCount(String searchType, String keyword,String id) {
		return mapper.selectOrderListCount(searchType,keyword,id);
	}


	  //정민 매출 3순위
	   public List<ItemVO> getTop3(String sId) {
	      return mapper.getTop3(sId);
	   }
	   //정민 팔로우 수
	   public int follow(String sId) {
	      return mapper.follow(sId);
	   }
	 //총매출,주문수
	   public ManagerVO getOrderTotal(String sId) {
	   	return mapper.selectTotalMoneyOrder(sId);
	   }
	
	
	   

	   
	

	   
	   
	   
	   
}
