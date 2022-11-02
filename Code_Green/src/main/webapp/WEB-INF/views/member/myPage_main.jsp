<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- headers-->
<html lang="en">

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
                                    <div class="table-responsive">
                                        <table class="table ps-table-m ps-table--notification" rules="none">
                                            
                                                <tr>
                                                    <td width="30%"><i class="fi fi-ss-coins"></i><br>보유적립금</td>
                                                    <td width="30%"><i class="fi fi-rs-boxes"></i><br>주문내역</td>
                                                    <td width="30%"><i class="fi fi-sr-heart"></i><br>찜상품</td>
                                                </tr>
                                                <tr>
                                                    <td>4500원</td>
                                                    <td>15 건</td>
                                                    <td>46 개</td>
                                                </tr>
                                                <tr>
                                                    <td><i class="fi fi-rr-edit"></i><br>작성글</td>
                                                    <td><i class="fi fi-rr-shop"></i><br>팔로우</td>
                                                    <td><i class="fi fi-rr-question-square"></i><br>문의글</td>
                                                </tr>
                                                <tr>
                                                    <td>20 개</td>
                                                    <td>12 곳</td>
                                                    <td>0 개</td>
                                                </tr>
                                          </table>
                                    </div>
                                    <!-- 그리드 끝 -->
                                    <div class="ps-section--account-setting">
                                    	<br>
                                    	<h4>최근주문목록</h4>
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