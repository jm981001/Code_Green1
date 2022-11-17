<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>재고관리</title>
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
				                <li><a href="products?manager_id=${sessionScope.sId }"><i class="icon-database"></i>상품관리</a></li>
				                <li><a href="inventory_management"><i class="icon-database"></i>재고관리</a></li>
				                <li><a href="orders"><i class="icon-bag2"></i>주문관리</a></li>
				                <li><a href="sales_main"><i class="icon-papers"></i>매출관리</a></li>
				                <li><a href="qnaboard_list"><i class="icon-users2"></i>답변관리</a></li>
				                <li><a href="follower_list"><i class="icon-users2"></i>팔로우목록</a></li>
				                <li><a href="sales_management"><i class="icon-percent-circle"></i>정산</a></li>
								<li><a href="brand_mypage?id=${sessionScope.sId }"><i class="icon-cog"></i>내브랜드정보</a></li>
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
				                <li><a href="products?manager_id=${sessionScope.sId }"><i class="icon-database"></i>상품관리</a></li>
				                <li><a href="inventory_management"><i class="icon-database"></i>재고관리</a></li>
				                <li><a href="orders"><i class="icon-bag2"></i>주문관리</a></li>
				                <li><a href="sales_main"><i class="icon-papers"></i>매출관리</a></li>
				                <li><a href="qnaboard_list"><i class="icon-users2"></i>답변관리</a></li>
				                <li><a href="follower_list"><i class="icon-users2"></i>팔로우목록</a></li>
				                <li><a href="sales_management"><i class="icon-percent-circle"></i>정산</a></li>
								<li><a href="brand_mypage?id=${sessionScope.sId }"><i class="icon-cog"></i>내브랜드정보</a></li>
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
                    <h3>재고현황</h3>
                    <p>재고수정&삭제</p>
                </div>
                <div class="header__center">
                    <form class="ps-form--search-bar" action="index.html" method="get">
                        <input class="form-control" type="text" placeholder="Search something" />
                        <button><i class="icon-magnifier"></i></button>
                    </form>
                </div>
                <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 이동</span><i class="icon-exit-right"></i></a></div>
            </header>
            <section class="ps-dashboard ps-items-listing">
                <div class="ps-section__left">
                    <section class="ps-card">
                        <div class="ps-card__header">
                        
                        
<!--                             <h4>재고관리</h4> -->
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
                                    <th>재고유무</th>
                                    
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>ABH-0</td>
                                    <td><strong>친환경고사리</strong></td>
                                    <td>편하게 요리하는 고소한 나물</td>
                                    <td><span class="ps-badge success">재고있음</span>
                                    </td>
                                    <td><strong>7,800원  </strong>
                                   
                                  
                                </td>
                              
                                    <td>
                                        <p class="ps-item-categories"><a href="#">채소</a>
                                        </p>
                                    </td>
                                    <td>2019/11/06</td>
                                    <td><span class="ps-badge success">냉장</span>
                                    </td>
                                    <td>
                                        <div class="form-group">
                                    <select class="ps-select">
                                        <option value="1">재고있음</option>
                                        <option value="2">재고없음</option>
                                   </select>
                                   </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>ABH-1</td>
                                    <td><a href="#"><strong>비건마들렌</strong></a></td>
                                    <td>식물성 재료로 만들어 담백한 맛</td>
                                    <td><span class="ps-badge success">재고있음</span>
                                    </td>
                                    <td><strong>7,800원</strong></td>
                                      <td>
                                        <p class="ps-item-categories"><a href="#">베이커리</a>
                                        </p>
                                    </td>
                                    <td>2018/12/11</td>
                                     <td><span class="ps-badge success">냉동</span>
                                    </td>
                                      <td>
                                        <div class="form-group">
                                    <select class="ps-select">
                                        <option value="1">재고있음</option>
                                        <option value="2">재고없음</option>
                                   </select>
                                   </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>ABH-2</td>
                                <td><a href="#"><strong>비건마요</strong></a></td>
                                    <td>두유로 만든 저당 마요네즈</td>
                                    <td><span class="ps-badge success">재고있음</span>
                                    </td>
                                    <td><strong>4,980원</strong></td>
                                      <td>
                                        <p class="ps-item-categories"><a href="#">소스/드레싱</a>
                                        </p>
                                    </td>
                                    <td>2018/12/11</td>
                                     <td><span class="ps-badge success">냉장</span>
                                    </td>
                                      <td>
                                        <div class="form-group">
                                    <select class="ps-select">
                                        <option value="1">재고있음</option>
                                        <option value="2">재고없음</option>
                                   </select>
                                   </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>ABH-3</td>
                                  <td><a href="#"><strong>한입 완자</strong></a></td>
                                    <td>도시락용 또는 반찬으로 제격</td>
                                    <td><span class="ps-badge success">재고있음</span>
                                    </td>
                                    <td><strong>10,880원</strong></td>
                                      <td>
                                        <p class="ps-item-categories"><a href="#">간편식</a>
                                        </p>
                                    </td>
                                    <td>2018/12/11</td>
                                     <td><span class="ps-badge success">냉동</span>
                                    </td>
 								 <td>
                                        <div class="form-group">
                                    <select class="ps-select">
                                        <option value="1">재고있음</option>
                                        <option value="2">재고없음</option>
                                   </select>
                                   </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>ABH-4</td>
                                   <td><a href="#"><strong>비건 김치</strong></a></td>
                                    <td>젓갈을 넣지않고 만든 김치</td>
                                    <td><span class="ps-badge success">재고있음</span>
                                    </td>
                                    <td><strong>6,880원</strong></td>
                                      <td>
                                        <p class="ps-item-categories"><a href="#">반찬/김치</a>
                                        </p>
                                    </td>
                                    <td>2018/12/11</td>
                                     <td><span class="ps-badge success">냉장</span>
                                    </td>
                                      <td>
                                        <div class="form-group">
                                    <select class="ps-select">
                                        <option value="1">재고있음</option>
                                        <option value="2">재고없음</option>
                                   </select>
                                   </div>
                                    </td>
                                </tr>
                               
                          
                           
                                
                            </tbody>
                        </table>
                    </div>
                </div>
						
						<br>
						<div class="ps-card__content">
                            <form class="ps-form--account-settings" action="index" method="get">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>상품번호
                                            </label>
                                            <input class="form-control" type="text" placeholder="" />
                                        </div>
                                    </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>상품명
                                            </label>
                                            <input class="form-control" type="text" placeholder="" />
                                        </div>
                                        </div>
                                     <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>재고수량
                                            </label>
                                            <input class="form-control" type="text" placeholder="" />
                                        </div>
                                        </div>     

                           
                                   <div class="col-sm-12">
                                   	<div class="form-group">
                                       <label>재고상태
                                       </label>
                                   <div class="form-group">
                                   	 <select class="ps-select">
                                        <option value="1">재입고</option>
                                                    <option value="2">품절</option>
                                                    <option value="3">판매중</option>
                                                    <option value="4">판매중지</option>
                                    </select>
                                  </div>
                                   </div>
                                    </div>
                                    
                                    
                                  
                                <div class="ps-form__submit text-center">
                                <button class="ps-btn success">재고수정</button>
                                    <button class="ps-btn ps-btn--gray mr-3">삭제</button>
                                    
                                </div>
                            </form>
                        </div>
                    </section>
                </div>
                <div class="ps-section__right"></div>
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