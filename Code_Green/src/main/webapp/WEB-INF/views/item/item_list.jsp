<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>비건마켓</title>
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/slick/slick/slick.css">
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
    
    <!-- 바디시작 -->
    <div class="ps-page--single ps-page--vendor">
        <section class="ps-store-list">
            <div class="container">
      			<aside class="ps-block--store-banner-newitemlist">
                	<!-- 브랜드 정보 및 대표이미지 넣을 곳 -->
                    <div class="ps-block__content bg--cover" data-background="/Code_Green/resources/img/신상품샘플.jpg">
                    </div>
                </aside>
                        <!-- ---------------------------------------------- 신상품------------------------------------------------------------------- -->
				<div class="ps-product-list ps-product-list--2">
					<div class="container">
						<div class="ps-section__header">
							<h3>신상품</h3>
							<ul class="ps-section__links">
								<li><a href="shop-grid.html">신상품순</a></li>
								<li><a href="shop-grid.html">판매량순 </a></li>
								<li><a href="shop-grid.html">낮은 가격순</a></li>
								<li><a href="shop-grid.html">높은 가격순</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="ps-section__wrapper">
                    <div class="ps-section__right">
                         <div class="ps-shopping ps-tab-root">
                            <div class="ps-tabs">
                                <div class="ps-tab active" id="tab-1">
                                    <div class="ps-shopping-product">
                                        <div class="row">
                                        
                                        	<!-- 반복문 시작 -->
                                        	<c:forEach var="item" items="${itemList }">
                                        	<!-- 상품 1개당 시작 -->
                                            <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6 col-6 ">
                                                <div class="ps-product">
                                                    <div class="ps-product__thumbnail">
                                                    	
                                                    	
                                                    	<!-- 상품 이미지 -->
                                                    	<a href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}" ><img src="/Code_Green/resources/img/item/${item.file }" alt="" /></a>
                                                        <ul class="ps-product__actions">
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="ps-product__container"><a class="ps-product__vendor" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&item_category=${item.item_category}">${item.manager_brandname }</a>
                                                        <div class="ps-product__content"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&item_category=${item.item_category}">${item.item_name }</a>
                                                            
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
                                                            <h4 class="ps-product__price">${item.item_price }원</h4>
                                                        </div>
                                                        <div class="ps-product__content hover"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&item_category=${item.item_category}">${item.item_name }</a>
                                                            <h4 class="ps-product__price">${item.item_price }원</h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 상품 1개당 끝 -->
                                             </c:forEach>	
				                        <div class="ps-product">
				                        </div>   
				                    </div>
				                    
				                       <!-- 페이징 버튼들 시작 -->
                                   <div class="ps-pagination">
                                   		<%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
										<input type="button" value="이전" <%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%>onclick="location.href='ItemList.bo?pageNum=${pageInfo.pageNum - 1}'"<%} %>>
										<!-- 시작페이지(startPage) 부터 끝페이지(endPage) 까지 페이지 번호 표시 -->
										&nbsp;
										<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
											<!-- 현재 페이지 번호와 i 값이 같을 경우 하이퍼링크 없이 페이지 번호 표시 -->
											<!-- 아니면, pageNum 파라미터를 i 값으로 설정하여 BoardList.bo 서블릿 주소 링크 -->
											<c:choose>
												<c:when test="${i eq pageInfo.pageNum }">${i }</c:when>
												<c:otherwise><a href="ItemList.bo?pageNum=${i }">${i }</a></c:otherwise>
											</c:choose>
											&nbsp;
										</c:forEach>
									<!-- 현재 페이지번호가 끝 페이지번호보다 작을 때 현재 페이지번호 + 1 값으로 페이지 이동 -->
									<input type="button" value="다음" <%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%>onclick="location.href='ItemList.bo?pageNum=${pageInfo.pageNum + 1}'"<%} %>>
                                    </div>
                                    <!-- 페이징 버튼들 끝 -->
				                    
				                    
				                    
				                </div>
				            </div>
				        </div>
			        </div>
		        </div>
		        
	        </div>
        </div>
       </section>
         <!-- ---------------------------------------------- 상품 목록 끝------------------------------------------------------------------- -->
  
        
      
    </div>
    
        <!-- ---------------------------------------------------------- 푸터푸터 ---------------------------------------------------------- -->
     	<jsp:include page="../inc/footer.jsp"></jsp:include>
    	<!-- ---------------------------------------------------------- 푸터푸터 끝 ---------------------------------------------------------- -->
    
    
    <!-- 맨위로 올라가는 화살표버튼! 지우지마세요! -->
    
    <div id="back2top"><i class="icon icon-arrow-up"></i></div>
    
    <!-- 맨위로 올라가는 화살표버튼! 지우지마세요! -->
    
    
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
