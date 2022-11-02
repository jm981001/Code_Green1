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
    <title>상품관리-새상품추가</title>
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
                        <div class="ps-copyright"><img src="../img/logo.png" alt="">
                            <p>&copy;2022 CODEGREEN. <br/> All rights reversed.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ps-main__wrapper">
            <header class="header--dashboard">
                <div class="header__left">
                    <h3>상품관리</h3>
                    <p>상품 수정 & 삭제</p>
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
              
                        
    
    
 <h4>브랜드 상품관리</h4>
 </div>

 
      		 <table class="table ps-table">
              
                  
                    <h2>상품등록</h2>
                    <hr>
                            <thead>
                                <tr>
                                    <th>상품번호</th>
                                    <th>날짜</th>
                                    <th>상품명</th>
                                    <th>결제</th>
                                    <th>주문상태</th>
                                    <th>총금액</th>
                                    <th></th>
                                </tr>
                            </thead>    
                     
  				</table>

  		
                  
                        <div class="card" style="width: 18rem;">
						  <img src="../img/OKJA 오트 드링크 1L썸네일.png"class="card-img-top" alt="삼색이.jpg">
						  <div class="card-body">
						    <h5 class="card-title">상품명</h5>
						    <p class="card-text">상품소개 어쩌고 저쩌고</p>
						    <a href="#" class="btn btn-primary">썸네일수정</a>
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
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>상품명
                                            </label>
                                            <input class="form-control" type="text" placeholder="" />
                                        </div>
                                    </div>
                                         <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>상품한줄소개
                                            </label>
                                            <textarea class="form-control"type="text" placeholder="상품페이지에 들어가는 상품소개글"></textarea>
                                        </div>
                                    </div>
                                        <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>포장상태
                                            </label>
                                   <div class="form-group">
                                    <select class="ps-select">
                                        
                                        <option value="1">냉장</option>
                                        <option value="2">냉동</option>
                                        <option value="3">실온</option>
                                    </select>
                                 
                                </div>
                                 </div>
                                    </div>
                                       </form>
                                 
                                
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>상품 카테고리
                                            </label>
                                   <div class="form-group">
                                    <select class="ps-select">
                                        <option value="1">상품 카테고리</option>
                                        <option value="2">과일</option>
                                        <option value="2">과일</option>
                                        <option value="3">채소</option>
                                         <option value="3">채소</option>
                                        <option value="4">우유&치즈</option>
                                        <option value="5">신선식품</option>
                                        <option value="6">냉동식품</option>
                                        <option value=7">콩고기&식물성단백질</option>
                                        <option value="8">생선</option>
                                        <option value="9">과자류</option>
                                        <option value="10">주방&청소</option>
                                        <option value="11">바디&헤어</option>
                                    </select>
                                </div>
                                    </div>
                                 
                                </div>
                                  
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>상품가격
                                            </label>
                                            <input class="form-control" type="text" placeholder="" />
                                       </div>
                                       </div>
                                          <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>상품세일가
                                            </label>
                                            <input class="form-control" type="text" placeholder="" />
                                       </div>
                                      
                                       
                                          <select class="ps-select">
                                        <option value="1">정상가</option>
                                        <option value="2">할인적용</option>
                                   </select>
                                    </div>
                              </div>
                           
                                   <div class="col-sm-12">
                                   	<div class="form-group">
                                       <label>재고상태
                                       </label>
                                   <div class="form-group">
                                   	 <select class="ps-select">
                                        <option value="1">재고있음</option>
                                        <option value="2">재고없음</option>
                                    </select>
                                  </div>
                                   </div>
                                    </div>
                                    
                                    
                                  

                    <br>
                    
<!-----게시판글쓰기api -------->
  <label>상품소개 </label>
<!--   <textarea class="form-control"type="text" placeholder="상품페이지에 들어가는 상품소개글"></textarea> -->
  
                <textarea id="summernote" name="editordata"></textarea>
                     <div class="ps-form__submit text-center">
                     				<br>
                                    <button class="ps-btn ps-btn--gray mr-3">취소</button>
                                    <button class="ps-btn success">상품등록</button>
                                </div>

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
    
    