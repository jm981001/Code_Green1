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
	
		goWholeList();
		
		if(${sessionScope.sId == null}){
			$(".brandfollowbtn").hide();
		} else {
			$(".brandfollowbtn").show();
		}
	}
	
	function goWholeList(){
		$.ajax({
			url:"GetWholeItemList.br",
			type:"post",
			success:function(data){
				$(".ps-section__wrapper").html(data);
			}
		});
	}
	
	
	function goBrandList(manager_idx){
		$.ajax({
			url:"GetBrandItemList.br",
			type:"post",
			data: {
				manager_idx: manager_idx
			},
			success:function(data){
				$(".ps-section__wrapper").html(data);
			}
		});
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
               			<li class="brandlist-li"><a href="#" onclick="goWholeList()"><strong>전체보기</strong></a></li>
	                	<c:forEach var="brand" items="${brandList }">
               			<li class="brandlist-li"><a href="#" onclick="goBrandList('${brand.manager_idx}')">${brand.manager_brandname }</a></li>
               			</c:forEach>
                	</ul>
                </div>
                
       <!-- ============================================================ 브랜드리스트 박스공간 끝 ====================================================================== -->         
              <div class="ps-section__wrapper"></div>
                  
	

    
                   
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