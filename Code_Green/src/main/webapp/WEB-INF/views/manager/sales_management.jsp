<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>매출관리 페이지</title>
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
				                <li><a href="orders?manager_id=${sessionScope.sId }"><i class="icon-bag2"></i>주문관리</a></li>
				                <li><a href="sales_main"><i class="icon-papers"></i>매출관리</a></li>
				                <li><a href="qnaboard_list"><i class="icon-users2"></i>답변관리</a></li>
				                <li><a href="recipeboard_list?manager_id=${sessionScope.sId }"><i class="icon-users2"></i>레시피관리</a></li>
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
				                <li><a href="orders?manager_id=${sessionScope.sId }"><i class="icon-bag2"></i>주문관리</a></li>
				                <li><a href="sales_main"><i class="icon-papers"></i>매출관리</a></li>
				                <li><a href="qnaboard_list"><i class="icon-users2"></i>답변관리</a></li>
				                <li><a href="recipeboard_list?manager_id=${sessionScope.sId }"><i class="icon-users2"></i>레시피관리</a></li>
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
                    <h3>정산페이지</h3>
<!--                     <p>Martfury Categories</p> -->
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
                    <div class="table-responsive">
                    
                    
                    
<!--                        <div class="ps-card"> -->
<!--                         <div class="ps-card__header"> -->
<!--                         <br> -->
<!--                             <h4>매출 집계</h4> -->
<!--                         </div> -->
<!--                         <div class="ps-card__content"> -->
<!--                             <div class="table-responsive"> -->
<!--                                 <table class="table ps-table"> -->
<!--                                     <thead> -->
<!--                                         <tr> -->
<!--                                             <th>판매순위</th> -->
<!--                                             <th>제품명</th> -->
<!--                                             <th>매출</th> -->
<!--                                             <th>누적판매량</th> -->
<!--                                             <th></th> -->
<!--                                             <th></th> -->
<!--                                             <th></th> -->
<!--                                         </tr> -->
<!--                                     </thead> -->
<!--                                     <tbody> -->
<!--                                         <tr> -->
<!--                                             <td>1위</td> -->
<!--                                             <td><strong>두부면</strong></td> -->
<!--                                             <td><a href="order-detail.html"><strong>50,000원</strong></a></td> -->
<!-- <!--                                             <td><span class="ps-badge success">1873명</span> --> 
<!--                                             </td> -->
<!--                                             <td><span>398건</span> -->
<!--                                             </td> -->
<!-- <!--                                             <td><strong>37건</strong></td> --> 
<!--                                             <td> -->

<!--                                             </td> -->
<!--                                         </tr> -->
<!--                                         <tr> -->
<!--                                             <td>2위</td> -->
<!--                                             <td><strong>두부텐더</strong></td> -->
<!--                                             <td><a href="order-detail.html"><strong>30,000원</strong></a></td> -->
<!-- <!--                                             <td><span class="ps-badge success">187명</span> --> 
<!--                                             </td> -->
<!--                                             <td><span>318건</span> -->
<!--                                             </td> -->
<!-- <!--                                             <td><strong>35건</strong></td> --> 
<!--                                             <td> -->

<!--                                             </td> -->
<!--                                         </tr> -->
<!--                                         <tr> -->
<!--                                             <td>3위</td> -->
<!--                                             <td><strong>비건마들렌</strong></td> -->
<!--                                             <td><a href="order-detail.html"><strong>30,000원</strong></a></td> -->
<!-- <!--                                             <td><span class="ps-badge success">17명</span> --> 
<!--                                             </td> -->
<!--                                             <td><span>38건</span> -->
<!--                                             </td> -->
<!-- <!--                                             <td><strong>3건</strong></td> --> 
<!--                                             <td> -->
<!--                                             </td> -->
<!--                                         </tr> -->
                                       
                                        
                                        
<!--   위는 브랜드별 매출 순위   위는 브랜드별 매출 순위    위는 브랜드별 매출 순위  위는 브랜드별 매출 순위 -->
                                        
<!--                                     </tbody> -->
<!--                                 </table> -->
<!--                             </div> -->
<!--                         </div> -->
                    
                    
                    
                    
                    
                      <div class="ps-card"> 
                        <div class="ps-card__header">
                        <br>
                            <h4>매출 집계</h4>
                        </div>
                    
                    
                     <div class="ps-card__content">
                       <div class="table-responsive">
                        <table class="table ps-table">
                            <thead>
                                  <label for="date">날짜를 선택하세요:
							  		<input type="date"
							         id="date"
							         max="2077-06-20"
							         min="2077-06-05"
							         value="2077-06-15">
							</label>
                                <tr>
                                    <th>연매출</th><br>
                                    <th>이번달매출</th><br>
                                    <th>이번주매출</th><br>
                                    <th>오늘매출</th><br>
                                    </table>
