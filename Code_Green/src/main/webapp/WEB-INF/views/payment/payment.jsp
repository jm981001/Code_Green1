<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>결제</title>
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
                name : '당근 10kg',
                amount : 1004,
                buyer_email : 'Iamport@chai.finance',
                buyer_name : '아임포트 기술지원팀',
                buyer_tel : '010-1234-5678',
                buyer_addr : '서울특별시 강남구 삼성동',
                buyer_postcode : '123-456'
            }, function (rsp) { // callback
                if (rsp.success) {
                    alert("결제가 완료되었습니다.");
                    location.href="payment_success_card.jsp";
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
                    document.getElementById("address1").value = data.roadAddress; // 주소(도로명 주소)
                    
    				document.getElementById("address2").focus();                
                }
            }).open();
        }
         
    </script>
</head>

<body>
 	
 	<jsp:include page="../inc/top.jsp"></jsp:include>
 	
    <main class="ps-page--my-account">
        <div class="ps-breadcrumb">
            <div class="container">
                <ul class="breadcrumb">
                    <li><a href="../main/main.jsp">Home</a></li>
                    <li>결제하기</li>
                </ul>
            </div>
        </div>
        <section class="ps-section--account ps-checkout">
            <div class="container">
                <div class="ps-section__header">
                    <h3>주문 / 결제</h3>
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
                                <div class="col-xl-8 col-lg-8 col-md-12 col-sm-12 col-12 ">
                                    <div class="ps-block--shipping">
                                        <div class="ps-block__panel" id="basicDiv">
                                            <div class="mb-3">
											  <label for="formGroupExampleInput" class="form-label">이름</label>
											  <input type="text" class="form-control">
											</div>
											<div class="mb-3">
											  <label for="formGroupExampleInput2" class="form-label">연락처</label>
											  <input type="text" class="form-control">
											</div>
											<div class="mb-3">
											  <label for="formGroupExampleInput2" class="form-label">우편번호</label>
											  <input type="text" class="form-control">
											</div>
											<div class="mb-3">
											  <label for="formGroupExampleInput2" class="form-label">배송지 주소</label>
											  <input type="text" class="form-control">
											</div>
											<div class="mb-3">
											  <label for="formGroupExampleInput2" class="form-label">배송지 상세 주소</label>
											  <input type="text" class="form-control">
											</div>
                                        </div>
                                        <div class="ps-block__panel" id="newDiv">
                                            <div class="mb-3">
											  <label for="formGroupExampleInput" class="form-label">이름</label>
											  <input type="text" class="form-control" placeholder="받는 분의 이름을 입력하세요.">
											</div>
											<div class="mb-3">
											  <label for="formGroupExampleInput2" class="form-label">연락처</label>
											  <input type="text" class="form-control" placeholder="받는 분의 연락처를 입력하세요.">
											</div>
											<div class="mb-3">
											  <label for="formGroupExampleInput2" class="form-label">우편번호</label>
											  <input type="button" value="주소 검색" onclick="execDaumPostcode()">
											  <input type="text" class="form-control" id="postcode" placeholder="받는 분의 우편번호를 입력하세요.">
											</div>
											<div class="mb-3">
											  <label for="formGroupExampleInput2" class="form-label">배송지 주소</label>
											  <input type="text" class="form-control" id="address1" placeholder="받는 분의 주소를 입력하세요.">
											</div>
											<div class="mb-3">
											  <label for="formGroupExampleInput2" class="form-label">배송지 상세 주소</label>
											  <input type="text" class="form-control" id="address2" placeholder="받는 분의 상세 주소를 입력하세요.">
											</div>
                                        </div>
                                        <h4>적립금</h4>
                                        <div class="ps-block__panel">
                                            <figure><small>보유</small><strong> 5000원</strong></figure>
                                            
                                            <!-- 사용할 적립금 적기 -->
                                            <figure><small>사용</small><input type="text" placeholder="-3000" style="text-align: right;">원</figure>
                                            
                                            <!-- 남은 적립금 -->
                                            <figure><small>남은 적립금</small><strong> 2000원</strong></figure>
                                            
                                        </div>
                                        <h4>결제 방식</h4>
                                        <div class="ps-block--payment-method">
                                            <ul class="ps-tab-list">
                                                <li class="active"><a class="ps-btn ps-btn--sm" href="#card">카드결제</a></li>
                                                <li class="active"><a class="ps-btn ps-btn--sm" href="#account">무통장 입금</a></li>
                                            </ul>
                                            <div class="ps-tabs">
                                                <div class="ps-tab active" id="card">
<!--                                                 	<div class="form-group"> -->
<!--                                                             <label>Card number</label> -->
<!--                                                             <input class="form-control" type="text" placeholder=""> -->
<!--                                                         </div> -->
<!--                                                         <div class="form-group"> -->
<!--                                                             <label>Card Holders</label> -->
<!--                                                             <input class="form-control" type="text" placeholder=""> -->
<!--                                                         </div> -->
	                                                     <div class="form-group submit">
	                                                           <button class="ps-btn ps-btn--fullwidth" onclick="requestPay()">결제하기</button>
	                                                     </div>
	                                                </div>
                                                <div class="ps-tab active" id="account">
                                                	<div class="form-group">
                                                            <label>은행명</label>
                                                            <input class="form-control" type="text" placeholder="입금에 사용할 은행명을 입력하세요.">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>입금주명</label>
                                                            <input class="form-control" type="text" placeholder="입금주명을 입력하세요.">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>계좌번호</label>
                                                            <input class="form-control" type="text" placeholder="입금할 계좌번호를 입력하세요.">
                                                        </div>
	                                                     <div class="form-group submit">
	                                                           <button class="ps-btn ps-btn--fullwidth" onclick="location.href='payment_success_account.jsp'">주문하기</button>
	                                                     </div>
	                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 ">
                                    <div class="ps-block--checkout-order">
                                        <div class="ps-block__content">
                                            <figure>
                                                <figcaption><strong>주문 내역</strong></figcaption>
                                            </figure>
                                            <figure class="ps-block__items"><a href="#"><strong>풀무원 치즈 1개</strong><span><small>2500원</small></span></a>
                                            								<a href="#"><strong>상하목장 우유 1개</strong><span><small>2500원</small></span></a>
                                            </figure>
                                            <figure>
                                                <figcaption><strong>상품 금액</strong><strong>5000원</strong></figcaption>
                                            </figure>
                                            <figure>
                                                <figcaption><strong>적립금 사용</strong><strong>-3000원</strong></figcaption>
                                            </figure>
                                            <figure>
                                                <figcaption><strong>적립금 사용 후 금액</strong><strong>2000원</strong></figcaption>
                                            </figure>
                                            <figure>
                                                <figcaption><strong>배송비(50000원 이상 구매시 무료배송)</strong><strong>+2500원</strong></figcaption>
                                            </figure>
                                             <figure class="ps-block__total">
                                                <h3>총 금액<strong>4500원</strong></h3>
                                            </figure>
                                            <figure>
                                                <figcaption><strong>주문 후 추가될 적립금</strong><strong>450원</strong></figcaption>
                                            </figure>
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
    <script src="/Code_Green/resources/js/main.js"></script>
</body>

</html>