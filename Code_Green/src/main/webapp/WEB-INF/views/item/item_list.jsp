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
    
    <!-- 바디시작 -->
    <div id="homepage-9">
        	<div class="ps-page--single ps-page--vendor">
      			  <section class="ps-store-list">
         			   <div class="container">
			      			<aside class="ps-block--store-banner-newitemlist">
			                	<!-- 브랜드 정보 및 대표이미지 넣을 곳 -->
			                    <div class="ps-block__content bg--cover" data-background="/Code_Green/resources/img/신상품샘플.jpg">
			                    </div>
			                </aside>
			            </div>
			       </section>
			  </div>
			    
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
            
                <div class="ps-section__content">
                    <div class="ps-carousel--nav owl-slider" data-owl-auto="false" data-owl-loop="false" data-owl-speed="10000" data-owl-gap="0" data-owl-nav="false" data-owl-dots="true" data-owl-item="5" data-owl-item-xs="2" data-owl-item-sm="2" data-owl-item-md="2" data-owl-item-lg="3" data-owl-item-xl="5" data-owl-duration="1000" data-owl-mousedrag="on">
                        <c:forEach var="item" items="${itemList }">
                         
	                        <div class="ps-product">
	                            <div class="ps-product__thumbnail"><a href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}" ><img src="/Code_Green/resources/img/products/electronic/3.jpg" alt="" /></a>
	<!--                                 <div class="ps-product__badge">-5%</div> -->
	                                <ul class="ps-product__actions">
	                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
	                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
	                                </ul>
	                            </div>
	                            <div class="ps-product__container"><a class="ps-product__vendor" href="#">${item.item_name}</a>
	                                <div class="ps-product__content"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}">브랜드명</a>
	                                    <div class="ps-product__rating">
	                                        <select class="ps-rating" data-read-only="true">
	                                            <option value="1">1</option>
	                                            <option value="1">2</option>
	                                            <option value="1">3</option>
	                                            <option value="1">4</option>
	                                            <option value="2">5</option>
	                                        </select><span>01</span>
	                                    </div>
	<!--                                     <p class="ps-product__price sale">$100.99(할인된 가격 빨간색) <del>$105.00 </del></p> -->
	                                    <p class="ps-product__price sale"><del>${item.item_price}원</del></p>
	                                </div>
	                                <div class="ps-product__content hover"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}">브랜드명</a>
	                                    <p class="ps-product__price sale"><del>${item.item_price}원</del></p>
	                                </div>
	                            </div>
	                        </div>
               			</c:forEach>
                        <div class="ps-product">
                        </div>   
                    </div>
                </div>
            </div>
        </div>
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