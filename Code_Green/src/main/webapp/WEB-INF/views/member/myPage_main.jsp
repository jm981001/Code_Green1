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
<title>마이페이지 메인</title>
<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext" rel="stylesheet">
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-straight/css/uicons-solid-straight.css'>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-straight/css/uicons-regular-straight.css'>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
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
<link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
</head>
<style>
	.brandlist-ul {
		display: grid;
	    grid-template-columns: repeat(3, 150px);
	    gap: 20px 130px;
	    overflow: hidden;
	    margin-bottom: 40px;
	    padding: 30px 40px;
	    border: 1px solid rgb(226, 226, 226);
	    line-height: 20px;
	    justify-items: center;
	}
	
	.brandlist-li {
		overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    color: green;
	    font-weight: bold;
	}

	.brandlist-li-head {
		overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    text-align: center;
	    font-weight: bold;
	}
	
</style>
<body>

    <!-- 헤더 삽입 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 삽입 -->

	<!-- ==========왼쪽 사이드바=========================================================================================================     -->
	<main class="ps-page--my-account">
		<section class="ps-section--account">
			<div class="container">
				<div class="row">
					<jsp:include page="../inc/left_mypage.jsp"></jsp:include>

<!-- ==========Q&A=========================================================================================================     -->
					<div class="col-lg-8">
                        <div class="ps-section__right">
                            <div class="ps-section--account-setting--mpmain">
                            
                                <div class="ps-section__header">
                                    <h3>마이페이지</h3>
                                </div>
                                
                                <div class="ps-section__content">
                                	<!-- 그리드 시작 -->
                                    <div id="listlist">
                	 					<ul class="brandlist-ul">
                	 						<li class="brandlist-li-head"><i class="fi fi-ss-coins"></i><br>적립금</li>
                	 						<li class="brandlist-li-head"><i class="fi fi-rs-boxes"></i><br>주문내역</li>
                	 						<li class="brandlist-li-head"><i class="fi fi-sr-heart"></i><br>찜상품</li>
                	 						
                	 						<li class="brandlist-li">
                	 							<a href="myPageEmoney.my?member_id=${sessionScope.sId}">${myCountInfo.coin_total }원</a>
                	 						</li>
                	 						 <c:choose>
                                              	<c:when test="${empty mycountInfo.order_count}">
                                              		<li class="brandlist-li"><a href="myPage_buyList">0건</a></li>
                                              	</c:when>
                                              	<c:otherwise>
                                              		<li class="brandlist-li"><a href="myPage_buyList">${mycountInfo.order_count}건</a></li>
                                              	</c:otherwise>
                                             </c:choose>
                	 						<li class="brandlist-li">
                	 							<a href="myPageWishList.my?member_id=${sessionScope.sId }">${myCountInfo.heart_count }개</a>
                	 						</li>
                	 						
                	 						<li class="brandlist-li-head"><i class="fi fi-rr-edit"></i><br>작성글</li>
                	 						<li class="brandlist-li-head"><i class="fi fi-rr-shop"></i><br>팔로우</li>
                	 						<li class="brandlist-li-head"><i class="fi fi-rr-question-square"></i><br>1:1문의글</li>
                	 						
                	 						<li class="brandlist-li">
                	 							<a href="myPageBoard.bo?member_id=${sessionScope.sId} ">${myCountInfo.board_count }개</a>
                	 						</li>
                	 						<li class="brandlist-li">
                	 							<a href="myPageFollowingList.my">${myCountInfo.follow_count } 브랜드</a>
                	 						</li>
                	 						<li class="brandlist-li">
                	 							<a href="myPageQnaDetail.my">${myCountInfo.qna_count }개</a>
                	 						</li>
                						</ul>
                                    </div>
                                    <!-- 그리드 끝 -->
                                    
                                    <div class="ps-section--account-setting">
                                    	<br>
                                    	<h4>최근주문목록(1개월내)</h4>
                                    	<br>
                                       <div class="table-responsive">
                                        <table class="table ps-table">
                                            <thead>
                                                <tr>
                                                    <th>주문날짜</th>
                                                    <th>주문번호</th>
                                                    <th>상품갯수</th>
                                                    <th>결제방법</th>
                                                    <th>결제금액</th>
                                                    <th>주문상태</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                	<td><span>2022-10-28 12시50분</span></td>
                                                    <td>
                                                        <div class="ps-product--cart">
                                                            <div class="ps-product__content"><a href="myPage_buyList.jsp">20221028-00000123</a></div>
                                                        </div>
                                                    </td>
                                                    <td><span>5건</span></td>
                                                    <td>카카오페이</td>
                                                    <td><span>56,000원</span></td>
                                                    <td>결제완료</td>
                                                </tr>
                                                <tr>
                                                	<td><span>2022-10-23 01시50분</span></td>
                                                    <td>
                                                        <div class="ps-product--cart">
                                                            <div class="ps-product__content"><a href="product-default.html">20221023-00000573</a></div>
                                                        </div>
                                                    </td>
                                                    <td><span>2건</span></td>
                                                    <td>신용카드</td>
                                                    <td><span>8,000원</span></td>
                                                    <td>배송완료</td>
                                                </tr>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                    </div>
                                    
                                </div>
                                
                                
                                
                            </div>
                        </div>
                    </div>
                    
<!-- ==========Q&A 끝=========================================================================================================     -->					
					
				</div>
			</div>
		</section>
	</main>


	<!-- ---------------------------------------------------------- 푸터푸터 ---------------------------------------------------------- -->
     	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- ---------------------------------------------------------- 푸터푸터 끝 ---------------------------------------------------------- -->



	<!-- 맨위로 올라가는 화살표버튼! 지우지마세요! -->

	<div id="back2top">
		<i class="icon icon-arrow-up"></i>
	</div>

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