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
    <title>답변관리페이지</title>
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
        <div class="header__center"><a class="ps-logo" href="#"><img src="../img/logo.png" alt=""></a></div>
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
                        <div class="ps-block__left"><img src="../img/user/admin.jpg" alt="" /></div>
                        <div class="ps-block__right">
                            <p>Hello,<a href="#">브랜드 관리자</a></p>
                        </div>
                        <div class="ps-block__action"><a href="#"><i class="icon-exit"></i></a></div>
                    </div>
                    <div class="ps-block--earning-count"><small>Earning</small>
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
                        <div class="ps-copyright"><img src="../img/logo.png" alt="">
                              <p>&copy;2022 CODE GREEN. <br/> All rights reversed.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ps-main__wrapper">
            <header class="header--dashboard">
                <div class="header__left">
                    <h3>답변관리</h3>
<!--                     <p>Martfury Customers</p> -->
                </div>
                <div class="header__center">
                    <form class="ps-form--search-bar" action="index.html" method="get">
                        <input class="form-control" type="text" placeholder="Search something" />
                        <button><i class="icon-magnifier"></i></button>
                    </form>
                </div>
                <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 이동</span><i class="icon-exit-right"onclick="href=/Code_Green"></i></a></div>
            </header>
            <section class="ps-items-listing">
                <div class="ps-section__header simple">
                    <div class="ps-section__filter">
                        <form class="ps-form--filter" action="index.html" method="get">
                            <div class="ps-form__left">
                                <div class="form-group">
                                    <input class="form-control" type="text" placeholder="Search..." />
                                </div>
                                <div class="form-group">
                                    <select class="ps-select">
                                        <option value="1">답변중</option>
                                        <option value="2">답변대기</option>
                                        <option value="3">답변완료</option>
                                    </select>
                                </div>
                            </div>
                            <div class="ps-form__right">
                                <button class="ps-btn ps-btn--gray"><i class="icon icon-funnel mr-2"></i>Filter</button>
                            </div>
                        </form>
                    </div>
                    <div class="ps-section__actions"><a class="ps-btn success" href="review_board_manage"><i class="icon icon-plus mr-2"></i>답변관리</a></div>
                </div>
                <div class="ps-section__content">
                    <div class="table-responsive">
                        <table class="table ps-table">
                            <thead>
                                <tr>
                                	<th>번호</th>
                                   	<th>제목</th>
                                    <th>작성자</th>
                                    <th>질문분류</th>
                                     <th>처리상태</th>
                                    <th>작성일</th>
                                   
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td><a href="review_board_manage"><strong>냉동보관하면 되나요?</strong></a></td>
                                    <td>홍길동</td>
                                    <td>상품문의</td>
                                    <td><span class="ps-badge success">답변대기</span>
                                    </td>
                                    <td>Jul 21, 2020</td>
                                    <td>
                                    
<!--아코디언 -->
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div>
                                        </div>
                                    </td>
                                </tr>
                                   <tr>
                                    <td>1</td>
                                    <td><strong>냉동보관하면 되나요?<a href=""></a></strong></td>
                                    <td>홍길동</td>
                                    <td>상품문의</td>
                                    <td><span class="ps-badge success">답변대기</span>
                                    </td>
                                    <td>Jul 21, 2020</td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div>
                                        </div>
                                    </td>
                                </tr>
                                   <tr>
                                    <td>1</td>
                                    <td><strong>오늘 결제했는데 언제 배송되나요</strong></td>
                                    <td>홍길동</td>
                                    <td>배송문의</td>
                                    <td><span class="ps-badge success">답변완료</span>
                                    </td>
                                    <td>Jul 21, 2020</td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div>
                                        </div>
                                    </td>
                                </tr>
                                   <tr>
                                    <td>1</td>
                                    <td><strong>냉동보관하면 되나요?</strong></td>
                                    <td>홍길동</td>
                                    <td>상품문의</td>
                                    <td><span class="ps-badge success">답변중</span>
                                    </td>
                                    <td>Jul 21, 2020</td>
                                    <td>          
                                      	 <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div>
                                        </div>
                                    </td>
                                </tr>
                                    <tr>
                                    <td>1</td>
                                    <td><strong>상품 안에 몇개들어있나요??</strong></td>
                                    <td>김길동</td>
                                    <td>상품문의</td>
                                    <td><span class="ps-badge success">답변중</span>
                                    </td>
                                    <td>Jul 21, 2020</td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div>
                                        </div>
                                    </td>
                                </tr>
                                    <tr>
                                    <td>1</td>
                                    <td><strong>냉동보관하면 되나요?</strong></td>
                                    <td>홍길동</td>
                                    <td>상품문의</td>
                                    <td><span class="ps-badge success">답변완료</span>
                                    </td>
                                    <td>Jul 21, 2020</td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div>
                                        </div>
                                    </td>
                                </tr>
                                    <tr>
                                    <td>1</td>
                                    <td><strong>냉동보관하면 되나요?</strong></td>
                                    <td>홍길동</td>
                                    <td>상품문의</td>
                                    <td><span class="ps-badge success">답변대기</span>
                                    </td>
                                    <td>Jul 21, 2020</td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div>
                                        </div>
                                    </td>
                                </tr>
                                    <tr>
                                    <td>1</td>
                                    <td><strong>냉동보관하면 되나요?</strong></td>
                                    <td>홍길동</td>
                                    <td>상품문의</td>
                                    <td><span class="ps-badge success">답변대기</span>
                                    </td>
                                    <td>Jul 21, 2020</td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div>
                                        </div>
                                    </td>
                                </tr>
                                   <tr>
                                    <td>1</td>
                                    <td><strong>냉동보관하면 되나요?</strong></td>
                                    <td>홍길동</td>
                                    <td>상품문의</td>
                                    <td><span class="ps-badge success">답변대기</span>
                                    </td>
                                    <td>Jul 21, 2020</td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div>
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
    <!-- custom code-->
    <script src="/Code_Green/resources/js/main_manager.js"></script>
</body>

</html>