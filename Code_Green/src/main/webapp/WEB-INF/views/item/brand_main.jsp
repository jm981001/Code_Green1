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
    <link rel="icon" href="/Code_Green/resources/img/favicon.png">
	<title>브랜드별 - 베지터틀</title>
	<script src="/Code_Green/resources/plugins/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/slick/slick/slick.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/lightGallery-master/dist/css/lightgallery.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/autopart.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/vendor.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
</head>
<style>
	.heart_icon_brand_m {
		width: 25px;
	    height: 25px;
	    position: absolute;
	    top: 19px;
	    left: 154px;
	}

	.heart_icon_brand_b {
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
	
	.append_here{
		display: flex;
	    flex-direction: row;
	    flex-wrap: wrap;
	    justify-content: space-around;
	    padding-bottom: 10px;
	
	}
</style>
<script>
	let pageNum = 1;

	// 입점브랜드 목록 토글버튼 
	function togglefun(text){
		var target = document.querySelector('#listlist');
		if(this.value==='입점브랜드 ▲'){
			target.style.display = 'none';
			this.value = '입점브랜드 ▼';
		} else {
			target.style.display = 'block';
			this.value = '입점브랜드 ▲';
		}
	}
	
	// '브랜드별' 메뉴클릭> 페이지로딩시 첫화면
	$(function(){
		console.log("onload");
		goWholeList();
		
		$(window).scroll(function() {
			let scrollTop = $(window).scrollTop(); // 스크롤바의 현재 위치
			let windowHeight = $(window).height(); // 문서가 표시되는 창의 높이
			let documentHeight = $(document).height(); // 문서 전체 높이
			if(scrollTop + windowHeight + 1 >= documentHeight) {
				pageNum++;
				goWholeList();
			}
		});
	});
	
	// 브랜드별 전체브랜드 아이템 출력 
	function goWholeList(){
		console.log("goWholeList");
		$.ajax({
			url:"GetWholeItemList.br?pageNum=" + pageNum,
			type:"get",
			success:function(data){
				$(".append_here").append(data);
			}
		});
	}
	
	// 브랜드별 개별브랜드 아이템 출력 
	function goBrandList(manager_idx){
		$.ajax({
			url:"GetBrandItemList.br?pageNum=&manager_idx=" + manager_idx,
			type:"get",
			success:function(data){
				$(".ps-section__wrapper").html(data);
			}
		});
	};

	// 팔로우 버튼 클릭시 회원비회원 구분 & 브랜드 구분
	function followCheck(manager_idx){
		console.log("팔로우버튼클릭 브랜드번호 : " + manager_idx);
		if(${sessionScope.sId == null}){
			alert("로그인 후 사용가능합니다!");
			
		}else if(manager_idx == '0'){
			alert("원하는 브랜드를 상단박스에서 선택해주세요!");
			
		}else {
			$.ajax({
				url:"followBrandCheck.me",
				type:"post",
				data:{
					manager_idx : manager_idx,
					member_idx : '${sessionScope.sIdx}'
				},
				success: function(result){
					
					if(result>1){
						$(".heart_icon_brand2 img").attr("src", "/Code_Green/resources/img/forzero/eheart.png");
						alert("팔로우가 취소되었습니다.");
						
					} else {
						$(".heart_icon_brand2 img").attr("src", "/Code_Green/resources/img/forzero/fheart.png");
						alert("팔로우가 성공적으로 되었습니다!");
					}
				}
			})
		}
	};
	
	// 회원의 클릭한 브랜드 팔로우 유무 체크 후 하트상태띄우기
	function followOrNotCheck(manager_idx){
		console.log("팔로우유무 브랜드번호 : " + manager_idx);
		if(${sessionScope.sId != null }){
			$.ajax({
				url:"FollowCheck.me",
				type:"post",
				data:{
					manager_idx : manager_idx,
					member_idx : '${sessionScope.sIdx}'
				},
				success: function(status){
					if(status>0){
						$(".heart_icon_brand2 img").attr("src","/Code_Green/resources/img/forzero/fheart.png");
					} else {
						$(".heart_icon_brand2 img").attr("src", "/Code_Green/resources/img/forzero/eheart.png");
					}
				}
			})
		};
	};
	
	
</script>
<body>
    
    
    <!-- 헤더 삽입 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 삽입 -->
    
    
    
    <div class="ps-page--single ps-page--vendor">
    <!-- ============================================================ 브랜드리스트 박스공간 시작 ====================================================================== -->         
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
               			<li class="brandlist-li"><a href="#" onclick="goBrandList('${brand.manager_idx}');return false;">${brand.manager_brandname }</a></li>
               			</c:forEach>
                	</ul>
                </div>
                
       <!-- ============================================================ 브랜드리스트 박스공간 끝 ====================================================================== -->         
              <div class="ps-section__wrapper">
					           
             <div class="ps-section__left">
                  <aside class="widget widget--vendor">
                            <h3 class="widget-title" id="brandNameBar">브랜드별 상품</h3>
                            <div class="brandfollowbtn">
	                            <img src="/Code_Green/resources/img/forzero/eheart.png" class="heart_icon_brand_m">
								<%--  팔로확인 할때 ${brandItemList.manager_idx }, ${sessionScope.sId} 가져가야함 --%>
	                            <a class="ps-block__inquiry" href="#" onclick="followCheck(0); return false;">Follow</a>
                            </div>
                            <div class="ps-block__user" >
		                     	<div class="ps-block__user-avatar">
		                     	<!-- 브랜드별 로고띄우기 -->
	                     		   <img src="<%=request.getContextPath() %>/resources/img/winkya.jpg">
		                           <div class="brand_info">
		                           		브랜드별 상품을<br>
		                           		편리하게 둘러보세요!<br><br>
		                           		<small>상단의 원하는 브랜드명을 선택하거나,<br>
		                           		하단의 원하는 브랜드만 <br>선택하여 보실 수 있습니다:)</small>
		                           </div>
		                    	</div>
		                    </div>
	<!-- =========================================== 사이드바 시작 ======================================================== -->

					<aside class="widget widget_shop">
		                <h4 class="widget-title">BY BRANDS</h4>
		                <figure class="ps-custom-scrollbar" data-height="250">
		                  <c:forEach var="brand" items="${brandList }" >
		                  <!-- 체크박스 -->
		                    <div class="ps-checkbox">
		                        <input class="form-control" type="checkbox" id="m-brand-${brand.manager_idx }" name="${brand.manager_idx }" />
		                        <label for="m-brand-${brand.manager_idx }">${brand.manager_brandname } 
		                        <c:choose>
		                        	<c:when test="${not empty brand.brand_itemCnt }">
		                        	(${brand.brand_itemCnt })</label></c:when>
		                        	<c:otherwise>(0)</label></c:otherwise>
		                     	</c:choose>
		                    </div>
		                   </c:forEach>
		                </figure>
					</aside>
 	<!-- =========================================== 사이드바 끝======================================================== -->	
					
                 </aside>
             </div>
         			<div class="ps-section__right">
           
          <!-- 상품리스트 헤더  -->
                    
                        <div class="ps-shopping ps-tab-root">
                            <div class="ps-shopping__header">
                                <p><strong> 전체상품 </strong></p>
                               <div id="orderbylist"><a href="#">최근순</a>  |  <a href="#">판매량순</a></div>
                            </div>
           <!-- =========================================== 상품리스트 시작=====================================================-->
           <!-- ===================================== 상품 1개당 ================================================== --> 
                    <div class="ps-tabs">
                        <div class="ps-tab active" id="tab-1">
                            <div class="ps-shopping-product">
                                <div class="row">
                                
                                    <div class="append_here"></div>
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