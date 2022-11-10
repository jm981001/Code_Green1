<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <title>새로운상품등록</title>
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
				                <li><a href="qnaboard_list"><i class="icon-users2"></i>답변관리</a></li>
				                <li><a href="follower_list"><i class="icon-users2"></i>팔로우목록</a></li>
				                <li><a href="sales_management"><i class="icon-percent-circle"></i>정산</a></li>
				                 <li><a href="brand_mypage"><i class="icon-cog"></i>내브랜드정보</a></li>
				                <li><a href="brand_settings"><i class="icon-cog"></i>브랜드정보수정</a></li>
						</ul>
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
				                <li><a href="qnaboard_list"><i class="icon-users2"></i>답변관리</a></li>
				                <li><a href="follower_list"><i class="icon-users2"></i>팔로우목록</a></li>
				                <li><a href="sales_management"><i class="icon-percent-circle"></i>정산</a></li>
				                 <li><a href="brand_mypage"><i class="icon-cog"></i>내브랜드정보</a></li>
				                <li><a href="brand_settings"><i class="icon-cog"></i>브랜드정보수정</a></li>
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
                    <h3>새로운 상품</h3>
                    <p>상품 추가</p>
                </div>
                <div class="header__center">
                    <form class="ps-form--search-bar" action="index.html" method="get">
                        <input class="form-control" type="text" placeholder="Search something" />
                        <button><i class="icon-magnifier"></i></button>
                    </form>
                </div>
                <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 이동</span><i class="icon-exit-right"></i></a></div>
            </header>
            <section class="ps-new-item">
                <form class="ps-form ps-form--new-product" action="index.html" method="get">
                    <div class="ps-form__content">
                        <div class="row">
                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                                <figure class="ps-block--form-box">
                                    <figcaption>기본정보</figcaption>
                                    <div class="ps-block__content">
                                        <div class="form-group">
                                            <label>상품명<sup>*</sup>
                                            </label>
                                            <input class="form-control" type="text" placeholder="상품명을 기재해주세요" />
                                        </div>
                                        <div class="form-group">
                                            <label>상품번호<sup>*</sup>
                                            </label>
                                            <input class="form-control" type="text" placeholder="상품번호를 기재해주세요" />
                                        </div>
                                        <div class="form-group">
                                            <label>상품소개글<sup>*</sup>
                                            </label>
                                            <textarea class="form-control" rows="6" placeholder="상품상세페이지에 들어가는 상품소개글"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>정상가<sup>*</sup>
                                            </label>
                                            <input class="form-control" type="text" placeholder="정상가를 입력해주세요" />
                                        </div>
                                        <div class="form-group">
                                            <label>할인가<sup>*</sup>
                                            </label>
                                            <input class="form-control" type="text" placeholder="할인가를 입력해주세요" />
                                        </div>
                                            <div class="form-group">
                                            <label>할인율<sup>*</sup>
                                            </label>
                                            <input class="form-control" type="text" placeholder="할인율을 입력해주세요" />
                                        </div>
                                        <div class="form-group">
                                            <label>판매수량<sup>*</sup>
                                            </label>
                                            <input class="form-control" type="text" placeholder="판매수량을 입력해주세요" />
                                        </div>
                                             <div class="form-group">
                                            <label>포장상태<sup>*</sup>
                                            </label>
                                           
                                   <div class="form-group">
                                    <select class="ps-select">
                                        <option value="1">포장상태</option>
                                        <option value="2">냉장</option>
                                        <option value="3">냉동</option>
                                        <option value="4">실온</option>
                                    </select>
                                </div>
                                 </div>
                                         <div class="form-group">
                                            <label>상품카테고리<sup>*</sup>
                                            </label>
                                     <div class="form-group">
                                    <select class="ps-select">
                                        <option value="1">상품 카테고리</option>
                                        <option value="1">특가상품</option>
                                        <option value="2">과일/채소</option>
                                        <option value="3">유제품/음료</option>
                                        <option value="4">냉동식품</option>
                                         <option value="5">식물성 단백질</option>
                                        <option value="6">해산물</option>
                                        <option value="7">간식류</option>
                                    </select>
                                </div>
                                    </div>
                                        
                                    
                                        <div class="form-group">
                                            <label>상품설명<sup>*</sup></label>
                                            <textarea id="summernote" rows="6" name="editordata"placeholder=""></textarea>
                                        </div>
                                    </div>
                                </figure>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                                <figure class="ps-block--form-box">
                                    <figcaption>상품 이미지</figcaption>
                                    <div class="ps-block__content">
                                        <div class="form-group">
                                            <label>상품 썸네일</label>
                                            <div class="form-group--nest">
                                                <input class="form-control mb-1" type="text" placeholder="">
                                                <button class="ps-btn ps-btn--sm">Choose</button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>상품 갤러리</label>
                                            <div class="form-group--nest">
                                                <input class="form-control mb-1" type="text" placeholder="">
                                                <button class="ps-btn ps-btn--sm">Choose</button>
                                            </div>
                                        </div>
                                        <div class="form-group form-group--nest">
                                            <input class="form-control mb-1" type="text" placeholder="">
                                            <button class="ps-btn ps-btn--sm">Choose</button>
                                        </div>
                                        <div class="form-group">
                                            <label>동영상
                                            </label>
                                            <input class="form-control" type="text" placeholder="동영상 주소를 입력해주세요" />
                                        </div>
                                    </div>
                                </figure>
                                <figure class="ps-block--form-box">
                                    <figcaption>재고</figcaption>
                                    <div class="ps-block__content">
                                        <div class="form-group">
                                            <label>재고수량<sup>*</sup>
                                            </label>
                                            <input class="form-control" type="text" placeholder="" />
                                        </div>
                                        <div class="form-group form-group--select">
                                            <label>재고상태
                                            </label>
                                            <div class="form-group__content">
                                                <select class="ps-select" title="Status">
                                                    <option value="1">재입고</option>
                                                    <option value="2">품절</option>
                                                    <option value="3">판매중</option>
                                                    <option value="4">판매중지</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </figure>
                               
                            </div>
                        </div>
                    </div>
                    <div class="ps-form__bottom"><a class="ps-btn ps-btn--black" href="products.html">상품페이지이동</a>
                        <button class="ps-btn ps-btn--gray">취소</button>
                        <button class="ps-btn">등록</button>
                    </div>
                </form>
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