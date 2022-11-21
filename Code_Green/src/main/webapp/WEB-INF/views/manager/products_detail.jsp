<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="apple-touch-icon.png" rel="apple-touch-icon">
    <link href="favicon.png" rel="icon">
    <title>상품상세페이지</title>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/summernote/summernote-bs4.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/apexcharts-bundle/dist/apexcharts.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_manager.css">
<!-- 글쓰기  API -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- 글쓰기  API -->
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!-- 글쓰기  API -->

</head>
<body>
    <header class="header--mobile">
        <div class="header__left">
            <button class="ps-drawer-toggle"><i class="icon icon-menu"></i></button><img src="" alt="">
        </div>
        <div class="header__center"><a class="ps-logo" href="#"><img src="img/logo.png" alt=""></a></div>
        <div class="header__right"><a class="header__site-link" href="#"><i class="icon-exit-right"></i></a></div>
    </header>
    <aside class="ps-drawer--mobile">
        <div class="ps-drawer__header">
            <h4> Menu</h4>
            <button class="ps-drawer__close"><i class="icon icon-cross"></i></button>
        </div>
        <div class="ps-drawer__content">
            <ul class="menu">
                 				<li><a class="active" href="manager_index"><i class="icon-home"></i>관리자메인페이지</a></li>
				                <li><a href="products?manager_id=${sessionScope.sId }"><i class="icon-database"></i>상품관리</a></li>
				                <li><a href="inventory_management"><i class="icon-database"></i>재고관리</a></li>
				                <li><a href="orders"><i class="icon-bag2"></i>주문관리</a></li>
				                <li><a href="sales_main"><i class="icon-papers"></i>매출관리</a></li>
				                <li><a href="qnaboard_list"><i class="icon-users2"></i>답변관리</a></li>
				                <li><a href="follower_list"><i class="icon-users2"></i>팔로우목록</a></li>
				                <li><a href="sales_management"><i class="icon-percent-circle"></i>정산</a></li>
								<li><a href="brand_mypage?id=${sessionScope.sId }"><i class="icon-cog"></i>내브랜드정보</a></li>
<!-- 				                <li><a href="brand_settings"><i class="icon-cog"></i>브랜드정보수정</a></li> -->
            </ul>
        </div>
    </aside>
    <div class="ps-site-overlay"></div>
    <main class="ps-main">
        <div class="ps-main__sidebar">
            <div class="ps-sidebar">
                <div class="ps-sidebar__top">
                    <div class="ps-block--user-wellcome">
                        <div class="ps-block__left"><img src="img/user/admin.jpg" alt="" /></div>
                        <div class="ps-block__right">
                            <h4><strong>${sessionScope.sId }</strong> 님 환영합니다</h4>
                        </div>
                        <div class="ps-block__action"><a href="#"><i class="icon-exit"></i></a></div>
                    </div>
                    <div class="ps-block--earning-count"><small>수익</small>
                        <h3>$12,560.55</h3>
                    </div>
                </div>
                <div class="ps-sidebar__content">
                    <div class="ps-sidebar__center">
                        <ul class="menu">
                            	<li><a class="active" href="manager_index"><i class="icon-home"></i>관리자메인페이지</a></li>
				                <li><a href="products?manager_id=${sessionScope.sId }"><i class="icon-database"></i>상품관리</a></li>
				                <li><a href="inventory_management"><i class="icon-database"></i>재고관리</a></li>
				                <li><a href="orders"><i class="icon-bag2"></i>주문관리</a></li>
				                <li><a href="sales_main"><i class="icon-papers"></i>매출관리</a></li>
				                <li><a href="qnaboard_list"><i class="icon-users2"></i>답변관리</a></li>
				                <li><a href="follower_list"><i class="icon-users2"></i>팔로우목록</a></li>
				                <li><a href="sales_management"><i class="icon-percent-circle"></i>정산</a></li>
								<li><a href="brand_mypage?id=${sessionScope.sId }"><i class="icon-cog"></i>내브랜드정보</a></li>
