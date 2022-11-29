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
    <link rel="icon" href="/Code_Green/resources/img/favicon.png">
    <link href="favicon.png" rel="icon">
    <title>상품삭제페이지-베지터틀</title>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/summernote/summernote-bs4.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/apexcharts-bundle/dist/apexcharts.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_manager.css">
 
 <script type="text/javascript" src="/Code_Green/resources/js/jquery-3.6.1.js"> </script>
    <script type="text/javascript">
       function product_delete(value) {
            
          let delete_confirm = confirm('삭제하시겠습니까? 삭제하면 복구가 불가능합니다.');
          
          if(delete_confirm){
             $.ajax({
               url: "product_delete",
               type: "GET",
               data: {
                  board_idx: value
               },
               success: function(){
                  alert("삭제가 완료되었습니다.");
                  location.href = "products";
               },
               fail: function () {
                  alert("삭제가 실패되었습니다. 다시 시도해 주세요.");
               }
            });
          } 
      }
    </script>
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
                 				<li><a href="ManagerInfo.me?manager_id=${sessionScope.sId }"><i class="icon-home"></i>관리자메인페이지</a></li>
				                <li><a class="active" href="products?manager_id=${sessionScope.sId }"><i class="icon-database"></i>상품관리</a></li>
				                <li><a href="orders?manager_id=${sessionScope.sId }"><i class="icon-bag2"></i>주문관리</a></li>
				                <li><a href="sales_main?manager_id=${sessionScope.sId }"><i class="icon-papers"></i>매출관리</a></li>
				                <li><a href="qnaboard_list?manager_id=${sessionScope.sId }"><i class="icon-users2"></i>답변관리</a></li>
				                <li><a href="recipeboard_list?manager_id=${sessionScope.sId }"><i class="icon-users2"></i>레시피관리</a></li>
				                <li><a href="sales_management?manager_id=${sessionScope.sId }"><i class="icon-percent-circle"></i>정산</a></li>
								<li><a href="brand_mypage?manager_id=${sessionScope.sId }"><i class="icon-cog"></i>내브랜드정보</a></li>
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
                    <div class="ps-block--earning-count"><small></small>
<!--                         <h3>$12,560.55</h3> -->
                    </div>
                </div>
                <div class="ps-sidebar__content">
                    <div class="ps-sidebar__center">
                        <ul class="menu">
                            	<li><a href="ManagerInfo.me?manager_id=${sessionScope.sId }"><i class="icon-home"></i>관리자메인페이지</a></li>
				                <li><a class="active" href="products?manager_id=${sessionScope.sId }"><i class="icon-database"></i>상품관리</a></li>
				                <li><a href="orders?manager_id=${sessionScope.sId }"><i class="icon-bag2"></i>주문관리</a></li>
				                <li><a href="sales_main?manager_id=${sessionScope.sId }"><i class="icon-papers"></i>매출관리</a></li>
				                <li><a href="qnaboard_list?manager_id=${sessionScope.sId }"><i class="icon-users2"></i>답변관리</a></li>
				                <li><a href="recipeboard_list?manager_id=${sessionScope.sId }"><i class="icon-users2"></i>레시피관리</a></li>
				                <li><a href="sales_management?manager_id=${sessionScope.sId }"><i class="icon-percent-circle"></i>정산</a></li>
								<li><a href="brand_mypage?manager_id=${sessionScope.sId }"><i class="icon-cog"></i>내브랜드정보</a></li>
	                     
	                     </ul>
                    </div>
                    <div class="ps-sidebar__footer">
                        <div class="ps-copyright"><img src="img/logo.png" alt="">
                            <p>&copy;2022 CODEGREEN marketplace. <br/> All rights reversed.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ps-main__wrapper">
            <header class="header--dashboard">
                <div class="header__left">
                    <h3>상품관리</h3>
                </div>
                <div class="header__center">
                    <form class="ps-form--search-bar" action="product_deletePro.bo method="get">
                        <input class="form-control" type="text" placeholder="Search something" />
                        <button><i class="icon-magnifier"></i></button>
                    </form>
                </div>
                <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 이동</span><i class="icon-exit-right"></i></a></div>
            </header>

 		<div class="ps-main__wrapper">
  		<div class="header__center">
  		<form class="ps-form--search-bar" action="index.html" method="get">

 
       <table class="table ps-table">
              
                    <h2>상품 관리</h2>
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
				<!-- ---게시판글쓰기api -->
                <textarea id="summernote" name="editordata"></textarea>
                <!-- ---게시판글쓰기api -->
                
                     <div class="ps-form__submit text-center">
                     	<br>
                          <button class="ps-btn ps-btn--gray mr-3">취소</button>
                          <button class="ps-btn success">삭제</button>
                    </div>

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