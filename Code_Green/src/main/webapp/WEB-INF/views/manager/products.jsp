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
               				    <li><a class="active" href="index"><i class="icon-home"></i>관리자메인페이지</a></li>
				                <li><a href="products"><i class="icon-database"></i>상품관리</a></li>
				                <li><a href="inventory_management"><i class="icon-database"></i>재고관리</a></li>
				                <li><a href="orders"><i class="icon-bag2"></i>주문관리</a></li>
				                <li><a href="sales_main"><i class="icon-papers"></i>매출관리</a></li>
				                <li><a href="answerboardlist"><i class="icon-users2"></i>답변관리</a></li>
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
                            <p>Hello,<a href="#">브랜드 관리자</a></p>
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
                            	<li><a class="active" href="index"><i class="icon-home"></i>관리자메인페이지</a></li>
				                <li><a href="products"><i class="icon-database"></i>상품관리</a></li>
				                <li><a href="inventory_management"><i class="icon-database"></i>재고관리</a></li>
				                <li><a href="orders"><i class="icon-bag2"></i>주문관리</a></li>
				                <li><a href="sales_main"><i class="icon-papers"></i>매출관리</a></li>
				                <li><a href="answerboardlist"><i class="icon-users2"></i>답변관리</a></li>
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
<!--                     <p>Product Listings</p> -->
                </div>
                <div class="header__center">
                    <form class="ps-form--search-bar" action="index.html" method="get">
                        <input class="form-control" type="text" placeholder="Search something" />
                        <button><i class="icon-magnifier"></i></button>
                    </form>
                </div>
                <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 이동</span><i class="icon-exit-right"></i></a></div>
            </header>
            <section class="ps-items-listing">
   
                 <div class="ps-section__actions"><a class="ps-btn success" href="product_register"><i class="icon icon-plus mr-2"></i>새 상품 등록</a><a class="ps-btn ps-btn--gray" href="product_manage"><i class="icon icon-download2 mr-2"></i>상품 수정</a></div>
                
                <div class="ps-section__header">
                    <div class="ps-section__filter">
                        <form class="ps-form--filter" action="index.html" method="get">
                            <div class="ps-form__left">
                                <div class="form-group">
                                    <select class="ps-select">
                                        <option value="1">상품 카테고리</option>
                                        <option value="1">특가상품</option>
                                        <option value="2">과일/채소</option>
                                        <option value="3">유제품/음료</option>
                                        <option value="4">냉동식품/ 간편식품</option>
                                        <option value="5">해산물</option>
                                        <option value="6">간식류</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="ps-select">
                                        <option value="1">포장분류</option>
                                        <option value="2">냉장</option>
                                        <option value="3">냉동</option>
                                        <option value="4">실온</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="ps-select">
                                        <option value="1">재고있음</option>
                                        <option value="2">재고없음</option>
                                    </select>
                                </div>
                            </div>
                            <div class="ps-form__right">
                                <button class="ps-btn ps-btn--gray"><i class="icon icon-funnel mr-2"></i>Filter</button>
                            </div>
                        </form>
                    </div>
                    <div class="ps-section__search">
                        <form class="ps-form--search-simple" action="index" method="get">
                            <input class="form-control" type="text" placeholder="Search product" />
                            <button><i class="icon icon-magnifier"></i></button>
                        </form>
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
                                     <div class="form-group">
                                    <select class="ps-select">
                                        <option value="1">정상가</option>
                                        <option value="2">할인적용</option>
                                   </select>
                                   
                                </div></td>
                              
                                    <td>
                                        <p class="ps-item-categories"><a href="#">과일/채소</a>
                                        </p>
                                    </td>
                                    <td>2019/11/06</td>
                                    <td><span class="ps-badge success">냉장</span>
                                    </td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">수정</a><a class="dropdown-item" href="#">삭제</a></div>
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
                                        <p class="ps-item-categories"><a href="#">간식류</a>
                                        </p>
                                    </td>
                                    <td>2018/12/11</td>
                                     <td><span class="ps-badge success">냉동</span>
                                    </td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">수정</a><a class="dropdown-item" href="#">삭제</a></div>
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
                                        <p class="ps-item-categories"><a href="#">기타</a>
                                        </p>
                                    </td>
                                    <td>2018/12/11</td>
                                     <td><span class="ps-badge success">냉장</span>
                                    </td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">수정</a><a class="dropdown-item" href="#">삭제</a></div>
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
                                        <p class="ps-item-categories"><a href="#">냉동식품</a>
                                        </p>
                                    </td>
                                    <td>2018/12/11</td>
                                     <td><span class="ps-badge success">냉동</span>
                                    </td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">수정</a><a class="dropdown-item" href="#">삭제</a></div>
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
                                        <p class="ps-item-categories"><a href="#">기타</a>
                                        </p>
                                    </td>
                                    <td>2018/12/11</td>
                                     <td><span class="ps-badge success">냉장</span>
                                    </td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">수정</a><a class="dropdown-item" href="#">삭제</a></div>
                                        </div>
                                    </td>
                                </tr>
                               
                                <tr>
                                    <td>ABH-5</td>
                                      <td><a href="#"><strong>비건 떡볶이</strong></a></td>
                                    <td>비건을 위한 반가운 소식</td>
<!--                                     <td><span class="ps-badge success">재고있음</span> -->
                                    <td><span class="ps-badge gray">재고없음</span>
                                    </td>
                                    <td><strong>7,500원</strong></td>
                                      <td>
                                        <p class="ps-item-categories"><a href="#">기타</a>
                                        </p>
                                    </td>
                                    <td>2018/12/11</td>
                                     <td><span class="ps-badge success">냉동</span>
                                    </td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">수정</a><a class="dropdown-item" href="#">삭제</a></div>
                                        </div>
                                    </td>
                                </tr>
                                       <tr>
                                    <td>ABH-6</td>
                                      <td><a href="#"><strong>유기농 햇밤 800g</strong></a></td>
                                    <td>2022년 수확한 노랗고 포근한 단맛의 유혹</td>
<!--                                     <td><span class="ps-badge success">재고있음</span> -->
                                    <td><span class="ps-badge gray">재고없음</span>
                                    </td>
                                    <td><strong>10,500원</strong></td>
                                      <td>
                                        <p class="ps-item-categories"><a href="#">과일/채소</a>
                                        </p>
                                    </td>
                                    <td>2018/12/11</td>
                                     <td><span class="ps-badge success">냉장</span>
                                    </td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">수정</a><a class="dropdown-item" href="#">삭제</a></div>
                                        </div>
                                    </td>
                                </tr>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="ps-section__footer">
                    <p>Show 10 in 30 items.</p>
                    <ul class="pagination">
                        <li><a href="#"><i class="icon icon-chevron-left"></i></a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#"><i class="icon-chevron-right"></i></a></li>
                    </ul>
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