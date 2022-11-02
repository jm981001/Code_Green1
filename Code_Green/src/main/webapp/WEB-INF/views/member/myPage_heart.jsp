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
<title>나의찜한상품</title>
<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext" rel="stylesheet">
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



					<!-- ==========찜한 상품=========================================================================================================     -->
					<div class="col-lg-9">
					<div class="ps-section--shopping ps-whishlist">
					<h3>찜한 상품 (23)</h3>
							<div class="ps-section__content">
								<div class="table-responsive">
									<table class="table ps-table--whishlist ps-table--responsive">
										<tbody>
											<tr>
												<td data-label="Remove"><a href="#"><i
														class="icon-cross"></i></a></td>
												<td data-label="Product">
													<div class="ps-product--cart">
													
														<div class="ps-product__thumbnail">
															<a href="product-default.html"><img src="/Code_Green/resources/img/products/shop/1.jpg" alt="" /></a>
														</div>
														<div class="ps-product__content">
															<a href="product-default.html">Apple iPhone Retina 6s Plus 64GB</a>
															<p><strong> 3000원</strong></p>
														</div>
														
													</div>
												</td>
												<td class="price" data-label="Price"> </td>
												<td data-label="Status"><span
													class="ps-tag ps-tag--in-stock"> </span></td>
												<td data-label="action"><a class="ps-btn" href="#">담기</a></td>
											</tr>
											<tr>
												<td data-label="Remove"><a href="#"><i
														class="icon-cross"></i></a></td>
												<td data-label="Product">
													<div class="ps-product--cart">
													
														<div class="ps-product__thumbnail">
															<a href="product-default.html"><img src="/Code_Green/resources/img/products/shop/1.jpg" alt="" /></a>
														</div>
														<div class="ps-product__content">
															<a href="product-default.html">Apple iPhone Retina 6s Plus 64GB</a>
															<p><strong> 3000원</strong></p>
														</div>
														
													</div>
												</td>
												<td class="price" data-label="Price"> </td>
												<td data-label="Status"><span
													class="ps-tag ps-tag--in-stock"> </span></td>
												<td data-label="action"><a class="ps-btn" href="#">담기</a></td>
											</tr>
											<tr>
												<td data-label="Remove"><a href="#"><i
														class="icon-cross"></i></a></td>
												<td data-label="Product">
													<div class="ps-product--cart">
													
														<div class="ps-product__thumbnail">
															<a href="product-default.html"><img src="/Code_Green/resources/img/products/shop/1.jpg" alt="" /></a>
														</div>
														<div class="ps-product__content">
															<a href="product-default.html">Apple iPhone Retina 6s Plus 64GB</a>
															<p><strong> 3000원</strong></p>
														</div>
														
													</div>
												</td>
												<td class="price" data-label="Price"> </td>
												<td data-label="Status"><span
													class="ps-tag ps-tag--in-stock"> </span></td>
												<td data-label="action"><a class="ps-btn" href="#">담기</a></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
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