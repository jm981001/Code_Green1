<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="format-detection" content="telephone=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
	<title>간식류</title>
	<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/slick/slick/slick.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/nouislider/nouislider.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/lightGallery-master/dist/css/lightgallery.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/autopart.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/vendor.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
</head>
<body>
    
    
    <!-- 헤더 삽입 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 삽입 -->
    
    
    
    
    <div class="ps-page--single ps-page--vendor">
        <section class="ps-store-list">
            <div class="container">
                
                
                <div class="ps-section__wrapper">
                    <div class="ps-section__left">
                        <aside class="widget widget--vendor">
                            <h3 class="widget-title">카테고리</h3>
                            <ul class="menu--dropdown">
                                <li><a href="category_all">전체 상품</a> </li>
                                <li><a href="category_sale">특가 상품</a> </li>
                                <li><a href="category_fruit_vegi">과일 / 채소</a> </li>
                                <li><a href="category_dairy_drink">유제품 / 음료</a></li>
                                <li><a href="category_iced_easy">냉동 식품 / 간편 식품</a></li>
                                <li><a href="category_fish">해산물 </a></li>
                                <li><a href="category_snack">간식류</a></li>
                            </ul>
                        </aside>
                       
                    </div>
                    <div class="ps-section__right">
                    	<div id="category_h3">
							<h2>간식류</h2>
						</div> 
                        <nav class="ps-store-link">
                            <select class="form-select" aria-label="Default select example">
							  <option value="1">신상품순</option>
							  <option value="2">후기 많은순</option>
							  <option value="3">낮은 가격순</option>
							  <option value="4">높은 가격순</option>
							</select>
                        </nav>
							
                        <div class="ps-shopping ps-tab-root">
<!--                             <div class="ps-shopping__header"> -->
<!--                               <p>총<strong> 6</strong> 개의 상품</p> -->
<!--                                 <div class="ps-shopping__actions"> -->
                                	<!-- 이건혹시 만약 뷰 종류할거면 재활용 -->
                                	
