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
    <script type="text/javascript" src="/Code_Green/resources/js/jquery-3.6.1.js"></script>
    
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
                    document.getElementById('postcode').value = data.zonecode; // 우편번호
                    document.getElementById("address").value = data.roadAddress; // 주소(도로명 주소)
                }
            }).open();
        }
        
        function orderConfirm() {
			alert("주문을 완료하시겠습니까? \n확인을 클릭하시면 결제페이지로 이동합니다.");
		}
         
        
        // TODO
        // 1. sellController로 데이터 넘기기
        // 1-2. sell 테이블에 insert 시켜보기
        // 1-3. rf_member_idx 어떻게 넘길건기 생각해보기
        // 1-4. 적립금 사용(sell_usecoin) 같이 넘겨서 적립금 테이블에 잔액에 차감시키기
        // 1-5. rf_item_idx, sell_amount 배열로 넘겼기 때문에 xml에서 foreach 써서 insert
        //      - https://www.google.com/search?q=%EB%A7%88%EC%9D%B4%EB%B0%94%ED%8B%B0%EC%8A%A4+%EB%B0%B0%EC%97%B4+%ED%8C%8C%EB%9D%BC%EB%AF%B8%ED%84%B0&biw=1366&bih=625&ei=TGRyY-DKGsyQ-AbA9LPgBQ&oq=%EB%A7%88%EC%9D%B4%EB%B0%94%ED%8B%B0%EC%8A%A4+%EB%B0%B0%EC%97%B4&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAxgAMgUIABCABDIFCAAQgAQyBggAEAgQHjIGCAAQCBAeMgYIABAIEB46CwgAEIAEELEDEIMBOggIABCABBCxAzoUCC4QgAQQsQMQgwEQxwEQ0QMQ1AI6CwguEIAEEMcBENEDOhEILhCABBCxAxCDARDHARDRAzoLCC4QgAQQsQMQgwE6BAgAEAM6DgguEIAEELEDEIMBENQCOgcILhCABBAKOgcIABCABBAKOhEILhCABBCxAxCDARDHARCvAToHCC4Q1AIQAzoFCC4QgAQ6CAguEIAEELEDOgoIABCxAxCDARBDOgQIABBDOg4ILhCABBCxAxDHARDRA0oECEEYAEoECEYYAFAAWPobYNsmaAZwAXgFgAGUAogBzx6SAQYyLjkuMTGYAQCgAQGwAQDAAQE&sclient=gws-wiz-serp
        // 2. 배송비를 주문 페이지에서 보여줄건지 생각해보기
        // 3. 주문완료 페이지에 카드결제, 무통장입금 안내 폼 만들기
        // 4. insert 되면 select해서 불러와서 주문 완료페이지에 뿌려보기(주문번호와 주문일자)
        //    - 결제되면 주문상태(sell_status) 변경(update)시키기 ex)결제대기중(default) -> 결제완료
        //    - 결제일(sell_payment_date)도 insert 하기
        //    - 결제방식(sell_payment_type) insert ex)카드 결제면 '카드' / 무통장입금이면 '무통장입금'
        //    - 결제여부(sell_payment_status)update ex) 'N'(default) -> 'Y'
        // 5. 적립금 사용 클릭하면 남은 적립금에 차감되게 만들기
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
<!--                                 <div class="col-xl-8 col-lg-8 col-md-12 col-sm-12 col-12 "> -->
                                    <div class="ps-block--shipping">
                                        
                                        <!-- 기존 주소 -->
		                                   <form action="payment_success?member_id=${sessionScope.sId }" method="post">
			                                  <div class="ps-block__panel" id="basicDiv" style="width: 1200px;">
	                                            <div class="mb-3">
												  <label for="formGroupExampleInput" class="form-label">이름</label>
												  <input type="text" class="form-control" name="sell_receiver" value="${memberInfo.member_name }" readonly="readonly">
												</div>
												<div class="mb-3">
												  <label for="formGroupExampleInput2" class="form-label">연락처</label>
												  <input type="text" class="form-control" name="sell_phone" value="${memberInfo.member_phone }" readonly="readonly">
												</div>
												<div class="mb-3">
												  <label for="formGroupExampleInput2" class="form-label">우편번호</label>
												  <input type="text" class="form-control" name="sell_postcode" value="${memberInfo.member_postcode }" readonly="readonly">
												</div>
												<div class="mb-3">
												  <label for="formGroupExampleInput2" class="form-label">배송지 주소</label>
												  <input type="text" class="form-control" name="sell_address" value="${memberInfo.member_address }" readonly="readonly">
												</div>
	                                     
	                                      <!-- 적립금 -->
                                        <div class="ps-block__panel" style="margin-top: 50px;">
                                            <figure><small>보유</small><strong> ${coin.coin_total }원</strong></figure>
                                            
                                            <!-- 사용할 적립금 적기 -->
                                            <figure><small>사용</small>
                                            	<input type="text" style="text-align: right; border: 1px solid #d1d1d1" name="sell_use_coin" value="3000">원
		                                    	<input type="button" value="적립금 사용">
                                            </figure>
                                            <!-- 남은 적립금 -->
                                            <figure><small>남은 적립금</small><strong> 2000원</strong></figure>
                                        </div>
	                                     
	                                       <!-- 주문 내역 -->
		                                  <!-- cart에서 넘어온거 뿌리기 -->
