<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
<title>장바구니</title> 
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
<link rel="stylesheet" href="/Code_Green/resources/css/line.css">
<link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
<link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	// 상품 리스트 페이지로 이동 (돌아가기 버튼))
	$("#btnList").click(function(){
		location.href="ItemList.bo";
	});
});

//장바구니 항목삭제	
function deleteItem(cart_idx) {
// alert(cart_idx);
		$.ajax({
			type : 'get',
			url : 'deleteCart',
			data: {
				cart_idx: cart_idx,
			},
			success : function (data) {
//					console.log("data : " +  data);
//					code =data;
				alert('삭제완료.')
// 				location.reload();
			}
		});
}
function UpdateItem(cart_idx) {
	// alert(cart_idx);
			$.ajax({
				type : 'get',
				url : 'updateCart',
				data: {
					cart_idx: cart_idx,
				},
				success : function (data) {
//						console.log("data : " +  data);
//						code =data;
					alert('수정완료.')
//	 				location.reload();
				}
			});
	}
// 수량 수정 버튼
// $(".quantity_modify_btn").on("click", function() {
// 	let cart_idx = $(this).data("cart_idx");
// 	let cat_amount = $(this).parent("td").find("input").val();
// 	$(".update_cart_idx").val(cart_idx);
// 	$(".update_cart_amount").val(cart_amount);
// 	$(".quantity_update_form").submit();
// });
</script>
</head>

<body>
		
		<!-- 헤더 삽입 -->
		<jsp:include page="../inc/top.jsp"></jsp:include>
		<!-- 헤더 삽입 -->



 		<!-- 바디시작 -->
 		
 		<div class="ps-page--single">
        <div class="ps-breadcrumb">
            <div class="container">
                <ul class="breadcrumb">
                    <li><a href="index.html">Home</a></li>
                    <li>장바구니</li>
                </ul>
            </div>
        </div>
    </div>



	<div class="ps-section--shopping ps-shopping-cart">
		<div class="container">
			<div class="ps-section__header">
				<h1>장바구니</h1>
			</div>
			<div class="ps-section__content">
				<div class="table-responsive">
				
				
						<table class="table ps-table--shopping-cart ps-table--responsive">
							<thead>
								<tr>
									<th>상품명</th>
									<th>가격</th>
									<th>수량</th>
									<th>총합</th>
								</tr>
							</thead>
							<c:forEach var="row" items="${cartList}" varStatus="i">
								<input type="hidden" name="cart_idx" value="${row.cart_idx}">
								<input type="hidden" name="rf_item_idx"value="${row.rf_item_idx}">
							<tr>
								<td data-label="Product">
									<div class="ps-product--cart">
										<div class="ps-product__thumbnail">
											<a href="product-default.html"><img
												src="/Code_Green/resources/item/${row.file1 }"></a>
										</div>
										<div class="ps-product__content">
											<a href="product-default.html">${row.item_name}</a>

											<p>
												<strong> ${row.manager_brandname }</strong>
											</p>

										</div>
									</div>
								</td>
								<td class="price" data-label="Price">${row.item_price}원</td>

								<!-- 수량조절 -->
								<td data-label="Quantity">
									<div class="form-group--number">
										<button type="button" class="up">+</button>
										<!-- 수량	증가 버튼 -->
										<button type="button" class="down">-</button>
										<!-- 수량 감소 버튼 -->
										<input class="form-control" type="text" id="quan"
											placeholder="1" name="cart_amount" value="${row.cart_amount}"
											min="1">
									</div> 
									<%--<button type="button" class="quantity_modify_btn" data-cart_idx="${row.cart_idx}">변경</button> --%>
									<button type="button" onclick="UpdateItem('${row.cart_idx}')" class="quantity_modify_btn" data-cart_idx="${row.cart_idx} "
										id="UpdateBtn" style="border: none;">변경</button>
									

								</td>
								<td data-label="Total">${row.cart_total*row.cart_amount }
									원</td>
								<td>
									<button type="button" id="delBtn"
										onclick="deleteItem('${row.cart_idx}')" style="border: none;">삭제</button>
								</td>
							</tr>
						</c:forEach>
						</table><!-- class="table ps-table--shopping-cart ps-table--responsive"> -->
				</div><!--<div class="table-responsive"> -->

				<div class="ps-section__cart-actions">
				<button class="ps-btn" id="btnList">돌아가기</button>

				</div>

			</div>



			<!-- 합계 부분 -->
			<div class="ps-section__footer">
				<div class="row"></div>
				<div class="ps-block--shopping-total" style="width: 600px">
					<div class="ps-block__header">
						<p>
							소계 <span> ${map.sumM} 원</span>
						</p>
					</div>
					<div class="ps-block__content">
						<ul class="ps-block__product">
							<li><h3>
									배송비 <span class="ps-block__shipping">${map.fee} 원</span>
								</h3></li>
						</ul>
						<h3>
							총합 <span class="ps-block__shipping">${map.allSum} 원</span>
						</h3>
					</div>
				</div>
				<a class="ps-btn ps-btn--fullwidth" style="width: auto"
					href="payment?member_id=${sessionScope.sId }">결제 진행</a>
			</div>
		</div>
	</div>


	<!-- 푸터 시작! -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
    <!-- 푸터 끝! -->
    
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
    <script src="/Code_Green/resources/Code_Green/resources/plugins/gmap3.min.js"></script>
    <!-- custom scripts-->
    <script src="/Code_Green/resources/js/main.js"></script>
    <script src="/Code_Green/resources/js/quantity.js"></script>
</body>

</html>