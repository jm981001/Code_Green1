<%@page import="com.itwillbs.Code_Green.vo.CartVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
    <title>주문하기</title>
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
    <script type="text/javascript" src="/Code_Green/resources/js/jquery-3.6.1.js"> </script>
    
    
<!-- 기존 주소 클릭시 변경 주소 숨김 / 변경 주소 클릭시 기존 주소 숨김-->
    <style type="text/css">
    	#newDiv{
    		display: none;
    	}
    </style>
    
    
<!-- 결제 api 관련 js-->
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
 
<!-- 주소 api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    
<script>
<!-- 결제 api -->
        var IMP = window.IMP; 
        IMP.init("imp82131734"); 

        function requestPay() {
            IMP.request_pay({
                pg : 'kcp',
                pay_method : 'card',
                merchant_uid: "202013444565", // 주문번호?결제번호? 중복되면 결제안됨 ! 결제 할때마다 다른 번호 넣어야함
                name : '당근 10kg', // 주문할 상품명들
                amount : 1004, // 금액
                buyer_email : 'Iamport@chai.finance', // 주문자 메일주소
                buyer_name : '아임포트 기술지원팀', // 주문자 이름
                buyer_tel : '010-1234-5678', // 주문자 연락처
                buyer_addr : '서울특별시 강남구 삼성동', // 주문자 주소
                buyer_postcode : '123-456' // 주문자 우편번호
            }, function (rsp) { // callback
                if (rsp.success) {
                    alert("결제가 완료되었습니다.");
                    location.href="payment_success_card"; // 결제 완료창으로 넘어갈때 아이디 같이 보내기? sell or sell detail 테이블 보내기
                } else {
                    alert("결제가 완료되지 않았습니다.");
                    history.back();
                }
            });
        }
        
<!-- 기존 주소 / 변경 주소 -->
        function setDisplay(){    
        	if($('input:radio[id=basic_address]').is(':checked')){
        		$('#newDiv').hide(); 
            	$('#basicDiv').show();
        	} else {
        		$('#basicDiv').hide(); 
            	$('#newDiv').show();
			}
        }
        
<!-- 다음 주소 api -->
        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById("postcode").value = data.zonecode; // 우편번호
                    document.getElementById("address").value = data.roadAddress; // 주소(도로명 주소)
                }
            }).open();
        }

        
<!-- 적립금 사용 및 결제 금액 계산-->
        $(function() {
        	coin();
 		});
        
        
        function coin(){
        	$(".sell_coin_use_btn").on("click",function(){
        		
        		<!-- 적립금 사용 -->
        		let sell_coin_total = $('.sell_coin_total').val();
        		let sell_use_coin = $('.sell_use_coin').val();
        		
        		let sell_coin_total2 = parseInt(sell_coin_total, 10);
        		let sell_use_coin2 = parseInt(sell_use_coin, 10);
        		
        		let sell_coin_remaining = sell_coin_total2 - sell_use_coin2;
        		
        		if(sell_coin_remaining >= 0){
				 	$(".sell_coin_remain").html(sell_coin_remaining); 
				 	$(".sell_use_coin").html(sell_use_coin2);
        		} else {
        			alert("사용할 적립금은 보유 적립금보다 적거나 같아야 합니다.");
        		}
        		
        		<!-- 전체 상품 금액 -->
        		let sell_item_total_price = $('.sell_item_total_price').val();
        		let sell_item_total_price2 = parseInt(sell_item_total_price, 10);
        		
        		<!-- 배송비 -->
     			let sell_shipping_fee = $('.sell_shipping_fee').val();
     			let sell_shipping_fee2 = parseInt(sell_shipping_fee, 10);
        		
     			<!-- 전체 결제 금액 = 전체 상품 금액 - 적립금 사용 + 배송비 -->
        		let sell_total_price = sell_item_total_price2 - sell_use_coin2 + sell_shipping_fee2;
     		
        		$(".sell_total_price").html(sell_total_price);
        		
        		
        	});
        
        }  
        
        
        
 <!-- 주문 확인 alert -->       
//         function orderConfirm() {
// 			alert("주문을 완료하시겠습니까? \n확인을 클릭하시면 결제페이지로 이동합니다.");
// 		}
        

// <!-- 장바구니 불러오기 -->
//        	$(function() {
//        		cartList();
//        	});
       		
