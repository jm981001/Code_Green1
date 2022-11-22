<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<title>브랜드 메인</title>
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
    <link rel="stylesheet" href="/Code_Green/resources/css/autopart.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/vendor.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
</head>
<style>
	.heart_icon_brand {
		width: 25px;
	    height: 25px;
	    position: absolute;
	    top: 19px;
	    left: 154px;
	}

	.brandlist-ul {
		display: grid;
	    grid-template-columns: repeat(4, 180px);
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
	}
	
	#brandlist-header {
		height: 30px;
		margin-top: 30px;
		margin-bottom: 50px;
	    font-weight: 500;
	    font-size: 28px;
	    color: rgb(51, 51, 51);
	    line-height: 35px;
	    letter-spacing: -1px;
	    display: center;
	    border: none;
	    padding-left: 40%;
	    background-color: transparent;
	}
	
	
	.ps-block__user-avatar img {
	
		border-radius: 100%;
	}
	
	.ps-section__left .brand_info {
		
		margin: 40px 0px 40px 0px;
	
	}
</style>
<script>
	// 입점브랜드 목록 토글버튼 
	function togglefun(text){
		var target = document.querySelector('#listlist');
		if(this.value==='입점브랜드 목록 ▲'){
			target.style.display = 'none';
			this.value = '입점브랜드 목록 ▼';
		} else {
			target.style.display = 'block';
			this.value = '입점브랜드 목록 ▲';
		}
	}
	
	
	window.onload = function(){
		if(${sessionScope.sId == null}){
			$(".brandfollowbtn").hide();
		} else {
			$(".brandfollowbtn").show();
		}
	}
	
// 	//브랜드 팔로우 상태
// 	window.onload = function(){
// 		if(${sessionScope.sId != null}){
// 			$(".brandfollowbtn").show();
// 			$.ajax({
// 				url:"FollowCheck.br",
// 				type:"post",
// 				data:{
// 					manager_idx : ${brand.manager_idx },
// 					member_id: '${sessionScope.sId}'
// 				},
// 				success:function(status){
// 					if(status > 0){
// 						$(".brandfollowbtn img").attr("src", "/Code_Green/resources/img/forzero/fheart.png");
// 					}
// 				}
// 			});
// 		} else {
// 			$(".brandfollowbtn").hide();
// 		}
// 	}
	
	
	
</script>
<body>
    
    
    <!-- 헤더 삽입 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 삽입 -->
    
    
    
    <div class="ps-page--single ps-page--vendor">
        <section class="ps-store-list">
            <div class="container">
					 <!-- 브랜드 정보 및 대표이미지 넣을 곳 -->
<!--                 <aside class="ps-block--store-banner"> -->
<!--                     <div class="ps-block__content bg--cover" data-background="/Code_Green/resources/img/forzero/lettuce.jpg"> -->
<!--                     </div> -->
<!--                 </aside> -->
                
                <input type="button" id="brandlist-header" value="입점브랜드 목록 ▼" onclick="togglefun(this.value)">
                <div id="listlist">
                	<ul class="brandlist-ul">
               			<li class="brandlist-li"><a href="BrandMain.br"><strong>전체보기</strong></a></li>
	                	<c:forEach var="brand" items="${brandList }">
               			<li class="brandlist-li"><a href="BrandInner.br?manager_idx=${brand.manager_idx }" >${brand.manager_brandname }</a></li>
               			</c:forEach>
                	</ul>
                </div>
                
                
              <div id="brandListInsert"> 
                <div class="ps-section__wrapper">
                    <div class="ps-section__left">
                        <aside class="widget widget--vendor">
                           
                            <h3 class="widget-title">브랜드별</h3>
	                           
	                            <div class="brandfollowbtn" style="display: none">
		                            <img src="/Code_Green/resources/img/forzero/eheart.png" class="heart_icon_brand">
		<!--                             <div class="brandfollowbtn"><a class="ps-block__inquiry" href="FollowBrand.mo">Follow</a></div> -->
		                            <a class="ps-block__inquiry" href="#">Follow</a>
	                            </div>
	                            
                            <div class="ps-block__user" >
		                     	<div class="ps-block__user-avatar">
		                     	<!-- 브랜드별 로고띄우기 -->
	                     		   <img src="/Code_Green/resources/img/winkya.jpg">
		                           <div class="brand_info">
		                           		궁금하신 브랜드를<p> 상단목록에서 선택해주세요!
		                           		
		                           </div>
		                    	</div>
		                    </div>
