<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Yoga Studio Template">
    <meta name="keywords" content="Yoga, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>레시피</title>
	<style type="text/css">
	.no-js .owl-carousel, .owl-carousel.owl-loaded {
		display: block;
	}
	</style>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=PT+Sans:400,700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
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
	<link rel="stylesheet" href="/Code_Green/resources/plugins/nouislider/nouislider.min.css">
	<link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
	<link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
	<link rel="stylesheet" href="/Code_Green/resources/css/recipe_style.css" type="text/css">
	
	<script type="text/javascript">
		function recipe_write_auth() {
			if(${sessionScope.sCode != null || sessionScope.sId == "admin"}){
				location.href="recipe_write.bo?id=" + "${sessionScope.sId }";
			} else {
				alert("작성 권한이 없습니다.");
			}
				
		}
	
	</script>
	
	<style type="text/css">
		#recipeSearchBtn{
			border-style: none; 
			height: 41px; 
			background: #5FA30F; 
			color: white; 
			border-radius: 4px;
		}
		
		#recipeSearchInput{
			height: 41px; 
			border: 1px solid silver;
		}
	
	
		.cf-filter{
			margin-bottom: 70px;
		}
	</style>
</head>

<body>

    <!-- 헤더 시작 -->
     <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 끝 -->

	<div class="ps-page--single">
        <div class="ps-breadcrumb">
            <div class="container">
                <ul class="breadcrumb">
                    <li><a href="/Code_Green">Home</a></li>
                    <li><a href="recipe_main">레시피</a></li>
                </ul>
            </div>
        </div>
    </div>

	<div class="ps-vendor-dashboard">
		 <div class="container">
			<div class="ps-section__header">
		       <h3>Recipe</h3>
		    </div>
		</div>
	</div>
	
	
<!--------------------------------------------상단 태그 ---------------------------------------------------->
    <section class="recipe-section spad">
        <div class="categories-filter-section spad">
          <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="filter-item">
                        <ul>
                            <li class="active" data-filter="*">과일 / 채소</li>
                            <li data-filter=".mostpopular">유제품 / 음료</li>
                            <li data-filter=".meatlover">냉동 / 간편식품</li>
                            <li data-filter=".glutenfree">해산물</li>
                            <li data-filter=".glutenfree2">간식류</li>
                        </ul>
                    </div>
                </div>
            </div>
            
            
            
<!------------------------------------상단 카테고리---------------------------------------------------->
            <div class="cf-filter" id="category-filter">
                <div class="cf-item mix all mostpopular">
                    <div class="cf-item-pic">
                        <img src="/Code_Green/resources/img/recipe/cate-feature/cate-filter-1.jpg" alt="" onclick="location.href='recipe_detail'">
                    </div>
                    <div class="cf-item-text">
                        <h5>제목</h5>
                    </div>
                </div>
                <div class="cf-item mix all mostpopular">
                    <div class="cf-item-pic">
                        <img src="/Code_Green/resources/img/recipe/cate-feature/cate-filter-2.jpg" alt="" onclick="location.href='recipe_detail'">
                    </div>
                    <div class="cf-item-text">
                        <h5>제목</h5>
                    </div>
                </div>
                <div class="cf-item mix all meatlover mostpopular">
                    <div class="cf-item-pic">
                        <img src="/Code_Green/resources/img/recipe/cate-feature/cate-filter-3.jpg" alt="" onclick="location.href='recipe_detail'">
                    </div>
                    <div class="cf-item-text">
                        <h5>제목</h5>
                    </div>
                </div>
                <div class="cf-item mix all meatlover">
                    <div class="cf-item-pic glutenfree">
                        <img src="/Code_Green/resources/img/recipe/cate-feature/cate-filter-4.jpg" alt="" onclick="location.href='recipe_detail'">
                    </div>
                    <div class="cf-item-text">
                        <h5>제목</h5>
                    </div>
                </div>
                <div class="cf-item mix all meatlover glutenfree2">
                    <div class="cf-item-pic">
                        <img src="/Code_Green/resources/img/recipe/cate-feature/cate-filter-5.jpg" alt="" onclick="location.href='recipe_detail'">
                    </div>
                    <div class="cf-item-text">
                        <h5>제목</h5>
                    </div>
                </div>
            </div>
            <div>
	            <div class="ps-form--quick-search--com" align="left" style="margin-bottom: 70px;">
		            <div style="float: left">
			            <form action="recipe_main.bo" method="get">
							<input type="text" name="keyword" id="recipeSearchInput">
							<input type="submit" id="recipeSearchBtn" value="검색">
						</form>
					</div>
			       	 <div style="float: right">
			       		<button onclick="recipe_write_auth()" style="float: left">글쓰기</button>
			       	</div>
			  </div>
		   </div>			
        </div>
    </div>
    
    
<!------------------------------------내용---------------------------------------------------->
		<div class="container">
            <div class="row">
          		 <c:forEach var="recipe" items="${recipeList }">
	                <div class="col-lg-4 col-sm-6">
		                    <div class="recipe-item" style="margin-bottom: 200px;">
		                        <a href="recipe_detail.bo?board_idx=${recipe.board_idx }&id=${sessionScope.sId}">
		                        	<img src="/Code_Green/resources/recUpload/${recipe.file1 }">
		                        </a>
		                        <div class="ri-text">
		                            <div class="cat-name"></div>
		                                <h4>${recipe.board_subject }</h4>
		                        </div>
		                    </div>
			            </div>
          		 </c:forEach>
				</div>
				<div>
       			
       				<!-- 페이징 버튼들 시작 -->
	                   <%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
	                    <div class="ps-pagination">
	                        <ul class="pagination">
	                            <li><%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%><a href="recipe_main.bo?pageNum=${pageInfo.pageNum - 1}"><%}%><i class="icon-chevron-left"></i>Prev</a></li>
	                            <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
	                               <c:choose>
	                                  <c:when test="${i eq pageInfo.pageNum }"><li class="active"><a href="#">${i }</a></li></c:when>
	                                  <c:otherwise><li><a class="pageLink" href="recipe_main.bo?pageNum=${i }">${i }</a></li></c:otherwise>
	                               </c:choose>
	                            </c:forEach>
	                            <li><%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%><a href="recipe_main.bo?pageNum=${pageInfo.pageNum + 1}"><%}%>Next<i class="icon-chevron-right"></i></a></li>
	                        </ul>
	                    </div>
				    <!-- 페이징 버튼들 끝 -->	
			   	</div>
		   	</div>

</section>




	<!-- 푸터 시작! -->
     <jsp:include page="../inc/footer.jsp"></jsp:include>
    <!-- 푸터 끝! -->




    <!-- Js Plugins -->
    <script src="/Code_Green/resources/js/jquery-3.3.1.min.js"></script>
    <script src="/Code_Green/resources/js/bootstrap.min.js"></script>
    <script src="/Code_Green/resources/js/jquery.slicknav.js"></script>
    <script src="/Code_Green/resources/js/jquery.nice-select.min.js"></script>
    <script src="/Code_Green/resources/js/mixitup.min.js"></script>
    <script src="/Code_Green/resources/js/main_recipe.js"></script>
    
</body>

</html>