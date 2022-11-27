<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
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
	<title>간식류 - 베지터틀</title>
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
    
    <style type="text/css">
    	#cheapSnackList{
     		display: none; 
    	}
    	#expensiveSnackList{
    		display: none;
    	}
    	#reviewSnackList{
    		display: none;
    	}
    </style>
    
    <script type="text/javascript">
    
    	window.onload = function(){
    		
    		$('#sort').val('${sort}')
    		sortItemList($('#sort').val());
//     		$('#dairyDrinkList').hide(); 
//     		$('#cheapDairyDrinkList').show();
    		
    	}	
    
    	var sortItemList = function(value) {
    		
    		var aLinks = $('.pageLink');
    		for(var i=0; i<aLinks.length; i++){
	    		var str = aLinks[i].href.split('sort=')[0] + 'sort=';
	    		aLinks[i].href = str + value;
    		}
    		
    		if(value == "newDate"){
    			$('#snackList').show();
    			$('#reviewSnackList').hide(); 
	        	$('#cheapSnackList').hide();
	    		$('#expensiveSnackList').hide();
    		} else if(value == "review") {
	        	$('#snackList').hide();
	    		$('#reviewSnackList').show(); 
	    		$('#cheapSnackList').hide();
	    		$('#expensiveSnackList').hide();
    		} else if(value == "cheap"){
	    		$('#snackList').hide();
	    		$('#reviewSnackList').hide();  
	        	$('#cheapSnackList').show();
	    		$('#expensiveSnackList').hide();
	    	} else {
	        	$('#snackList').hide();
	    		$('#reviewSnackList').hide(); 
	    		$('#cheapSnackList').hide();
	    		$('#expensiveSnackList').show();
			}
    		
//     		if(value == "cheap"){
// 	    		$('#dairyDrinkList').hide(); 
// 	    		$('#expensiveDairyDrinkList').hide();
// 	        	$('#cheapDairyDrinkList').show();
// 	    	} else if(value == "expensive") {
// 	    		$('#cheapDairyDrinkList').hide(); 
// 	        	$('#dairyDrinkList').hide();
// 	    		$('#expensiveDairyDrinkList').show();
// 			}
    	};
    	
//     	function cheapPageNum() {

//     		var tmp = $("#cheapPageNum").attr("href");
    		
//     		window.location.href = tmp + "&value=" + value;
// 		}

// 		function cheapPageNum() {
// 			window.onload = function () {
// 				$(sortItemList).val('selected');
// 				$("#form-select").val().attr("selected","selected");
// 			}
// 		}
    	
    </script>
    
<!--     <script type="text/javascript"> 
 		function cheapPageNum() {
 			var tmp = $("#cheapPageNum").attr("href");
			
 		}
 </script> -->
<!--
 <script th:inline="javascript">    
    화면 전환 후 select box 고정
    var selectedYear = [[${selectedYear}]]; // 화면전환 하면서 값을 받아온다
    
    if(selectedYear == 2018){
        $('#2018').attr('selected','selected');
    } else if(selectedYear == 2017){
        $('#2017').attr('selected','selected');
    } else{
        $('#2019').attr('selected','selected');
    }
</script>-->

    
    
