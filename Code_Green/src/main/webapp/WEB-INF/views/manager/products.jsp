<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>

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
    <title>상품관리</title>
   <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/summernote/summernote-bs4.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/apexcharts-bundle/dist/apexcharts.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_manager.css">
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
				                <li><a href="products"><i class="icon-database"></i>상품관리</a></li>
				                <li><a href="inventory_management"><i class="icon-database"></i>재고관리</a></li>
				                <li><a href="orders"><i class="icon-bag2"></i>주문관리</a></li>
				                <li><a href="sales_main"><i class="icon-papers"></i>매출관리</a></li>
				                <li><a href="qnaboard_list"><i class="icon-users2"></i>답변관리</a></li>
				                <li><a href="follower_list"><i class="icon-users2"></i>팔로우목록</a></li>
				                <li><a href="sales_management"><i class="icon-percent-circle"></i>정산</a></li>
				                 <li><a href="brand_mypage"><i class="icon-cog"></i>내브랜드정보</a></li>
				                <li><a href="brand_settings"><i class="icon-cog"></i>브랜드정보수정</a></li>
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
				                <li><a href="products?manager_id=${sessionScope.sId} "><i class="icon-database"></i>상품관리</a></li>
				                <li><a href="inventory_management"><i class="icon-database"></i>재고관리</a></li>
				                <li><a href="orders"><i class="icon-bag2"></i>주문관리</a></li>
				                <li><a href="sales_main"><i class="icon-papers"></i>매출관리</a></li>
				                <li><a href="qnaboard_list"><i class="icon-users2"></i>답변관리</a></li>
				                <li><a href="follower_list"><i class="icon-users2"></i>팔로우목록</a></li>
				                <li><a href="sales_management"><i class="icon-percent-circle"></i>정산</a></li>
				                 <li><a href="brand_mypage"><i class="icon-cog"></i>내브랜드정보</a></li>
				                <li><a href="brand_settings"><i class="icon-cog"></i>브랜드정보수정</a></li>
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
                    <h3>상품관리</h3>
                </div>
								

                <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 이동</span><i class="icon-exit-right"></i></a></div>
            </header>
            <section class="ps-items-listing">
   
                 <div class="ps-section__actions"><a class="ps-btn success" href="manager/product_register"><i class="icon icon-plus mr-2"></i>새 상품 등록</a><a class="ps-btn ps-btn--gray" href="product_manage"><i class="icon icon-download2 mr-2"></i>상품 수정</a></div>
                
                <div class="ps-section__header">
                    <div class="ps-section__filter">
                        <form class="ps-form--filter" action="products" method="get">
                            <div class="ps-form__left">
                                <div class="form-group">
                                    <select class="ps-select" name="searchType">
										<option value="item_name">상품명</option>
                                        <option value="item_category">상품카테고리</option>
                                        <option value="item_packing">포장분류</option>
                                        <option value="item_stock">재고유무</option>
                                    </select>
                                    </div>
                                    </div>
                                <div class="form-group">
                                 <input class="form-control" type="text" name="keyword" placeholder="Search..." />
                                </div>
                                    
                            <div class="ps-form__right">
                                <button class="ps-btn ps-btn--gray"><i class="icon icon-funnel mr-2"></i>Filter</button>
                            </div>
                        </form>
                    </div>
                    
                    <br>
                    <div class="ps-section__search">
              
                    </div>
                </div>
                <div class="ps-section__content">
                    <div class="table-responsive">
                        <table class="table ps-table">
                            <thead>
                                <tr>
                                    <th>상품번호</th>
                                    <th>상품명</th>
                                    <th>상품소개</th>
                                    <th>재고</th>
                                    <th>가격 </th>
                                    <th>상품분류</th>
                                    <th>등록일</th>
                                    <th>포장분류</th>
                                    <th>브랜드이름</th>
                                    
                                    
                                </tr>
                            </thead>
                            <tbody>
					<c:forEach var="item" items="${itemList}" >
						    <tr>
						     <td>${item.item_idx}</td>
						     <td onclick="location.href='products_detail?item_idx=${item.item_idx}'"><strong>${item.item_name }</strong></td>
						     <td>${item.item_info}</td>
						     <td>${item.item_stock}</td>
						     <td>${item.item_price}</td>
						     <td>${item.item_category}</td>
						     <td>${item.item_date}</td>
						     <td>${item.item_packing}</td>
						     <td>${item.manager_brandname}</td>
						    </tr>     
					</c:forEach>
						</tbody>
						</table>
                            
                          
                       
                    </div>
                </div>
                <div class="ps-section__footer">
                   <!-- 페이징 버튼들 시작 -->
				                   <%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
				                    <div class="ps-pagination">
				                        <ul class="pagination">
				                           
				                            <li><%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%><a href="products?pageNum=${pageInfo.pageNum - 1}&sort=${sort}"><%}%><i class="icon-chevron-left"></i>Prev</a></li>
				                            <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
				                               <c:choose>
				                                  <c:when test="${i eq pageInfo.pageNum }"><li class="active"><a href="#">${i }</a></li></c:when>
				                                  <c:otherwise><li><a href="products?pageNum=${i }&sort=${sort}">${i }</a></li></c:otherwise>
				                               </c:choose>
				                            </c:forEach>
				                            <li><%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%><a href="products?pageNum=${pageInfo.pageNum + 1}&sort=${sort}"><%}%>Next<i class="icon-chevron-right"></i></a></li>
				                        </ul>
				                    </div>
				  <!-- 페이징 버튼들 끝 -->

                </div>
            </section>
        </div>
    </main>
    <script src="/Code_Green/resources/plugins_manager/jquery.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/popper.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/bootstrap/js/bootstrap.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/jquery.matchHeight-min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/select2/dist/js/select2.full.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/summernote/summernote-bs4.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/apexcharts-bundle/dist/apexcharts.min.js"></script>
    <!-- custom c/Code_Green/resourcese-->
    <script src="/Code_Green/resources/js/main_manager.js"></script>
</body>

</html>