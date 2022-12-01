<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
    <title>주문상세내역 - 베지터틀</title>
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
    <link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
    
    <style type="text/css">
    	#orderCancel{
			margin-top: 80px;
		    background: #5fa30f;
		    border: none;
		    border-radius: 3px;
		    color: white;
		    width: 100px;
		    height: 50px;
    	}
    
    </style>
    
    <script type="text/javascript">
    	function myOrderCancel() {
			
			let cancelAuth = confirm('주문 취소 하시겠습니까? 취소하면 복구할 수 없는 점 참고 바랍니다.');
			
			if(cancelAuth){
				
				if('${buyDetail.sell_status}' =='취소요청') {
					alert('이미 취소한 주문입니다.');
				} else {
					$.ajax({
						type : 'POST',
						url : 'payment_cancel',
						data: {
							sell_idx : ${buyDetail.sell_idx }
						}
					});
					
					alert('주문취소 완료되었습니다. 관리자에게 취소요청이 되었습니다.');
				}
				
			}
			
		}
    
    </script>    
        
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


 <!-- ==========주문정보=========================================================================================================     -->                          
                    <div class="col-lg-8">
                        <div class="ps-section__right">
                            <div class="ps-section--account-setting">
                                <div class="ps-section__header">
                                    <h3>주문상세내역</h3>
                                </div>
                                
                                <div class = "orderInfo_table">
	                                <table border="1">
	                                	<tr>
	                                		<td colspan="2">주문번호</td>
	                                	</tr>
	                                	<tr>
	                                		<td colspan="2">123456-789456</td>
	                                	</tr>
	                                	<tr>
	                                		<td>주문상태</td>
	                                		<td>결제방법</td>
	                                	</tr>
	                                	<tr>
	                                		<td>결제완료</td>
	                                		<td>카카오페이</td>
	                                	</tr>
	                                	<tr>
	                                		<td>받는사람</td>
	                                		<td>연락처</td>
	                                	</tr>
	                                	<tr>
	                                		<td>김지영</td>
	                                		<td>01062522047</td>
	                                	</tr>
	                               		<tr>
	                                		<td colspan="2">배송지</td>
	                                	</tr>
	                                	<tr>
	                                		<td colspan="2">동구범천로 112, 98-2</td>
	                                	</tr>
	                                </table>
                                </div>
                                    <div class="table-responsive">
                                        <table class="table ps-table">
                                            <thead>
                                                <tr>
                                                    <th>주문상품</th>
                                                    <th>금액</th>
                                                    <th>수량</th>
                                                    <th>총 금액</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:forEach var="itemList" items="${MyBuyItemList }">
                                                <tr>
                                                    <td>
                                                        <div class="ps-product--cart">
                                                            <div class="ps-product__thumbnail">
                                                            <a href="ItemDetail.bo?item_idx=${itemList.item_idx}&item_category=${itemList.item_category}"><img src="/Code_Green/resources/item/${itemList.file1 }"></a></div>
                                                            <div class="ps-product__content">
                                                            <a href="ItemDetail.bo?item_idx=${itemList.item_idx}&item_category=${itemList.item_category}">${itemList.item_name }</a>
                                                                <p><strong>${itemList.manager_brandname }</strong></p>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td><span>${itemList.item_price }</span></td>
                                                    <td>${itemList.sell_amount }</td>
                                                    <td><span>${itemList.item_price }*${itemList.sell_amount }</span></td>
                                                </tr>
                                                </c:forEach>
                                                
                                                <!-- 총금액 및 배송비 출력 칸  -->
                                                <tr>
                                                	<td colspan="4">배송비 = 0원</td>
                                                </tr>
                                                <tr>
                                               		<td colspan="4">배송비 0원  +  주문금액 54000원 = 총 ${buyDetail.sell_total_price}원</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div align="right">
                                       	 	<button id="orderCancel"  onclick="myOrderCancel()">주문취소</button>
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
        
      
        <!-- ---------------------------------------------------------- 푸터푸터 ---------------------------------------------------------- -->
     	<jsp:include page="../inc/footer.jsp"></jsp:include>
    	<!-- ---------------------------------------------------------- 푸터푸터 끝 ---------------------------------------------------------- -->
    
    
    
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