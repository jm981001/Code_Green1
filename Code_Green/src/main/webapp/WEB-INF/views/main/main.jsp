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
    <link rel="icon" href="/Code_Green/resources/img/favicon.png">
    <title>베지터틀</title>
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/slick/slick/slick.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/lightGallery-master/dist/css/lightgallery.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css">
    <link rel="stylesheet" href="/Code_Green//resources/plugins/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
    <link rel="stylesheet" href="/Code_Green/resources/js/test.js">
</head>
<script type="text/javascript">
<!-- Channel Plugin Scripts -->

if(${not empty sessionScope.sId && sessionScope.sId ne 'admin'} ) {
	
	(function() {
	    var w = window;
	    if (w.ChannelIO) {
	      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
	    }
	    var ch = function() {
	      ch.c(arguments);
	    };
	    ch.q = [];
	    ch.c = function(args) {
	      ch.q.push(args);
	    };
	    w.ChannelIO = ch;
	    function l() {
	      if (w.ChannelIOInitialized) {
	        return;
	      }
	      w.ChannelIOInitialized = true;
	      var s = document.createElement('script');
	      s.type = 'text/javascript';
	      s.async = true;
	      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
	      s.charset = 'UTF-8';
	      var x = document.getElementsByTagName('script')[0];
	      x.parentNode.insertBefore(s, x);
	    }
	    if (document.readyState === 'complete') {
	      l();
	    } else if (window.attachEvent) {
	      window.attachEvent('onload', l);
	    } else {
	      window.addEventListener('DOMContentLoaded', l, false);
	      window.addEventListener('load', l, false);
	    }
	  })();
	  ChannelIO('boot', {
	    "pluginKey": "f252da13-5fe8-41ed-8d2a-dc426cba9fd5",
	    "memberId": "${sessionScope.sId }",
	    	"profile": {
	    	      "name": "${sessionScope.sId }",
	    	      "id": "${sessionScope.sId }"
	    	    }
	  
	  });
}




<!-- End Channel Plugin -->
</script>
<script type="text/javascript">
	function addCart(item_idx) {
		let cart_total = $("#cart_total_"+item_idx).val();
		let	item_name = $("#item_name_"+item_idx).val();
		let manager_brandname = $("#manager_brandname_"+item_idx).val();
		let file1 = $("#file1_"+item_idx).val();
		
		$.ajax({
			type : 'get',
			url : 'addCart',
			data: {
				'rf_item_idx' 		: item_idx,
				'rf_member_idx'		: ${sessionScope.sIdx},
				'cart_amount'		: 1,
				'cart_total'		: cart_total,
				'item_name'			: item_name,
				'manager_brandname'	: manager_brandname,
				'file1'				: file1,
			},
			success : function (data) {
				alert('장바구니에 담았습니다.')
			}
		});
	}