<!--                                     <th><input type="button"value="오늘매출"></th> -->
                                    
                                    <th></th>
                              
                                </tr>
                            </thead>
                            <tbody>
                            <br>
                            
                            
                              <div class="ps-card">
                        <div class="ps-card__header">
                         <td><a href="orders.jsp"><strong><h4>매출상세</h4></strong></a></td>
                            
                        </div>
                        <div class="ps-card__content">
                            <div class="table-responsive">
                                <table class="table ps-table">
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
                                    <tbody>
                                      <tr>
                                          <tr>
                                    <td>#A580</td>
                                    <td><strong> Aug, 15, 2020</strong></td>
                                    <td><a href="order-detail.html"><strong>Unero Black Military</strong></a></td>
                                    <td><span class="ps-badge success">결제</span>
                                    </td>
                                    <td><span class="ps-fullfillment success">배송</span>
                                    </td>
                                    <td><strong>$56.00</strong></td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div>
                                        </div>
                                    </td>
                                </tr>
<!--                                 <tr> -->
<!--                                     <td><strong>Babies &amp; Moms</strong></td> -->
<!--                                     <td>babies-and-moms</td> -->
<!--                                     <td>Jul 21, 2020</td> -->
<!--                                     <td> -->
<!--                                         <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a> -->
<!--                                             <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div> -->
<!--                                         </div> -->
                                    </td>
                                </tr>
<!--                                 <tr> -->
<!--                                     <td><strong>Clothing &amp; Apparel</strong></td> -->
<!--                                     <td>clothing-and-apparel</td> -->
<!--                                     <td>Jul 21, 2020</td> -->
<!--                                     <td> -->
<!--                                         <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a> -->
<!--                                             <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div> -->
<!--                                         </div> -->
<!--                                     </td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <td><strong>Electronic</strong></td> -->
<!--                                     <td>clothing-and-apparel</td> -->
<!--                                     <td>Jul 21, 2020</td> -->
<!--                                     <td> -->
<!--                                         <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a> -->
<!--                                             <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div> -->
<!--                                         </div> -->
<!--                                     </td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <td><strong>Home Garden &amp; Kitchen</strong></td> -->
<!--                                     <td>Home-garden-and-kitchen</td> -->
<!--                                     <td>Jul 21, 2020</td> -->
<!--                                     <td> -->
<!--                                         <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a> -->
<!--                                             <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div> -->
<!--                                         </div> -->
<!--                                     </td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <td><strong>Computer &amp; Technologies</strong></td> -->
<!--                                     <td>computer-and-technologies</td> -->
<!--                                     <td>Jul 21, 2020</td> -->
<!--                                     <td> -->
<!--                                         <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a> -->
<!--                                             <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div> -->
<!--                                         </div> -->
<!--                                     </td> -->
<!--                                 </tr> -->
                            </tbody>
                        </table>
                    </div>
                    <div class="ps-section__footer">
                        <p>Show 5 in 30 items.</p>
                        <ul class="pagination">
                            <li><a href="#"><i class="icon icon-chevron-left"></i></a></li>
                            <li class="active"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#"><i class="icon-chevron-right"></i></a></li>
                        </ul>
                    </div>
                </div>
<!--                 <div class="ps-section__right"> -->
<!--                     <form class="ps-form ps-form--new" action="index.html" method="get"> -->
<!--                         <div class="ps-form__content"> -->
<!--                             <div class="form-group"> -->
<!--                                 <label>Name<sup>*</sup> -->
<!--                                 </label> -->
<!--                                 <input class="form-control" type="text" placeholder="Enter category name" /> -->
<!--                             </div> -->
<!--                             <div class="form-group"> -->
<!--                                 <label>Slug<sup>*</sup> -->
<!--                                 </label> -->
<!--                                 <input class="form-control" type="text" placeholder="Enter category slug" /> -->
<!--                             </div> -->
<!--                             <div class="form-group form-group--select"> -->
<!--                                 <label>Parent -->
<!--                                 </label> -->
<!--                                 <div class="form-group__content"> -->
<!--                                     <select class="ps-select" title="Parent"> -->
<!--                                         <option value="1">Parent 1</option> -->
<!--                                         <option value="2">Parent 2</option> -->
<!--                                         <option value="3">Parent 3</option> -->
<!--                                         <option value="4">Parent 4</option> -->
<!--                                     </select> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="form-group"> -->
<!--                                 <label>Description -->
<!--                                 </label> -->
<!--                                 <textarea class="form-control" rows="6" placeholder="Enter category description"></textarea> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="ps-form__bottom"> -->
<!--                             <button class="ps-btn ps-btn--gray">Reset</button> -->
<!--                             <button class="ps-btn ps-btn--sumbit success">Add new</button> -->
<!--                         </div> -->
<!--                     </form> -->
<!--                 </div> -->
<!--             </section> -->
<!--         </div> -->
<!--     </main> -->
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