<!-- 		                                <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 "> -->
		                                    <div class="ps-block--checkout-order">
		                                        <div class="ps-block__content">
		                                           <table class="orderList">
			                                           	 	<tr>
				                                           		<td></td>
				                                           		<td >상품 번호</td>
				                                           		<td>브랜드명</td>
				                                           		<td>상품명</td>
				                                           		<td>가격</td>
				                                           		<td>주문 갯수</td>
				                                           		<td>총 금액</td>
				                                           	</tr>
			                                           	 <c:forEach var="cart" items="${cartList}">
				                                           	<tr>
				                                           		<td>
				                                           			<img src="/Code_Green/resources/item/${cart.file1 }" >
				                                           		</td>
				                                           		<td>
				                                           			<input type="text" value="${cart.rf_item_idx}" readonly="readonly">
				                                           		</td>
				                                           		<td>
				                                           			<input type="text" value="${cart.manager_brandname}" readonly="readonly">
				                                           		</td>
				                                           		<td>
				                                           			<input type="text" value="${cart.item_name}" readonly="readonly">
				                                           		 </td>
				                                           		<td>
				                                           			<input type="text" value="${cart.item_price }" readonly="readonly">
				                                           		</td>
				                                           		<td>
				                                           			<input type="text" name="sell_amount" value="${cart.cart_amount }" readonly="readonly">
				                                           		</td>
				                                           		<td>
				                                           			<input type="text" value="${cart.cart_total }" readonly="readonly">
				                                           		</td>
				                                           	</tr>
		                                           		 </c:forEach>
		                                           		  <tr>
				                                           		<td colspan="6"><b>전체 금액</b></td>
				                                           		<td>
				                                           			<input type="text" value="29960" readonly="readonly">
				                                           		</td>
				                                         </tr>
				                                         
				                                         <!-- 배송비는 결제 완료 페이지에서 총 결제 금액보고 결정 -->
<!-- 				                                         <tr> -->
<!-- 				                                           		<td colspan="6"><b>배송비</b></td> -->
<!-- 				                                           		<td> -->
<!-- 				                                           			<input type="text" value="2500" readonly="readonly"> -->
<!-- 				                                           		</td> -->
<!-- 				                                         </tr> -->

				                                         <tr>
				                                           		<td colspan="6"><b>총 금액</b></td>
				                                           		<td>
				                                           			<input type="text" value="32460" readonly="readonly">
				                                           		</td>
				                                         </tr>
				                                         <tr>
				                                           		<td colspan="6"><b>적립금 사용</b></td>
				                                           		<td>
				                                           			<input type="text" value="1000" readonly="readonly">
				                                           		</td>
				                                         </tr>
				                                         <tr style="font-size: 20px;">
				                                           		<td colspan="6">최종 결제 금액</td>
				                                           		<td>
				                                           			<input type="text" value="31460" readonly="readonly"  style="color: #5fa30f">
				                                           		</td>
				                                         </tr>
		                                           </table>
		                                           
		                                        </div>
		                                    </div>
