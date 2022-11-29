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
    <title>주문 완료 - 베지터틀</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
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
    
    <!-- 결제 api 관련 js-->
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    
    <script type="text/javascript">
   		var jbRandom = Math.random();
    
       <!-- 결제 api -->
       var IMP = window.IMP; 
       IMP.init("imp82131734"); 
   
       function requestPay() {
           IMP.request_pay({
        	   pg : 'kcp',
               pay_method : 'card',
               merchant_uid: "${orderList.sell_order_number }" + jbRandom, // 주문번호?결제번호? 중복되면 결제안됨 ! 결제 할때마다 다른 번호 넣어야함
               name : '당근 10kg',
               amount : ${orderList.sell_total_price },
               buyer_email : '${orderList.member_email }',
               buyer_name : '${orderList.sell_receiver }',
               buyer_tel : '${orderList.sell_phone }',
               buyer_addr : '${orderList.sell_address }',
               buyer_postcode : '${orderList.sell_postcode }'
           }, function (rsp) { // callback
               if (rsp.success) {
                   alert("결제가 완료되었습니다.");
                   location.href = "payment_success_card_thanks";
                   $.ajax({
                          url: "payment_success_card",
                          type: "POST",
                          data: {
                             sell_idx : ${orderList.sell_idx}
                          },
                          success: function(){
                             alert("결제가 성공되었습니다.");
                          },
                          fail: function () {
                             alert("결제가 실패되었습니다.");
                          }
                       });
                  
                   
               } else {
                   alert("결제가 완료되지 않았습니다.");
                   history.back();
               }
           });
       }
       
    </script>
</head>

