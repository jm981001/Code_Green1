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
                            <li class="active" data-filter="*">비건</li>
                            <li data-filter=".mostpopular">인기레시피</li>
                            <li data-filter=".meatlover">샐러드</li>
                            <li data-filter=".glutenfree">글루텐X</li>
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
                <div class="cf-item mix all meatlover glutenfree">
                    <div class="cf-item-pic">
                        <img src="/Code_Green/resources/img/recipe/cate-feature/cate-filter-5.jpg" alt="" onclick="location.href='recipe_detail'">
                    </div>
                    <div class="cf-item-text">
                        <h5>제목</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!------------------------------------상단 카테고리---------------------------------------------------->



<!-------------------------------------------form 태그 시작 ----------------------------------->
		<form action="recipe_detail" method="get">

			<c:forEach var="board" items="${RecipeList }">

				<div class="container">
					<div class="row">
						<div class="col-lg-4 col-sm-6">
							<div class="recipe-item">
								<a href="recipe_detail"><img
									src="/Code_Green/resources/img/recipe/recipe-1.jpg"
									onclick="location.href='recipe_detail?board_idx=${board.board_idx }&pageNum=${pageInfo.pageNum}'"></a>
								<div class="ri-text">
									<h4></h4>
									<p>${board.board_id }${board.board_subject }</p>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-sm-6">
							<div class="recipe-item">
								<a href="recipe_detail"><img
									src="/Code_Green/resources/img/recipe/recipe-2.jpg" alt=""
									onclick="location.href='recipe_detail'"></a>
								<div class="ri-text">
									<a href="recipe_detail">
										<h4>레시피 제목</h4>
									</a>
									<p>작성자,조회수,좋아요수,짧은소개?</p>
								</div>
							</div>
						</div>
					</div>
					
					<!--페이징 -->
					<div class="recipe-pagination">
						<a href="#" class="active">01</a> <a href="#">02</a> <a href="#">03</a>
						<a href="#">04</a> <a href="#">Next</a> <input type="button"
							value="작성" id="recipe-write"
							onclick="location.href='recipe_formPro'">
					</div>
				</div>
			</c:forEach>
		</form>
		<div>
			<form action="recipe_main" method="get">
			<select name="searchType">
				<option value="subject">제목</option>
				<option value="content">내용</option>
				<option value="subject_content">제목&내용</option>
				<option value="name">작성자</option>
			</select>
			<input type="text" name="keyword"><input type="submit" value="검색">
		</form>
		
		</div>
	</section>
<!-------------------------------------------form 태그 끝 ----------------------------------->
	
	
	<!---------------검색-------------------->
		






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