</script>
<body>
    
    
    <!-- 헤더 삽입 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 삽입 -->
    
    
    <!-- 바디시작 -->
    <div id="homepage-9">
        <div class="ps-home-banner">
            <div class="ps-carousel--nav-inside owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="5000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="true" data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="1" data-owl-item-md="1" data-owl-item-lg="1" data-owl-duration="1000" data-owl-mousedrag="on" data-owl-animate-in="fadeIn" data-owl-animate-out="fadeOut">
                <div class="ps-banner--organic" data-background="/Code_Green/resources/img/slider/home-9/1.jpg"><img src="/Code_Green/resources/img/slider/home-9/1.jpg">
                    <div class="ps-banner__content">
                        <h4>이 주의 캠페인</h4>
                        <h3>지구를 살리는데에 <br /> 여러분도 동참하세요! <br /> 10월25일까지<strong>40% 할인</strong></h3><a class="ps-btn" href="#">자세히</a>
                    </div>
                </div>
                <div class="ps-banner--organic" data-background="/Code_Green/resources/img/slider/home-9/2.jpg"><img src="/Code_Green/resources/img/slider/home-9/2.jpg">
                    <div class="ps-banner__content">
                        <h4>이 주의 프로모션</h4>
                        <h3>신선한 야채와 <br /> 과일 정기구독<br /> 회원가입시<strong>첫 박스는 무료</strong></h3><a class="ps-btn" href="#">자세히</a>
                    </div>
                </div>
            </div>
        </div>
        
        
        <div class="ps-site-features">
            <div class="container">
                <div class="ps-block--site-features ps-block--site-features-2">
                    <div class="ps-block__item">
                        <div class="ps-block__left"><i class="icon-rocket"></i></div>
                        <div class="ps-block__right">
                            <h4>무료배송</h4>
                            <p>5만원 이상시 배송비 무료!</p>
                        </div>
                    </div>
                    <div class="ps-block__item">
                        <div class="ps-block__left"><i class="icon-sync"></i></div>
                        <div class="ps-block__right">
                            <h4>못난이채소 구독</h4>
                            <p>이래 봬도 품질은 최고!</p>
                        </div>
                    </div>
                    <div class="ps-block__item">
                        <div class="ps-block__left"><i class="icon-credit-card"></i></div>
                        <div class="ps-block__right">
                            <h4>신선함이 집으로</h4>
                            <p>유통구조를 줄여 더 빠르게!</p>
                        </div>
                    </div>
                    <div class="ps-block__item">
                        <div class="ps-block__left"><i class="icon-bubbles"></i></div>
                        <div class="ps-block__right">
                            <h4>지역특산물 협업</h4>
                            <p>다양한 특산물을 집에서!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ---------------------------------------------- 새롭게 만나는 상품들------------------------------------------------------------------- -->
           <div class="ps-product-list ps-product-list--2">
            <div class="container">
                <div class="ps-section__header">
                    <h3>새롭게 만나는 상품들</h3>
                    <ul class="ps-section__links">
                       
                        <li><a href="ItemList.bo">더보기</a></li>
                    </ul>
                </div>
                <div class="ps-section__content">
                    <div class="ps-carousel--nav owl-slider" data-owl-auto="false" data-owl-loop="false" data-owl-speed="10000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="true" data-owl-item="5" data-owl-item-xs="2" data-owl-item-sm="2" data-owl-item-md="2" data-owl-item-lg="3" data-owl-item-xl="5" data-owl-duration="1000" data-owl-mousedrag="on">
                       
                       
                       <!-- 1 -->
                       <c:forEach var="item" items="${mainList1 }">
                       
                       
                        <div class="ps-product">
                            <div class="ps-product__thumbnail"><a href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}" ><img src="/Code_Green/resources/item/${item.file1 }" alt="" /></a>
                                 <ul class="ps-product__actions">
									 <li><a data-toggle="tooltip" data-placement="top" title="Add To Cart" onclick="addCart('${item.item_idx}')"><i class="icon-bag2" ></i></a></li>
                                     <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist" class="wishBtn"><i class="icon-heart"></i></a></li>
                                 </ul>
                            </div>
						<input type="hidden" id="cart_total_${item.item_idx}" name="cart_total_${item.item_idx}" value="${item.item_price}">
						<input type="hidden" id="item_name_${item.item_idx}" name="item_name_${item.item_idx}" value="${item.item_name}" >
						<input type="hidden" id="item_file1_${item.item_idx}" name="item_file1_${item.item_idx}" value="${item.file1}" >
						<input type="hidden" id="manager_brandname_${item.item_idx}" name="manager_brandname_${item.item_idx}" value="${item.manager_brandname}" >
                            <div class="ps-product__container"><a class="ps-product__vendor" href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}" >${item.manager_brandname }</a>
                                <div class="ps-product__content"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}" >${item.item_name }</a>
                                     <div class="ps-product__rating">
                                        <select class="ps-rating" data-read-only="true">
       										<c:forEach var="i" begin="1" end="5">
                                         	<c:choose>
                                         		<c:when test="${i <= item.score}">
                                         			<option value="1">${i }</option>
                                         		</c:when>
                                         		<c:otherwise>
                                         			<option value="2">${i }</option>
                                         		</c:otherwise>
                                         	</c:choose>
                                         </c:forEach>
                                        </select><span>${item.board_star_score }</span>
                                    </div>
                                    <h4 class="ps-product__price">${item.item_price }원</h4>
                                </div>
                                <div class="ps-product__content hover"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                    <h4 class="ps-product__price">${item.item_price }원</h4>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        
                        
                        
                    </div>
                </div>
            </div>
        </div>
        
         <!-- ---------------------------------------------- 새롭게 만나는 상품들 끝------------------------------------------------------------------- -->
         
        <!-- ---------------------------------------------- 고객님들의 혼자알기 아까운 상품들 ------------------------------------------------------------------- -->
           <div class="ps-product-list ps-product-list--2">
            <div class="container">
                <div class="ps-section__header">
                    <h3>고객님들의 혼자알기 아까운 상품들</h3>
                    <ul class="ps-section__links">
                       
                        <li><a href="ItemList.bo">더보기</a></li>
                    </ul>
                </div>
                <div class="ps-section__content">
                    <div class="ps-carousel--nav owl-slider" data-owl-auto="false" data-owl-loop="false" data-owl-speed="10000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="true" data-owl-item="5" data-owl-item-xs="2" data-owl-item-sm="2" data-owl-item-md="2" data-owl-item-lg="3" data-owl-item-xl="5" data-owl-duration="1000" data-owl-mousedrag="on">
                       
                       
                       <c:forEach var="item" items="${mainList2 }">
                        <div class="ps-product">
                            <div class="ps-product__thumbnail"><a href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}" ><img src="/Code_Green/resources/item/${item.file1 }" alt="" /></a>
                                 <ul class="ps-product__actions">
                                     <li><a href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2" onclick="addCart('${item.item_idx}')"></i></a></li>
                                     <li><a href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}" data-toggle="tooltip" data-placement="top" title="Add to Whishlist" class="wishBtn"><i class="icon-heart"></i></a></li>
                                 </ul>
                            </div>
                            <!-- 장바구니 담을 정보 -->
							<input type="hidden" id="cart_total_${item.item_idx}" name="cart_total_${item.item_idx}" value="${item.item_price}">
							<input type="hidden" id="item_name_${item.item_idx}" name="item_name_${item.item_idx}" value="${item.item_name}" >
							<input type="hidden" id="item_file1_${item.item_idx}" name="item_file1_${item.item_idx}" value="${item.file1}" >
							<input type="hidden" id="manager_brandname_${item.item_idx}" name="manager_brandname_${item.item_idx}" value="${item.manager_brandname}" >
                            <div class="ps-product__container"><a class="ps-product__vendor" href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.manager_brandname }</a>
                                <div class="ps-product__content"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                     <div class="ps-product__rating">
                                        <select class="ps-rating" data-read-only="true">
       										<c:forEach var="i" begin="1" end="5">
                                         	<c:choose>
                                         		<c:when test="${i <= item.score}">
                                         			<option value="1">${i }</option>
                                         		</c:when>
                                         		<c:otherwise>
                                         			<option value="2">${i }</option>
                                         		</c:otherwise>
                                         	</c:choose>
                                         </c:forEach>
                                        </select><span>${item.board_star_score }</span>
                                    </div>
                                    <h4 class="ps-product__price">${item.item_price }원</h4>
                                </div>
                                <div class="ps-product__content hover"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                    <h4 class="ps-product__price">${item.item_price }원</h4>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        
                        
                    </div>
                </div>
            </div>
        </div>
        
         <!-- ---------------------------------------------- 고객님들의 혼자알기 아까운 상품들-------------------------------------------------------- -->
        
        <!-- -------------------------------------------------------이미지배너2개자리 끝 --------------------------------------------------------- -->
        <div class="ps-home-promotion">
            <div class="container">
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 "><a class="ps-collection" href="#"><img src="/Code_Green/resources/img/promotions/home-9/2.jpg" alt=""></a>
                    </div>
                    
                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 " data-background="/Code_Green/resources/img/promotions/home-9/1.jpg">
                    	<!-- 이메일 구독폼 시작-->
                       
                            <aside class="widget widget_newletters">
                                <h3 class="widget-title">소식지 구독</h3>
                               	<h5> 비건마켓의 알아두면 좋은 소식들을 구독하고 싶으신가요?</h5>
                               	<h5> 음식뿐만 아니라 환경을 위해 실천하면 좋은 일들도,</h5>
                               	<h5> 지역을 살리는 농산물에 대한 이야기들도 들으실 수 있어요</h5>
                                <form class="ps-form--newletter" action="#" method="get">
                                    <div class="form-group--nest">
                                        <input class="form-control" type="text" placeholder="Email Address" />
                                        <button class="ps-btn">subscribe</button>
                                    </div>
                                </form>
                            </aside>
                       
                        <!-- 이메일 구독폼 끝-->
                    </div>
                </div>
            </div>
        </div>
        
        
        
        <!-- -------------------------------------------------------이미지배너2개자리 끝 --------------------------------------------------------- -->
        
         <!-- ---------------------------------------------- 내 취향을 잘 아는 상품들 ------------------------------------------------------------------- -->
           <div class="ps-product-list ps-product-list--2">
            <div class="container">
                <div class="ps-section__header">
                    <h3>내 취향을 잘 아는 상품들</h3>
                     <ul class="ps-section__links">
                       
                        <li><a href="ItemList.bo">더보기</a></li>
                    </ul>
                </div>
                <div class="ps-section__content">
                    <div class="ps-carousel--nav owl-slider" data-owl-auto="false" data-owl-loop="false" data-owl-speed="10000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="true" data-owl-item="5" data-owl-item-xs="2" data-owl-item-sm="2" data-owl-item-md="2" data-owl-item-lg="3" data-owl-item-xl="5" data-owl-duration="1000" data-owl-mousedrag="on">
                       
                       
                        <c:forEach var="item" items="${mainList3 }">
                       
                        <div class="ps-product">
                            <div class="ps-product__thumbnail"><a href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}" ><img src="/Code_Green/resources/item/${item.file1 }" alt="" /></a>
                                 <ul class="ps-product__actions">
                                     <li><a href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2" onclick="addCart('${item.item_idx}')"></i></a></li>
                                     <li><a href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}" data-toggle="tooltip" data-placement="top" title="Add to Whishlist" class="wishBtn"><i class="icon-heart"></i></a></li>
                                 </ul>
                            </div>
                             <!-- 장바구니 담을 정보 -->
							<input type="hidden" id="cart_total_${item.item_idx}" name="cart_total_${item.item_idx}" value="${item.item_price}">
							<input type="hidden" id="item_name_${item.item_idx}" name="item_name_${item.item_idx}" value="${item.item_name}" >
							<input type="hidden" id="item_file1_${item.item_idx}" name="item_file1_${item.item_idx}" value="${item.file1}" >
							<input type="hidden" id="manager_brandname_${item.item_idx}" name="manager_brandname_${item.item_idx}" value="${item.manager_brandname}" >
                            <div class="ps-product__container"><a class="ps-product__vendor" href="#">${item.manager_brandname }</a>
                                <div class="ps-product__content"><a class="ps-product__title" href="#">${item.item_name }</a>
                                     <div class="ps-product__rating">
                                        <select class="ps-rating" data-read-only="true">
       										<c:forEach var="i" begin="1" end="5">
                                         	<c:choose>
                                         		<c:when test="${i <= item.score}">
                                         			<option value="1">${i }</option>
                                         		</c:when>
                                         		<c:otherwise>
                                         			<option value="2">${i }</option>
                                         		</c:otherwise>
                                         	</c:choose>
                                         </c:forEach>
                                        </select><span>${item.board_star_score }</span>
                                    </div>
                                    <h4 class="ps-product__price">${item.item_price }원</h4>
                                </div>
                                <div class="ps-product__content hover"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                    <h4 class="ps-product__price">${item.item_price }원</h4>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        
                        
                    </div>
                </div>
            </div>
        </div>
        
         <!-- ---------------------------------------------- 내 취향을 잘 아는 상품들 끝------------------------------------------------------------------- -->
         
        
       <!-- ---------------------------------------------------------- 레시피 넣을 자리 시작---------------------------------------------------------- -->
        <div class="ps-client-say bg--cover" data-background="/Code_Green/resources/img/bg/testimonial-organic.jpg">
            <div class="container">
                <div class="ps-section__header">
                    <h3>이달의 레시피</h3>
                    <div class="ps-section__nav"><a class="ps-carousel__prev" href=".ps-carousel--testimonials"><i class="icon-chevron-left"></i></a><a class="ps-carousel__next" href=".ps-carousel--testimonials"><i class="icon-chevron-right"></i></a></div>
                </div>
                <div class="ps-section__content">
                    <div class="ps-carousel--testimonials owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="10000" data-owl-gap="30" data-owl-nav="false" data-owl-dots="false" data-owl-item="2" data-owl-item-xs="1" data-owl-item-sm="1" data-owl-item-md="1" data-owl-item-lg="2" data-owl-duration="1000" data-owl-mousedrag="on">
                        <div class="ps-block--testimonial">
                            <div class="ps-block__header"><img src="/Code_Green/resources/img/users/1.jpg" alt=""></div>
                            <div class="ps-block__content"><i class="icon-quote-close"></i>
                                <h4>두부강정 샐러드<span>두부를 구워 야채와 가볍게 즐길수있는 요리</span></h4>
                                <p>Sed elit quam, iaculis sed semper sit amet udin vitae nibh. at magna akal semperFusce commodo molestie luctus.Lorem ipsum Dolor tusima olatiup.</p>
                            </div>
                        </div>
                        <div class="ps-block--testimonial">
                            <div class="ps-block__header"><img src="/Code_Green/resources/img/users/2.png" alt=""></div>
                            <div class="ps-block__content"><i class="icon-quote-close"></i>
                                <h4>새콤달콤 버섯탕수<span>아이들도 좋아하는 바삭하게 튀긴 버섯요리</span></h4>
                                <p>Sed elit quam, iaculis sed semper sit amet udin vitae nibh. at magna akal semperFusce commodo molestie luctus.Lorem ipsum Dolor tusima olatiup.</p>
                            </div>
                        </div>
                        <div class="ps-block--testimonial">
                            <div class="ps-block__header"><img src="/Code_Green/resources/img/users/3.jpg" alt=""></div>
                            <div class="ps-block__content"><i class="icon-quote-close"></i>
                                <h4>콩고기 두루치기 <span>매콤한 맛이 그리울때 쉽고 간단하게 만드는 요리</span></h4>
                                <p>Sed elit quam, iaculis sed semper sit amet udin vitae nibh. at magna akal semperFusce commodo molestie luctus.Lorem ipsum Dolor tusima olatiup.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ---------------------------------------------------------- 레시피 넣을 자리 끝 ---------------------------------------------------------- -->
        <!-- ---------------------------------------------------------- 푸터푸터 ---------------------------------------------------------- -->
     	<jsp:include page="../inc/footer.jsp"></jsp:include>
    	<!-- ---------------------------------------------------------- 푸터푸터 끝 ---------------------------------------------------------- -->
    </div>
    
    
    
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