</head>
<body>
    
    
    <!-- 헤더 삽입 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 삽입 -->
    
    
    
    
    <div class="ps-page--single ps-page--vendor">
        <section class="ps-store-list">
            <div class="container">
                
                
                <div class="ps-section__wrapper">
                    <div class="ps-section__left">
                        <aside class="widget widget--vendor">
                            <h3 class="widget-title">카테고리</h3>
                            <ul class="menu--dropdown">
                                <li><a href="category_all">전체 상품</a> </li>
                                <li><a href="category_sale">특가 상품</a> </li>
                                <li><a href="category_fruit_vegi">과일 / 채소</a> </li>
                                <li><a href="category_dairy_drink">유제품 / 음료</a></li>
                                <li><a href="category_iced_easy">냉동 식품 / 간편 식품</a></li>
                                <li><a href="category_fish">해산물 </a></li>
                                <li><a href="category_snack">간식류</a></li>
                            </ul>
                        </aside>
                    </div>
                    <div class="ps-section__right">
						<div id="category_h3">
							<h2>간식류</h2>
						</div>                    

						 <nav class="ps-store-link">
                        	<section id="buttonArea">
							<!-- 검색 기능 구현을 위한 form 태그 -->
								<form action="category_snack" method="get">
									<select name="searchType">
										<option value="item_name">상품명</option>
										<option value="brand_name">상호명</option>
									</select>
									<input type="text" name="keyword">
									<input type="submit" value="검색" id="typeSearch">
								</form>
							</section>
                            <select name="sortType" id="sort" class="form-select" aria-label="Default select example" onchange="sortItemList(this.value)">
							  <option value="newDate">신상품순</option>
							  <option value="review">후기 많은순</option>
							  <option value="cheap">낮은 가격순</option>
							  <option value="expensive">높은 가격순</option>
							</select>
                        </nav>
							
						
                        <div class="ps-shopping ps-tab-root" id="snackList">
                            <div class="ps-tabs">
                                <div class="ps-tab active" id="tab-1">
                                    <div class="ps-shopping-product">
                                        <div class="row">
                                        
                                        	<!-- 반복문 시작 -->
                                        	<c:forEach var="item" items="${itemList }">
<%--                                         		<c:forEach var="image" items="${imageList }"> --%>
                                        	<!-- 상품 1개당 시작 -->
                                            <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-6 ">
                                                <div class="ps-product">
                                                    <div class="ps-product__thumbnail">
                                                    	
                                                    	
                                                    	<!-- 상품 이미지 -->
                                                    	<a href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}" >
                                                    		<img src="/Code_Green/resources/item/${item.file1 }" alt="" />
                                                    	</a>
                                                        <ul class="ps-product__actions">
                                                        	
                                                        	
                                                        	<!-- 장바구니 및 찜 -->
                                                        	<!-- 
                                                        	* 장바구니 페이지로 이동
                                                        	* 찜 페이지로 이동
                                                        	 -->
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    
                                                    
                                                    <!-- 브랜드명 및 상품명 -->
                                                    <!-- 
                                                    * 브랜드명은 서브쿼리 사용하여 불러오기
                                                     -->
                                                    <div class="ps-product__container"><a class="ps-product__vendor" href="#">${item.manager_brandname }</a>
                                                        <div class="ps-product__content"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx }">${item.item_name }</a>
                                                            
                                                            <!-- 별점 -->
                                                            <!-- 
                                                            *별점 카운트 하기
                                                             -->
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
                                                            
                                                            
                                                            <!-- 가격 -->
                                                            <p class="ps-product__price sale">${item.item_price } <del>${item.item_price } </del></p>
                                                        </div>
                                                        <div class="ps-product__content hover"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx }">${item.item_name }</a>
                                                            <p class="ps-product__price sale">${item.item_price } <del>${item.item_price } </del></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 상품 1개당 끝 -->
												                                     
                                           </c:forEach>      	
                                        </div>
                                    </div>
                           		</div>
                          	</div>
                         </div>
                         