<!-- 				                <li><a href="brand_settings"><i class="icon-cog"></i>브랜드정보수정</a></li> -->
	                     </ul>
                    </div>
                    <div class="ps-sidebar__footer">
                        <div class="ps-copyright"><img src="img/logo.png" alt="">
                            <p>&copy;2020 Marfury marketplace. <br/> All rights reversed.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ps-main__wrapper">
            <header class="header--dashboard">
                <div class="header__left">
                    <h3>상품조회</h3>
                </div>
<!--                 <div class="header__center"> -->
<!--                     <form class="ps-form--search-bar" action="index method="get"> -->
<!--                         <input class="form-control" type="text" placeholder="Search something" /> -->
<!--                         <button><i class="icon-magnifier"></i></button> -->
<!--                     </form> -->
<!--                 </div> -->
                <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 이동</span><i class="icon-exit-right"></i></a></div>
            </header>

 		<div class="ps-main__wrapper">
  		<div class="header__center">
  		<form class="ps-form--search-bar" action="manager/index" method="get">

 
       <table class="table ps-table">
              
                    <h2>상품상세보기</h2>
                    <hr>
                       <thead>
                                <tr>
                                	<th>상품번호</th>
                                	<th>상품명</th>
                                    <th>상품소개</th>
                                   	<th>재고</th>
                                    <th>가격</th>
                                     <th>상품분류</th>
                                     <th>포장분류</th>
                                    <th>등록일</th>
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                      <th>상품썸네일</th> -->
<!--                                      <th>상품상세이미지</th> -->
                                </tr>
                            </thead>
                            <tbody>
                                
                            
                                <tr>
                                	<td>${ItemInfo.item_idx }</td>
                                	<td>${ItemInfo.item_name }</td>
                                    <td>${ItemInfo.item_info }</td>
                                    <td>${ItemInfo.item_stock }</td>
                                    <td>${ItemInfo.item_price }</td>
                                    <td>${ItemInfo.item_category }</td>
                                    <td>${ItemInfo.item_packing }</td>
                                    <td>${ItemInfo.item_date}</td>
                                 </tr> 

                    </tbody>
                    </table>
                    </form>
					</div>
					</div>       
                                	

                                	
 				
 				<table class="table ps-table">
                       <thead>
                                <tr>
                                	<th>상품썸네일</th>
                                	<th>상품상세이미지</th>
                                </tr>
           <table class="item_image"id="itemImage">
         		<div class="ps-form__submit text-center">
                  <br>
                   	<tr>
                      <td><div class="card" style="width: 18rem;"></div></td><td><td><div class="card" style="width: 18rem;"></div></td>
                    </tr>
                </div>
			<!-------------등록된 상품이미지 ------------>
	<c:forEach var="item" items="${itemList}" >
					  <tr>
					    <td><img alt="${item.file1}" src="/Code_Green/resources/img/item/${file_item.file1 }"/></td><td><img alt="${file_item.file2}" src="/Code_Green/resources/img/item/${item.file2 }" /></td>
						<td><h5 class="card-title">${ItemInfo.item_name }</h5></td><td><h5 class="card-title">${ItemInfo.item_name }</h5></td>
					  <tr>
					</c:forEach>
						</tbody>
						</table>
					
											
			<!-------------등록된 상품이미지 ------------>
                            
                            
                    <center>  
                          <button class="ps-btn success"> <a href="product_modify">상품수정</a></button>
                         <button class="ps-btn ps-btn--gray mr-3"><a href="products"> 취소</a></button>
                    </thead>
                    </table>
                    </div>
                    </center>
                    

       
    </main>
    <script src="/Code_Green/resources/plugins_manager/jquery.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/popper.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/bootstrap/js/bootstrap.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/jquery.matchHeight-min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/select2/dist/js/select2.full.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/summernote/summernote-bs4.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/apexcharts-bundle/dist/apexcharts.min.js"></script>
    <script src="/Code_Green/resources/js/main_manager.js"></script>
</body>

</html>