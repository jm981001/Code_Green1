package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.ItemVO;
import com.itwillbs.Code_Green.vo.QnaVO;

public interface ItemMapper {
	
	//상품 조회수 증가
	void updateReadcount(int item_idx);

	//상품 상세 정보 조회
	ItemVO selectItem(int item_idx);

	//상품 후기
	List<BoardVO> selectReview(
			@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType") String searchType, 
			@Param("item_idx")int item_idx);
	
	//상품 후기 별점높은순
	List<BoardVO> selectGoodList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("item_idx")int item_idx);


	//상품 후기 추천 많은순
	List<BoardVO> selectBestList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("item_idx")int item_idx);

	//상품 후기 별점낮은순
	List<BoardVO> selectWorstList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("item_idx")int item_idx);

	
	//리뷰 갯수 조회
	int selectReviewListCount(String searchType);

	
	//상품 갯수 조회
	int selectItemListCount(@Param("searchType") String searchType, @Param("keyword") String keyword);
	
	//상품 목록
	List<ItemVO> selectItemList(@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType, @Param("keyword") String keyword);

	//상세상세페이지 안 관련상품 6개
	List<ItemVO> selectItemList6(String item_category);

	//상품 문의 리스트
	List<QnaVO> selectQna(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("item_idx")int item_idx);

	//상세상세페이지 같은 브랜드상품 2개
	List<ItemVO> selectSameBrand(String manager_brandname);

	//마이페이지 찜한 상품 리스트
	List<ItemVO> wishList(@Param("startRow") int startRow,@Param("listLimit") int listLimit, @Param("member_id") String member_id);

	//마이페이지 찜한 상품 리스트 갯수
	int selectWishListCount(String member_id);





	

}