<body>

   <jsp:include page="../inc/top.jsp"></jsp:include>
   
    <main class="ps-page--my-account">
        <div class="ps-breadcrumb">
            <div class="container">
                <ul class="breadcrumb">
                    <li><a href="index.html">Home</a></li>
                    <li>주문 완료</li>
                </ul>
            </div>
        </div>
        <section class="ps-section--account">
            <div class="container">
                <div class="ps-block--payment-success">
                    <h3>주문 완료 되었습니다 !</h3>
                    <p>주문하여 주셔서 감사합니다. 자세한 주문 내역을 확인하시려면<a href="myPage_buyList"> 마이 페이지</a>에서 확인 하실 수 있습니다.</p>
                </div>
	         	<div class="col-lg-8" style="margin-top: 50px;">
	                <div class="ps-section__right">
	                    <div class="ps-section--account-setting">
	                    
	                        <div class="ps-section__header">
	                            <h3 style="color: #666">주문 번호 ${orderList.sell_order_number }</h3>
	                            <h3 style="color: #666">주문일 ${orderList.sell_date }</h3>
	                        </div>
	                        
	                        <div class="accordion" id="accordionExample">
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="headingOne">
							      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" style="font-size: 15px; color: #669900">
							        주문 내역
							      </button>
							    </h2>
							    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
							      <div class="accordion-body">
									<div class="ps-section__content">
			                            <div class="table-responsive">
			                                <table class="table ps-table">
			                                    <thead style="text-align: center;">
			                                        <tr>
			                                            <th><strong>상품명</strong></th>
			                                            <th><strong>상품 금액</strong></th>
			                                            <th><strong>수량</strong></th>
			                                            <th><strong>총 구매 금액</strong></th>
			                                        </tr>
			                                    </thead>
			                                    <tbody>
			                                    <c:forEach var="orderDetailList" items="${orderDetailList }">
			                                        <tr>
			                                            <td style="text-align: left;">
			                                                <div class="ps-product--cart">
			                                                    <div class="ps-product__content">${orderDetailList.item_name }
			                                                       <p>판매자:<strong>${orderDetailList.manager_brandname }</strong></p>
			                                                   	</div>
			                                                </div>
			                                            </td>
			                                            <td style="text-align: center;">${orderDetailList.item_price }</td>
			                                            <td style="text-align: center;">${orderDetailList.sell_amount }</td>
			                                            <td style="text-align: center;" ><fmt:formatNumber value="${orderDetailList.item_price * orderDetailList.sell_amount }"></fmt:formatNumber>
			                                          </td>
			                                        </tr>
			                                       </c:forEach> 
			                                    </tbody>
			                                </table>
			                            </div>
			                        </div>
							      </div>
							    </div>
							  </div>
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="headingTwo">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" style="font-size: 15px; color: #669900">
							      	결제 정보
							      </button>
							    </h2>
							    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
							      <div class="accordion-body">
									<div class="ps-section__content">  
				                        <div class="table-responsive">
			                                <table class="table ps-table" style="text-align: center;">
			                                    <thead>
			                                        <tr>
			                                            <th><strong>결제 방식</strong></th>
			                                            <th><strong>총 구매 금액</strong></th>
			                                            <th><strong>배송비</strong></th>
			                                            <th><strong>사용한 적립금</strong></th>
			                                            <th><strong>결제할 금액</strong></th>
			                                        </tr>
			                                    </thead>
			                                    <tbody>
			                                        <tr>
			                                            <td>${orderList.sell_pay_type }</td>
			                                            <td>${sell_item_total_price }</td>
			                                            <td>${shipping_fee }</td>
			                                            <td>${orderList.sell_usecoin }</td>
			                                            <td>${orderList.sell_total_price }</td>
			                                        </tr>
			                                    </tbody>
			                                </table>
				                          </div>
				                       </div>
							      </div>
							    </div>
							  </div>
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="headingThree">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree" style="font-size: 15px; color: #669900">
							        배송지 정보
							      </button>
							    </h2>
							    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
							      <div class="accordion-body">
									 <div class="ps-section__content">  
				                        <div class="table-responsive">
			                                <table class="table ps-table" style="text-align: center;">
			                                    <thead>
			                                        <tr>
			                                            <th><strong>이름</strong></th>
			                                            <th><strong>연락처</strong></th>
			                                            <th><strong>우편번호</strong></th>
			                                            <th><strong>주소</strong></th>
			                                        </tr>
			                                    </thead>
			                                    <tbody>
			                                        <tr>
			                                            <td>${orderList.sell_receiver }</td>
			                                            <td>${orderList.sell_phone }</td>
			                                            <td>${orderList.sell_postcode }</td>
			                                            <td>${orderList.sell_address }</td>
			                                        </tr>
			                                    </tbody>
			                                </table>
				                           </div>
				                       </div>
							      </div>
							    </div>
							  </div>
							</div>
							
							 <div class="accordion" id="accordionExample" style="margin-top: 50px;">
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="headingFour">
							      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour" style="font-size: 15px; color: #669900">
							        무통장입금 정보
							      </button>
							    </h2>
							    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
							      <div class="accordion-body">
									<div class="ps-section__content">
			                            <div class="table-responsive">
			                                <table class="table ps-table" style="text-align: center;">
			                                    <thead>
			                                        <tr>
			                                            <th><strong>은행명</strong></th>
			                                            <th><strong>예금주</strong></th>
			                                            <th><strong>계좌번호</strong></th>
			                                        </tr>
			                                    </thead>
			                                    <tbody>
			                                        <tr>
			                                            <td>KB국민은행</td>
			                                            <td>베지터틀</td>
			                                            <td>333-1111-2222-00</td>
			                                        </tr>
			                                    </tbody>
		                               		 </table>
			                            </div>
			                        </div>
							      </div>
							    </div>
							  </div>
							  
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="headingFive">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive" style="font-size: 15px; color: #669900">
							      	카드 정보
							      </button>
							    </h2>
							    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
							      <div class="accordion-body">
									<div class="ps-section__content">  
				                        <div class="table-responsive">
			                                <div class="ps-section__content" style="margin-top: 50px;">  
			                                	<div class="form-group submit">
                                                       <input type="button" class="ps-btn ps-btn--fullwidth" id="cardOrderBtn" value="카드결제" onclick="requestPay()">
                                                 </div>
					                  		</div>
				                          </div>
				                       </div>
							      </div>
							    </div>
							  </div>
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
    <!-- custom s/Code_Green/resourcesipts-->
    <script src="/Code_Green/resources/js/main.js"></script>

</html>