<!-- =========================================== 수정중 사이드바!!!======================================================== -->

					<aside class="widget widget_shop">
		                <h4 class="widget-title">BY BRANDS</h4>
		                <figure class="ps-custom-scrollbar" data-height="250">
		                  <c:forEach var="brand" items="${brandList }">
		                    <div class="ps-checkbox">
		                        <input class="form-control" type="checkbox" id="m-brand-1" name="brand" />
		                        <label for="m-brand-1">${brand.manager_brandname }</label>
		                    </div>
		                   </c:forEach>
		                </figure>
		                
		                <figure>
		                	<!-- 가격검색 목록 -->    
		                    <h4 class="widget-title">By Price</h4>
		                    <div class="leftbar_searchbyprice">
		                            <form action="SearchByPrice.mo" method="get">
			                            <input type="text" class="num1" name="min_p" placeholder="최저가" style="width: 70px" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">원 ~ 
			                            <input type="text" class="num2" name="max_p" placeholder="최고가" style="width: 70px"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">원<br>  
			                            <input type="submit" value="검색" >
		                            </form>
		                     </div>
		                </figure>
		                
					</aside>
                 </aside>
             </div>
<!-- =========================================== 수정중 사이드바 끝위치!!!======================================================== -->
          <!-- ===================================== 상품리스트 파트  ================================================== -->                  
                    
          <!-- 상품리스트 헤더  -->
                    <div class="ps-section__right">
                        <div class="ps-shopping ps-tab-root">
                            <div class="ps-shopping__header">
<!--                                 <p>총<strong> 6 </strong> 개의 상품 </p> -->
                               <div id="orderbylist"><a href="#">최근순</a>  |  <a href="#">판매량순</a></div>
                            </div>
                            
                    <div class="ps-tabs">
                        <div class="ps-tab active" id="tab-1">
                            <div class="ps-shopping-product">
                                <div class="row">
                                
           <!-- ===================================== 상품 1개당 ================================================== --> 
           						<c:forEach var="item" items="${itemList }">
                                    <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6 col-6 ">
                                        <div class="ps-product">
                                            <div class="ps-product__thumbnail">
                                            
                                            <a href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}" ><img src="/Code_Green/resources/item/${item.file1 }"/></a>
                                                <ul class="ps-product__actions">
                                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                                </ul>
                                            </div>
                                           <div class="ps-product__container"><a class="ps-product__vendor" href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.manager_brandname }</a>
                                               <div class="ps-product__content"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                                    <div class="ps-product__rating">
                                                   	 <select class="ps-rating" data-read-only="true">
                                                        <c:forEach var="i" begin="1" end="5">
			                                             	<c:choose>
			                                             		<c:when test="${i <= item.score}">
			                                             			<option value="1">${i }</option>
			                                             		</c:when>
			                                             		<c:otherwise>
			                                             			<option value="2">${i }</option>
			                                             		</c:otherwise>
			                                             	</c:choose>
			                                             </c:forEach>
                                                      </select><span>${item.board_star_score }</span>
                                                    </div>
                                                    
                                                    
                                                    
                                                  <h4 class="ps-product__price">${item.item_price }원</h4>
                                                </div>
                                                <div class="ps-product__content hover"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                                <h4 class="ps-product__price">${item.item_price }원</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                               </c:forEach>     
                                    <!-- 상품 1개당 끝 -->
                
           <!-- ===================================== 상품 1개당 ================================================== --> 
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
	</div>
   
    
   
 
	    <!-- 푸터 삽입 -->
		<jsp:include page="../inc/footer.jsp"></jsp:include>
		<!-- 푸터 삽입 -->
   
    
    
    
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