<!--                                     <div class="ps-shopping__view"> -->
<!--                                         <p>View</p> -->
<!--                                         <ul class="ps-tab-list"> -->
<!--                                             <li class="active"><a href="#tab-1"><i class="icon-grid"></i></a></li> -->
<!--                                             <li><a href="#tab-2"><i class="icon-list4"></i></a></li> -->
<!--                                         </ul> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                            <div class="ps-tabs">
                                <div class="ps-tab active" id="tab-1">
                                    <div class="ps-shopping-product">
                                        <div class="row">
                                        
                                        	<!-- 반복문 시작 -->
                                        	<c:forEach var="item" items="${itemList }">
                                        	<!-- 상품 1개당 시작 -->
                                            <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-6 ">
                                                <div class="ps-product">
                                                    <div class="ps-product__thumbnail">
                                                    	
                                                    	
                                                    	<!-- 상품 이미지 -->
                                                    	<a href="ItemDetail.bo?item_idx=${item.item_idx }">
                                                    		<img src="/Code_Green/resources/img/item/${item.file }" alt="" />
                                                    	</a>
                                                        <ul class="ps-product__actions">
                                                        	
                                                        	
                                                        	<!-- 장바구니 및 찜 -->
                                                        	<!-- 
                                                        	* 장바구니 페이지로 이동
                                                        	* 찜 페이지로 이동
                                                        	 -->
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    
                                                    
                                                    <!-- 브랜드명 및 상품명 -->
                                                    <!-- 
                                                    * 브랜드명은 서브쿼리 사용하여 불러오기
                                                     -->
                                                    <div class="ps-product__container"><a class="ps-product__vendor" href="#">${item.manager_brandname }</a>
                                                        <div class="ps-product__content"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx }">${item.item_name }</a>
                                                            
                                                            <!-- 별점 -->
                                                            <!-- 
                                                            *별점 카운트 하기
                                                             -->
                                                            <div class="ps-product__rating">
                                                                <select class="ps-rating" data-read-only="true">
                                                                    <option value="1">1</option>
                                                                    <option value="1">2</option>
                                                                    <option value="1">3</option>
                                                                    <option value="1">4</option>
                                                                    <option value="2">5</option>
                                                                </select><span>02</span>
                                                            </div>
                                                            
                                                            
                                                            <!-- 가격 -->
                                                            <p class="ps-product__price sale">${item.item_price } <del>${item.item_price } </del></p>
                                                        </div>
                                                        <div class="ps-product__content hover"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx }">${item.item_name }</a>
                                                            <p class="ps-product__price sale">${item.item_price } <del>${item.item_price } </del></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 상품 1개당 끝 -->
                                             </c:forEach>	
                                        </div>
                                    </div>
                                    
                                    
                                    
                                    <!-- 페이징 버튼들 시작 -->
                                   <div class="ps-pagination">
                                   		<%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
										<input type="button" value="이전" <%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%>onclick="location.href='category_snack?pageNum=${pageInfo.pageNum - 1}'"<%} %>>
										<!-- 시작페이지(startPage) 부터 끝페이지(endPage) 까지 페이지 번호 표시 -->
										&nbsp;
										<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
											<!-- 현재 페이지 번호와 i 값이 같을 경우 하이퍼링크 없이 페이지 번호 표시 -->
											<!-- 아니면, pageNum 파라미터를 i 값으로 설정하여 BoardList.bo 서블릿 주소 링크 -->
											<c:choose>
												<c:when test="${i eq pageInfo.pageNum }">${i }</c:when>
												<c:otherwise><a href="category_snack?pageNum=${i }">${i }</a></c:otherwise>
											</c:choose>
											&nbsp;
										</c:forEach>
									<!-- 현재 페이지번호가 끝 페이지번호보다 작을 때 현재 페이지번호 + 1 값으로 페이지 이동 -->
									<input type="button" value="다음" <%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%>onclick="location.href='category_snack?pageNum=${pageInfo.pageNum + 1}'"<%} %>>
                                    </div>
                                    <!-- 페이징 버튼들 끝 -->
                                    
                                </div>
                           </div>
                       </div>
                    </div>
                </div>
            </div>
        </section>
	</div>



		<jsp:include page="../inc/footer.jsp"></jsp:include>
		<!-- 푸터 삽입 -->
   
    
    
    <script src="/Code_Green/resources/plugins/jquery.min.js"></script>
    <script src="/Code_Green/resources/plugins/nouislider/nouislider.min.js"></script>
    <script src="/Code_Green/resources/plugins/popper.min.js"></script>
    <script src="/Code_Green/resources/plugins/owl-carousel/owl.carousel.min.js"></script>
    <script src="/Code_Green/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="/Code_Green/resources/plugins/imagesloaded.pkgd.min.js"></script>
    <script src="/Code_Green/resources/plugins/masonry.pkgd.min.js"></script>
    <script src="/Code_Green/resources/plugins/isotope.pkgd.min.js"></script>
    <script src="/Code_Green/resources/plugins/jquery.matchHeight-min.js"></script>
    <script src="/Code_Green/resources/plugins/slick/slick/slick.min.js"></script>
    <script src="/Code_Green/resources/plugins/jquery-bar-rating/dist/jquery.barrating.min.js"></script>
    <script src="/Code_Green/resources/plugins/slick-animation.min.js"></script>
    <script src="/Code_Green/resources/plugins/lightGallery-master/dist/js/lightgallery-all.min.js"></script>
    <script src="/Code_Green/resources/plugins/sticky-sidebar/dist/sticky-sidebar.min.js"></script>
    <script src="/Code_Green/resources/plugins/select2/dist/js/select2.full.min.js"></script>
    <script src="/Code_Green/resources/plugins/gmap3.min.js"></script>
    <!-- custom scripts-->
    <script src="/Code_Green/resources/js/main.js"></script>
</body>
</html>