<!-- 		                                </div> -->
	                                     
	                                         <div class="ps-block--payment-method" style="background: white">
		                                      <div class="ps-tabs">
		                                              <div class="ps-tab active" id="account">
		                                                    <div class="form-group submit">
		                                                          <input type="submit" class="ps-btn ps-btn--fullwidth" value="주문하기" onclick="orderConfirm()">
		                                                    </div>
			                                          </div>
		                                         </div>
		                                    </div>
	                                  </div>   
	                               </form>
                                   
                                        <!-- 변경 주소 -->
                                     <form action="payment_success_account" method="post">
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

											 <!-- 적립금 -->
                                        <div class="ps-block__panel" style="margin-top: 50px;">
                                            <figure><small>보유</small><strong> 5000원</strong></figure>
                                            
                                            <!-- 사용할 적립금 적기 -->
                                             <figure><small>사용</small>
                                            	<input type="text" style="text-align: right; border: 1px solid #d1d1d1" name="sell_use_coin" value="3000">원
		                                    	<input type="button" value="적립금 사용">
                                            </figure>
                                            
                                            <!-- 남은 적립금 -->
                                            <figure><small>남은 적립금</small><strong> 2000원</strong></figure>
                                        </div>
	                                     
	                                        <!-- 주문 내역 -->
		                                  <!-- cart에서 넘어온거 뿌리기 -->
<!-- 		                                <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 "> -->
		                                    <div class="ps-block--checkout-order">
		                                        <div class="ps-block__content">
		                                           <table class="orderList">
			                                           	 <c:forEach var="cart" items="${cartList}">
				                                           	<tr>
				                                           		<td>
				                                           			<img src="/Code_Green/resources/item/${cart.file1 }" >
				                                           		</td>
				                                           		<td>
				                                           			<input type="text"  name="rf_item_idx" value="${cart.rf_item_idx}  ${cart.manager_brandname} ${cart.item_name}" readonly="readonly"><br>
				                                           		</td>
				                                           		<td>${cart.item_price }</td>
				                                           		<td>${cart.cart_amount }EA</td>
				                                           		<td>${cart.cart_total }</td>
				                                           	</tr>
				                                           	<tr>
				                                           	</tr>
		                                           		 </c:forEach>
		                                           		  <tr>
				                                           		<td colspan="4"><b>전체 금액</b></td>
				                                           		<td>
				                                           			<input type="text" value="29960" readonly="readonly">
				                                           		</td>
				                                         </tr>
				                                         <tr>
				                                           		<td colspan="4" ><b>배송비</b></td>
				                                           		<td>
				                                           			<input type="text" value="2500" readonly="readonly">
				                                           		</td>
				                                         </tr>
				                                         <tr>
				                                           		<td colspan="4"><b>총 금액</b></td>
				                                           		<td>
				                                           			<input type="text" value="32460" readonly="readonly">
				                                           		</td>
				                                         </tr>
				                                         <tr>
				                                           		<td colspan="4" ><b>적립금 사용</b></td>
				                                           		<td>
				                                           			<input type="text" value="1000" readonly="readonly">
				                                           		</td>
				                                         </tr>
				                                         <tr style="font-size: 20px;">
				                                           		<td colspan="4" style="color: #5fa30f"><b>최종 결제 금액</b></td>
				                                           		<td>
				                                           			<input type="text" value="31460" readonly="readonly"  style="color: #5fa30f">
				                                           		</td>
				                                         </tr>
		                                           </table>
		                                           
		                                        </div>
		                                    </div>
<!-- 		                                </div> -->
	                                     
	                                         <div class="ps-block--payment-method" style="background: white">
		                                      <div class="ps-tabs">
		                                              <div class="ps-tab active" id="account">
		                                                    <div class="form-group submit">
		                                                          <input type="submit" class="ps-btn ps-btn--fullwidth" value="주문하기">
		                                                    </div>
			                                          </div>
		                                         </div>
		                                    </div>
	                                  </div>   
	                               </form>
				               </div>
<!-- 				       </div> -->
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