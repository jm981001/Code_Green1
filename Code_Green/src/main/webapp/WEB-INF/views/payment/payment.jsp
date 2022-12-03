<%@page import="com.itwillbs.Code_Green.vo.CartVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- headers-->
<!DOCTYPE html>
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
    <link rel="icon" href="/Code_Green/resources/img/favicon.png">
    <title>주문 - 베지터틀</title>
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
    <link rel="stylesheet" href="/Code_Green/resources/css/style_payment.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/organic.css">

    
<!-- 기존 주소 클릭시 변경 주소 숨김 / 변경 주소 클릭시 기존 주소 숨김-->
    <style type="text/css">
    	#newDiv{
    		display: none;
    	}
    </style>
    
<!-- 주소 api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
<script type="text/javascript" src="/Code_Green/resources/js/jquery-3.6.1.js"> </script>
<script>
	let coin_use;

	function coinUse() {
		
		let coin_total = ${coin.coin_total};
		coin_use = $('.coin_use').val();
		
		let coin_remain = coin_total - coin_use;
		
		if(coin_remain >= 0){
			$('.coin_remain').html(coin_remain);
		 	$('.coin_use').html(coin_use);
		} else {
			alert("사용할 적립금은 보유 적립금보다 적거나 같아야 합니다.");
		} 
		
		let sell_total_price = ${map.sumM} + ${map.fee} - coin_use;
		$('.sell_total_price').html(sell_total_price);
	
// 		return coin_use;
	}
	
	function orderGo() {
		let result = confirm("주문하시겠습니까? 확인을 클릭하시면 주문 완료 및 결제 페이지로 이동합니다.")
		
		let member_idx = ${memberInfo.member_idx }
		let item_total_price = ${map.sumM}
	
		if(result){
			$.ajax({
				type : 'POST',
				url : 'payment_success',
				data :{
					member_idx : member_idx,
					member_name : '${memberInfo.member_name }',
					member_phone : '${memberInfo.member_phone }',
					member_address : '${memberInfo.member_address }',
					member_postcode : '${memberInfo.member_postcode }',
					item_total_price : item_total_price,
					shipping_fee : ${map.fee},
					sell_usecoin : coin_use
				},
				success : function(data) {
					alert('주문이 완료되었습니다.');
					
					location.href = 'payment_success_cardPayForm?member_id=${sessionScope.sId}'; 
				},
				fail : function(data2) {
					alert('주문이 실패되었습니다. 다시 시도해 주세요.');
				}
			}); 
		} else {
			alert('주문이 실패 되었습니다. 다시 시도해 주세요.');
		}
	}	

</script>
 
</head>

<body>
 	
 	<jsp:include page="../inc/top.jsp"></jsp:include>
 	
    <section class="ps-section--account ps-checkout">
            <div class="container">
                <div class="ps-section__header">
                    <h3>Payment</h3>
                </div>
                <div class="ps-section__content">
<!--                     <form class="ps-form--checkout" action="index.html" method="get"> -->
                        <div class="ps-form__content">
                            <div class="row">
                                <div class="col-xl-8 col-lg-8 col-md-12 col-sm-12 col-12 ">
                                    <div class="ps-block--shipping">
                                        <div class="ps-block__panel">
                                            <figure><small>name</small>
                                                <p>${memberInfo.member_name }</p><a href="#">Change</a>
                                            </figure>
                                            <figure><small>phone</small>
                                                <p>${memberInfo.member_phone }</p><a href="#">Change</a>
                                            </figure>
                                            <figure><small>phone</small>
                                                <p>${memberInfo.member_address }</p><a href="#">Change</a>
                                            </figure>
                                            <figure><small>postcode</small>
                                                <p>${memberInfo.member_postcode }</p><a href="#">Change</a>
                                            </figure>
                                        </div>
                                        <h4>Shipping_fee</h4>
                                        <div class="ps-block__panel">
                                            <figure><small>Shipping_fee</small><strong>${map.fee}</strong></figure>
                                        </div>
                                        <h4>Coin</h4>
                                        <div class="ps-block__panel">
                                            <figure><small>Coin_total</small><strong>${coin.coin_total }</strong></figure>
                                            <figure><small>Coin_use</small><input type="text" class="coin_use"> <input type="button" value="USE" onclick="coinUse()" style="float: right;"></figure>
                                            <figure><small>Coin_remain</small><strong><span class="coin_remain"></span></strong></figure>
                                            
                                        </div>
                                        <button class="ps-btn ps-btn--fullwidth"  type="button" onclick="orderGo()">ORDER</button>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 ">
                                    <div class="ps-block--checkout-order">
                                        <div class="ps-block__content">
                                            <figure>
                                                <figcaption><strong>Product</strong><strong>Total</strong></figcaption>
                                            </figure>
                                            <c:forEach var="cart" items="${cartList }">
                                            <figure class="ps-block__items">
                                            	<a href="#"><strong>${cart.item_name }</strong><span><fmt:formatNumber value="${cart.cart_total*cart.cart_amount }"/></span></a>
                                            	<a href="#"><strong>${cart.manager_brandname }</strong><span>${cart.cart_amount }개 * <small>${cart.item_price }</small></span></a>
                                            </figure>
                                            </c:forEach>
                                            <figure>
                                                <figcaption><strong>Subtotal</strong>${map.sumM }</figcaption>
                                            </figure>
                                            <figure>
                                                <figcaption><strong>Shipping</strong>${map.fee}</figcaption>
                                            </figure>
                                            <figure>
                                                <figcaption><strong>Coin</strong><span class="coin_use"></span></figcaption>
                                            </figure>
                                            <figure class="ps-block__total">
                                                <h3>Total<strong><span class="sell_total_price"><fmt:formatNumber value="${map.sumM + map.fee}"/></span></strong></h3>
                                            </figure>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
<!--                     </form> -->
                </div>
            </div>
        </section>
    
</main>
   
   	<jsp:include page="../inc/footer.jsp"></jsp:include>
          

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
    <script src="/Code_Green/resources/js/main.js"></script>
</body>

</html>