//            function cartList(){
//         	   var member_id = "${sessionScope.sId }";
//    	        $.ajax({
//    				type: "GET",
//    				url: "/Code_Green/cartListJson",
//    				data:{
//    					member_id : member_id
//    				},
//    				dataType: "json"
//    			})
//    			.done(function(cartList) {
// //    				console.log(cartList)
//    				for(let cart of cartList){ 
// //    					console.log(cart)
//    			let result = "<tr>"
//    							+ "<td>" + "<img src='/Code_Green/resources/item/" + cart.file1 + "'>" + "</td>"
//    							+ "<td id='rf_item_idx'>" + cart.rf_item_idx	+ "</td>" 
//    							+ "<td id='rf_item_idx'>" + cart.manager_brandname +"</td>"
//    							+ "<td id='rf_item_idx'>" + cart.item_name +"</td>"
//    							+ "<td id='rf_item_idx'>" + cart.item_price +"</td>"
//    							+ "<td id='rf_item_idx'>" + cart.cart_amount +"</td>"
//    							+ "<td id='rf_item_idx'>" + cart.cart_total +"</td>"
//    						+ "</tr>";
   					
//    					$(".ps-block__content > table").append(result);
//    				}
   	
   	
//    			})
//    			.fail(function() { // 요청 실패 시
//    				$(".ps-block__content > table").html("요청 실패!");
//    			});
   			
//    	       }

           
           
<!-- 주문 컨트롤러로 보내기 -->            
//        	let sell_receiver = $("#sell_receiver").val();
		
// 		$(function() {
// 			orderList();
// 		});
        
		
// 		function orderList(){  
// 			var orderList = $("#orderList").serialize();
			
// 			$("#orderBtn").on("click",function(){
				
// 				$.ajax({
// 					type:"POST",
// 					data:orderList,
// 					url:"/Code_Green/payment_success",
// 					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
// // 					dataType: "json",
// 					success:function() {	
// 						console.log("됨")
// 					},
// 					error:function() {
// 						console.log("안됨")
// 					}
// 				});
// 			});
// 		}	
             
    </script>    
         
  
</head>

