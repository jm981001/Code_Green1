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
    <title>주문 상세 내역</title>
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
<!-- 				            <li><a href="inventory_management"><i class="icon-database"></i>재고관리</a></li> -->
				                <li><a href="orders"><i class="icon-bag2"></i>주문관리</a></li>
				                <li><a href="sales_main"><i class="icon-papers"></i>매출관리</a></li>
				                <li><a href="qnaboard_list"><i class="icon-users2"></i>답변관리</a></li>
<!-- 				            <li><a href="follower_list"><i class="icon-users2"></i>팔로우목록</a></li> -->
				                <li><a href="sales_management"><i class="icon-percent-circle"></i>정산</a></li>
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
                       <div class="ps-block--earning-count"><small>수익</small>
                        <h3>$12,560.55</h3>
                    </div>
                </div>
                <div class="ps-sidebar__content">
                    <div class="ps-sidebar__center">
                        <ul class="menu">
                                <li><a class="active" href="manager_index"><i class="icon-home"></i>관리자메인페이지</a></li>
				                <li><a href="products?manager_id=${sessionScope.sId }"><i class="icon-database"></i>상품관리</a></li>
<!-- 				            <li><a href="inventory_management"><i class="icon-database"></i>재고관리</a></li> -->
				                <li><a href="orders"><i class="icon-bag2"></i>주문관리</a></li>
				                <li><a href="sales_main"><i class="icon-papers"></i>매출관리</a></li>
				                <li><a href="qnaboard_list"><i class="icon-users2"></i>답변관리</a></li>
<!-- 				            <li><a href="follower_list"><i class="icon-users2"></i>팔로우목록</a></li> -->
				                <li><a href="sales_management"><i class="icon-percent-circle"></i>정산</a></li>
								<li><a href="brand_mypage?manager_id=${sessionScope.sId }"><i class="icon-cog"></i>내브랜드정보</a></li>
						
						
						</ul>
                    </div>
                    <div class="ps-sidebar__footer">
                        <div class="ps-copyright"><img src="img/logo.png" alt="">
                             <p>&copy;2022 CODE GREEN. <br/> All rights reversed.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ps-main__wrapper">
            <header class="header--dashboard">
                <div class="header__left">
                    <h3>주문관리</h3>
<!--                     <p>Order detail of #ABD-235711</p> -->
                </div>
                <div class="header__center">
                    <form class="ps-form--search-bar" action="index.html" method="get">
                        <input class="form-control" type="text" placeholder="Search something" />
                        <button><i class="icon-magnifier"></i></button>
                    </form>
                </div>
                <div class="header__right"><a class="header__site-link" href="#"><span>View your store</span><i class="icon-exit-right"></i></a></div>
            </header>
            <section class="ps-dashboard">
                <div class="ps-section__left">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="ps-card ps-card--order-information ps-card--small">
                                <div class="ps-card__header">
                                    <h4>주문 정보</h4>
                                </div>
                                <div class="ps-card__content">
                                <p><strong>주문 번호 : </strong>#ABD-235711</p>
                                 <p><strong>주문자 이름 : </strong>김감자 </h5>
                                    <p><strong>주소 :</strong> 부산시 부산진구 동천로 109,7층</p>
                                    <p><strong>연락처 : </strong> 051-803-0909</p>
                                    <p><strong>이메일:</strong> customer@codegreen.com</p>
                                </div>
                            </div>
                        </div>
                       <div class="col-md-4">
                            <div class="ps-card ps-card--order-information ps-card--small">
                                <div class="ps-card__header">
                                    <h4>결제 정보</h4>
                                </div>
                                <div class="ps-card__content">
                                    <p><strong>결제 수단:</strong> Visa</p>
                                    <p><strong>카드 번호:</strong> **** **** **** *2121</p>
                                    <p><strong>유효기간:</strong> 02-2025</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="ps-card ps-card--order-information ps-card--small">
                                <div class="ps-card__header">
                                    <h4>배송 정보 </h4>
                                </div>
                                <div class="ps-card__content">
                                    <h5>김감자</h5>
                                    <p><strong>주소 :</strong> 부산시 부산진구 동천로 109,7층</p>
                                    <p><strong>연락처 : </strong> 051-803-0909</p>
                                    <p><strong>이메일:</strong> customer@codegreen.com</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ps-card ps-card--track-order">
                        <div class="ps-card__header">
                            <h4>#ABD-235711 주문내역</h4>
                        </div>
                        <div class="ps-card__content">
                            <div class="table-responsive">
                                <table class="table ps-table">
                                    <thead>
                                        <tr>
                                            <th>상품</th>
                                            <th>수량</th>
                                            <th>가격</th>
                                            <th>총금액</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><a href="products.jsp">친환경 시금치 200g</a></td>
                                            <td>1</td>
                                            <td>3,290원</td>
                                            <td>3,290원</td>
                                        </tr>
                                        <tr>
                                            <td><a href="products.jsp">생연어(냉장)</a></td>
                                            <td>1</td>
                                            <td>16,500원</td>
                                            <td>16,500원</td>
                                        </tr>
                                        <tr>
                                            <td><a href="products.jsp">포도씨유</a></td>
                                            <td>1</td>
                                            <td>7,900원</td>
                                            <td>7,900원</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3"><strong>상품금액:</strong></td>
                                            <td><strong>27,690원</strong></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3"><strong>배송비:</strong></td>
                                            <td><strong>2,500원</strong></td>
                                        </tr>
                                       
                                        <tr>
                                            <td colspan="3"><strong>총금액:</strong></td>
                                            <td><strong>30,190원</strong></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ps-section__right">
                    <div class="ps-card ps-card--track-order">
                        <div class="ps-card__header">
                            <h4>배송 조회</h4>
                        </div>
                        <div class="ps-card__content">
                            <div class="ps-block--track-order">
                                <div class="ps-block__header">
                                    <div class="row">
                                        <div class="col-6">
                                            <figure>
                                                <figcaption>주문번호:</figcaption>
                                                <p>#ABD-235711</p>
                                            </figure>
                                        </div>
                                        <div class="col-6">
                                            <figure>
                                                <figcaption>송장번호:</figcaption>
                                                <p>21191818abs1</p>
                                            </figure>
                                        </div>
                                    </div>
                                </div>
                                <div class="ps-block__content">
                                    <div class="ps-block__timeline">
                                        <figure class="active">
                                            <figcaption>주문완료</figcaption>
                                            <p>Sep 19, 2020 <small>7:00am</small></p>
                                        </figure>
                                        <figure class="active">
                                            <figcaption>포장완료</figcaption>
                                            <p>Sep 19, 2020 <small>10:00am</small></p>
                                        </figure>
                                        <figure class="active">
                                            <figcaption>배송중</figcaption>
                                            <p>Sep 19, 2020 <small>4:00pm</small></p>
                                        </figure>
                                        <figure>
                                            <figcaption>배송완료</figcaption>
                                            <p>Estimated delivery within 1 day</p>
                                        </figure>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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