<!-- --------------------------------------후기 많은순 (후기 많은순 페이징 필요)----------------------------------------------------- -->
                                   
                        <div class="ps-shopping ps-tab-root" id="reviewSnackList">
                            <div class="ps-tabs">
                                <div class="ps-tab active" id="tab-1">
                                    <div class="ps-shopping-product">
                                        <div class="row">
                                        
                                        	<!-- 반복문 시작 -->
                                        	<c:forEach var="reviewItem" items="${reviewItemList }">
                                        	<!-- 상품 1개당 시작 -->
                                            <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-6 ">
                                                <div class="ps-product">
                                                    <div class="ps-product__thumbnail">
                                                    	
                                                    	
                                                    	<!-- 상품 이미지 -->
                                                    	<a href="ItemDetail.bo?item_idx=${reviewItem.item_idx }">
                                                    		<img src="/Code_Green/resources/img/item/${reviewItem.file1 }" alt="" />
                                                    	</a>
                                                        <ul class="ps-product__actions">
                                                        	
                                                        	
                                                        	<!-- 장바구니 및 찜 -->
                                                        	<!-- 
                                                        	* 장바구니 페이지로 이동
                                                        	* 찜 페이지로 이동
                                                        	 -->
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    
                                                    
                                                    <!-- 브랜드명 및 상품명 -->
                                                    <!-- 
                                                    * 브랜드명은 서브쿼리 사용하여 불러오기
                                                     -->
                                                    <div class="ps-product__container"><a class="ps-product__vendor" href="#">${reviewItem.manager_brandname }</a>
                                                        <div class="ps-product__content"><a class="ps-product__title" href="product-default.html">${reviewItem.item_name }</a>
                                                            
                                                            <!-- 별점 -->
                                                            <!-- 
                                                            *별점 카운트 하기
                                                             -->
                                                            <div class="ps-product__rating">
                                                                <select class="ps-rating" data-read-only="true">
                                                                    <option value="1">1</option>
                                                                    <option value="1">2</option>
                                                                    <option value="1">3</option>
                                                                    <option value="1">4</option>
                                                                    <option value="2">5</option>
                                                                </select><span>${reviewItem.board_star_score }</span>
                                                            </div>
                                                            
                                                            
                                                            <!-- 가격 -->
                                                            <p class="ps-product__price sale">${reviewItem.item_price } <del>${reviewItem.item_price } </del></p>
                                                        </div>
                                                        <div class="ps-product__content hover"><a class="ps-product__title" href="product-default.html">${reviewItem.item_name }</a>
                                                            <p class="ps-product__price sale">${reviewItem.item_price } <del>${reviewItem.item_price } </del></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 상품 1개당 끝 -->
                                             </c:forEach>	
                                        </div>
                                    </div>
                                 </div>     
                               </div>     
                             </div>                          
                           
<!-- --------------------------------------낮은 가격순 (낮은 가격순 페이징 필요)----------------------------------------------------- -->
                                   
                        <div class="ps-shopping ps-tab-root" id="cheapSnackList">
                            <div class="ps-tabs">
                                <div class="ps-tab active" id="tab-1">
                                    <div class="ps-shopping-product">
                                        <div class="row">
                                        
                                        	<!-- 반복문 시작 -->
                                        	<c:forEach var="cheapItem" items="${cheapItemList }">
                                        	<!-- 상품 1개당 시작 -->
                                            <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-6 ">
                                                <div class="ps-product">
                                                    <div class="ps-product__thumbnail">
                                                    	
                                                    	
                                                    	<!-- 상품 이미지 -->
                                                    	<a href="ItemDetail.bo?item_idx=${cheapItem.item_idx }">
                                                    		<img src="/Code_Green/resources/img/item/${cheapItem.file1 }" alt="" />
                                                    	</a>
                                                        <ul class="ps-product__actions">
                                                        	
                                                        	
                                                        	<!-- 장바구니 및 찜 -->
                                                        	<!-- 
                                                        	* 장바구니 페이지로 이동
                                                        	* 찜 페이지로 이동
                                                        	 -->
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    
                                                    
                                                    <!-- 브랜드명 및 상품명 -->
                                                    <!-- 
                                                    * 브랜드명은 서브쿼리 사용하여 불러오기
                                                     -->
                                                    <div class="ps-product__container"><a class="ps-product__vendor" href="#">${cheapItem.manager_brandname }</a>
                                                        <div class="ps-product__content"><a class="ps-product__title" href="product-default.html">${cheapItem.item_name }</a>
                                                            
                                                            <!-- 별점 -->
                                                            <!-- 
                                                            *별점 카운트 하기
                                                             -->
                                                            <div class="ps-product__rating">
                                                                <select class="ps-rating" data-read-only="true">
                                                                    <option value="1">1</option>
                                                                    <option value="1">2</option>
                                                                    <option value="1">3</option>
                                                                    <option value="1">4</option>
                                                                    <option value="2">5</option>
                                                                </select><span>${cheapItem.board_star_score }</span>
                                                            </div>
                                                            
                                                            
                                                            <!-- 가격 -->
                                                            <p class="ps-product__price sale">${cheapItem.item_price } <del>${cheapItem.item_price } </del></p>
                                                        </div>
                                                        <div class="ps-product__content hover"><a class="ps-product__title" href="product-default.html">${cheapItem.item_name }</a>
                                                            <p class="ps-product__price sale">${cheapItem.item_price } <del>${cheapItem.item_price } </del></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 상품 1개당 끝 -->
                                             </c:forEach>	
                                        </div>
                                    </div>
                                 </div>     
                               </div>     
                             </div>
                             
