<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

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
	<script type="text/javascript" src="/Code_Green/resources/js/jquery-3.6.1.js"> </script>
	
	<script type="text/javascript">
		function recipe_modify_auth() {
			if(${sessionScope.sId == "admin" || sessionScope.sId == recipe.board_id}){
				location.href="recipe_modify.bo?board_idx=" + ${recipe.board_idx} + "&id=" + "${sessionScope.sId}";
			} else {
				alert("수정 권한이 없습니다.");
			}
				
		}
	</script>
	
	<script type="text/javascript">
		function recipe_delete_auth() {
			if(${sessionScope.sId == "admin" || sessionScope.sId == recipe.board_id}){
// 				location.href="recipe_delete.bo?board_idx=" + ${recipe.board_idx};
					confirm("삭제하시겠습니까? 삭제하면 복구가 불가능합니다.");
				
					$.ajax({
						url: "recipe_deletePro.bo",
						type: "POST",
						data: {
							board_idx: ${recipe.board_idx}
						},
						success: function(){
							alert("삭제가 완료되었습니다.");
							location.href = "recipe_main.bo";
						},
						fail: function () {
							alert("삭제가 실패되었습니다. 다시 시도해 주세요.");
						}
					});
				
			} else {
				alert("삭제 권한이 없습니다.");
			}
				
		}
	</script>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- 헤더 -->
     <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 끝 -->

    
    
<!-------------------------------------------- 레시피 시작---------------------------------------->
    <section class="single-page-recipe spad" style="margin-top: 200px;">
        <div class="recipe-top">
            <div class="container-fluid">
                <div class="recipe-title"> <!-- 타이틀 -->
                    <h2>${recipe.board_subject }</h2>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-5">
                    <div class="ingredients-item">
                        <div class="intro-item">
                            <img src="/Code_Green/resources/recUpload/${recipe.file1 }" alt="">
                       		<div class="ps-form--quick-search--com">
						       	<button onclick="recipe_modify_auth()">글 수정</button>
						       	<button onclick="recipe_delete_auth()">글 삭제</button>
						   </div>
                        </div>
                        <div class="ingredient-list">
                            <div class="list-item">
                            	${recipe.manager_brandname }<br>
                            	${recipe.board_content }
                            	
                            	
			                        <div class="ps-page__left"  style="margin-top: 100px;">
			                        <h5>사용한 상품</h5>
			                        <div class="widget__content">
			                         <div class="ps-product">
			                            <div class="ps-product__thumbnail">
			                            	<a href="ItemDetail.bo?item_idx=${use_item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${use_item.manager_brandname}&item_category=${use_item.item_category}">
			                            		<img  src="/Code_Green/resources/item/${use_item.file1 }" alt="" style="height: 300px;">
			                            	</a>
			                                <ul class="ps-product__actions">
			                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
			                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
			                                </ul>
			                            </div>
			                            <div class="ps-product__container"><a class="ps-product__vendor" >${use_item.manager_brandname }</a>
			                                <div class="ps-product__content">${use_item.item_name }
			                                   <h4 class="ps-product__price">${use_item.item_price }원</h4>
			                                </div>
			                                <div class="ps-product__content hover">${use_item.item_name }
			                                     <h4 class="ps-product__price">${use_item.item_price }원</h4>
			                                </div>
			                            </div>
			                        </div>
			                        </div>
			                     </div>
			                	</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                    <div class="recipe-right">
                        <div class="instruction-list">
                        	<img src="/Code_Green/resources/recUpload/${recipe.file2 }" alt="">
                        </div>
                    </div>
                </div>
                </div>
                
            </div>
    </section>
 <!-------------------------------------------- 레시피 끝---------------------------------------->


    <!-- 푸터 시작 -->
     <jsp:include page="../inc/footer.jsp"></jsp:include>
    
    <!-- 푸터 끝 -->
    <!-- Js Plugins -->
    <script src="/Code_Green/resources/js/jquery-3.3.1.min.js"></script>
    <script src="/Code_Green/resources/js/bootstrap.min.js"></script>
    <script src="/Code_Green/resources/js/jquery.slicknav.js"></script>
    <script src="/Code_Green/resources/js/jquery.nice-select.min.js"></script>
    <script src="/Code_Green/resources/js/mixitup.min.js"></script>
    <script src="/Code_Green/resources/js/main_recipe.js"></script>
</body>

</html>