<body>
 	
 	<jsp:include page="../inc/top.jsp"></jsp:include>
 	
    <main class="ps-page--my-account">
        <div class="ps-breadcrumb">
            <div class="container">
                <ul class="breadcrumb">
                    <li><a href="../main/main.jsp">Home</a></li>
                    <li>주문(ORDER)</li>
                </ul>
            </div>
        </div>
        <section class="ps-section--account ps-checkout">
            <div class="container">
                <div class="ps-section__header">
                    <h3>주문(ORDER)</h3>
                </div>
                <div class="form-check">
				  <input class="form-check-input" type="radio" name="flexRadioDefault" id="basic_address" checked onchange="setDisplay()">
				  <label class="form-check-label" for="flexRadioDefault1">
				    기존 주소
				  </label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="flexRadioDefault" id="new_address" onchange="setDisplay()">
				  <label class="form-check-label" for="flexRadioDefault2">
				    변경 주소
				  </label>
				</div>
                <div class="ps-section__content">
                        <div class="ps-form__content">
                            <div class="row">
                                <div class="ps-block--shipping">
                                        
                                        
	                                     <!-- 기존 주소 -->
	                                 <form action="payment_success?member_id=${sessionScope.sId }" method="post" id="orderList" name="orderList">
	                                 	<div class="ps-block__panel" id="basicDiv" style="width: 1200px;">
	                                  		<div class="mb-3">
												<label for="formGroupExampleInput" class="form-label">이름</label>
												<input type="text" class="form-control" id="sell_receiver" name="sell_receiver" value="${memberInfo.member_name }" readonly="readonly">
											</div>
											<div class="mb-3">
												<label for="formGroupExampleInput2" class="form-label">연락처</label>
												<input type="text" class="form-control" id="sell_phone" name="sell_phone" value="${memberInfo.member_phone }" readonly="readonly">
											</div>
											<div class="mb-3">
												<label for="formGroupExampleInput2" class="form-label">우편번호</label>
												<input type="text" class="form-control" id="sell_postcode" name="sell_postcode" value="${memberInfo.member_postcode }" readonly="readonly">
											</div>
											<div class="mb-3">
												<label for="formGroupExampleInput2" class="form-label">배송지 주소</label>
												<input type="text" class="form-control" id="sell_address" name="sell_address" value="${memberInfo.member_address }" readonly="readonly">
											</div>
	                                    </div>
	                                     	
	                                     	
	                                 <!-- 변경 주소 --> 	
										<div class="ps-block__panel" id="newDiv" style="width: 1200px;">
	                                      	<div class="mb-3">
												<label for="formGroupExampleInput" class="form-label">이름</label>
												<input type="text" class="form-control" name="sell_receiver" placeholder="받는 분의 이름을 입력하세요." required="required">
											</div>
											<div class="mb-3">
												<label for="formGroupExampleInput2" class="form-label">연락처</label>
												<input type="text" class="form-control" name="sell_phone" placeholder="받는 분의 연락처를 입력하세요." required="required">
											</div>
											<div class="mb-3">
												<label for="formGroupExampleInput2" class="form-label">우편번호</label>
												<input type="button" value="주소 검색" onclick="execDaumPostcode()">
												<input type="text" class="form-control" id="postcode" name="sell_postcode" placeholder="받는 분의 우편번호를 입력하세요." required="required">
											</div>
											<div class="mb-3">
												<label for="formGroupExampleInput2" class="form-label">배송지 주소</label>
												<input type="text" class="form-control" id="address" name="sell_address" placeholder="받는 분의 주소를 입력하세요.(주소 검색 클릭 후 상세 주소까지 입력해주세요.)" required="required">
											</div>
										</div>
										
										
										
										<!-- 공통 -->
										
										<!-- 적립금 -->
										<div class="ps-block--checkout-order">
	                                        <div class="ps-block__content">
	                                        	<span style="padding: 0 40px; margin: 0 20px;">
		                                        	보유 적립금
		                                        	<input type="text" value="${coin.coin_total }" class="sell_coin_total" style="color: #5fa30f;">
	                                        	</span>
	                                        	<span style="padding: 0 40px; margin: 0 20px;">
												 사용할 적립금
		                                        	<input type="text" name="sell_use_coin" class="sell_use_coin" style="color: #5fa30f;">
		                                        	<input type="button" value="사용" class="sell_coin_use_btn">
	                                        	</span>
	                                        	<span style="padding: 0 40px; margin: 0 20px;">
		                                        	 남은 적립금
		                                        	 <span class="sell_coin_remain" style="padding: 50px; color : #5fa30f;"></span>
	                                        	</span>
	                                        </div>
	                                       </div>
		                                     
	                                     
	                                      <!-- 주문 내역 -->
		                                  <!-- cart에서 넘어온거 뿌리기 -->
		                                    <div class="ps-block--checkout-order">
		                                        <div class="ps-block__content">
		                                           <table class="orderList">
		                                           	 	<tr>
			                                           		<td></td><!-- 파일 -->
			                                           		<td>상품 번호</td>
			                                           		<td>브랜드명</td>
			                                           		<td>상품명</td>
			                                           		<td>가격</td>
			                                           		<td>주문 갯수</td>
			                                           		<td>상품 총 금액</td>
			                                           	</tr>
			                                          <c:forEach var="cart" items="${cartList }"> 	
			                                           	<tr>
			                                           		<td>
			                                           			<img src="/Code_Green/resources/item/${cart.file1 }">
			                                           		</td>
			                                           		<td>${cart.rf_item_idx }</td>
			                                           		<td>${cart.manager_brandname }</td>
			                                           		<td>${cart.item_name }</td>
			                                           		<td>${cart.item_price }</td>
			                                           		<td>${cart.cart_amount }</td>
			                                           		<td>${cart.cart_total*cart.cart_amount }</td>
			                                           	</tr>
			                                         </c:forEach> 
			                                         	<tr>
			                                           		<td>주문 총 금액</td>
			                                           		<td colspan="6">
			                                           			<input type="text" value="" class="sell_item_total_price">
			                                           		</td>
				                                        </tr>	
				                                         <tr>
			                                           		<td>배송비</td>
			                                           		<td colspan="6">
			                                           			<input type="text" value="2500" class="sell_shipping_fee">
			                                           		</td>
				                                        </tr>	
				                                         <tr>
			                                           		<td>사용한 적립금</td>
			                                           		<td colspan="6" class="sell_use_coin">
			                                           		</td>
				                                        </tr>	
				                                         <tr>
			                                           		<td>결제 금액</td>
			                                           		<td colspan="6">
			                                           			<span class="sell_total_price"></span>
			                                           		</td>
			                                        	</tr>	
			                                        </table>
			                                     </div>
			                                 </div>
			                                  
			                                  
			                                  
			                                  <!-- 주문하기 버튼 -->
			                                 <div class="ps-block--payment-method" style="background: white">
			                                     <div class="ps-tabs">
		                                            <div class="ps-tab active" id="account">
		                                                 <div class="form-group submit">
		                                                       <input type="submit" class="ps-btn ps-btn--fullwidth" id="orderBtn" value="주문하기">
		                                                 </div>
		                                           </div>
			                                    </div>
		                                	</div>   
		                           		</form>
							         </div>
			                    </div>
			                </div>
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