<!-- -------------------------------------높은 가격순 (높은 가격순 페이징 필요)----------------------------------------------------- -->
                                   
                        <div class="ps-shopping ps-tab-root" id="expensiveSnackList">
                            <div class="ps-tabs">
                                <div class="ps-tab active" id="tab-1">
                                    <div class="ps-shopping-product">
                                        <div class="row">
                                        
                                        	<!-- 반복문 시작 -->
                                        	<c:forEach var="expensiveItem" items="${expensiveItemList }">
                                        	<!-- 상품 1개당 시작 -->
                                            <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-6 ">
                                                <div class="ps-product">
                                                    <div class="ps-product__thumbnail">
                                                    	
                                                    	
                                                    	<!-- 상품 이미지 -->
                                                    	<a href="ItemDetail.bo?item_idx=${expensiveItem.item_idx }">
                                                    		<img src="/Code_Green/resources/img/item/${expensiveItem.file1 }" alt="" />
                                                    	</a>
                                                        <ul class="ps-product__actions">
                                                        	
                                                        	
                                                        	<!-- 장바구니 및 찜 -->
                                                        	<!-- 
                                                        	* 장바구니 페이지로 이동
                                                        	* 찜 페이지로 이동
                                                        	 -->
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    
                                                    
                                                    <!-- 브랜드명 및 상품명 -->
                                                    <!-- 
                                                    * 브랜드명은 서브쿼리 사용하여 불러오기
                                                     -->
                                                    <div class="ps-product__container"><a class="ps-product__vendor" href="#">${expensiveItem.manager_brandname }</a>
                                                        <div class="ps-product__content"><a class="ps-product__title" href="product-default.html">${expensiveItem.item_name }</a>
                                                            
                                                            <!-- 별점 -->
                                                            <!-- 
                                                            *별점 카운트 하기
                                                             -->
                                                            <div class="ps-product__rating">
                                                                <select class="ps-rating" data-read-only="true">
                                                                    <option value="1">1</option>
                                                                    <option value="1">2</option>
                                                                    <option value="1">3</option>
                                                                    <option value="1">4</option>
                                                                    <option value="2">5</option>
                                                                </select><span>${expensiveItem.board_star_score }</span>
                                                            </div>
                                                            
                                                            
                                                            <!-- 가격 -->
                                                            <p class="ps-product__price sale">${expensiveItem.item_price } <del>${expensiveItem.item_price } </del></p>
                                                        </div>
                                                        <div class="ps-product__content hover"><a class="ps-product__title" href="product-default.html">${expensiveItem.item_name }</a>
                                                            <p class="ps-product__price sale">${expensiveItem.item_price } <del>${expensiveItem.item_price } </del></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 상품 1개당 끝 -->
                                             </c:forEach>	
                                        </div>
                                    </div>
                                 </div>     
                               </div>     
                             </div>
                                      

                   
                            <!-- 페이징 버튼들 시작 -->
		   		 			<%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
		                    <div class="ps-pagination">
		                        <ul class="pagination">
		                           
		                            <li><%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%><a href="category_snack?pageNum=${pageInfo.pageNum - 1}&searchType=${searchType }&keyword=${keyword}&sort=${sort}"><%}%><i class="icon-chevron-left"></i>Prev</a></li>
		                            <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
		                            	<c:choose>
		                            		<c:when test="${i eq pageInfo.pageNum }"><li class="active"><a href="#">${i }</a></li></c:when>
		                            		<c:otherwise><li><a href="category_snack?pageNum=${i }&searchType=${searchType }&keyword=${keyword}&sort=${sort}">${i }</a></li></c:otherwise>
		                            	</c:choose>
		                            </c:forEach>
		                            <li><%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%><a href="category_snack?pageNum=${pageInfo.pageNum + 1}&searchType=${searchType }&keyword=${keyword}&sort=${sort}"><%}%>Next<i class="icon-chevron-right"></i></a></li>
		                        </ul>
		                    </div>
		                    <!-- 페이징 버튼들 끝 -->
                                
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