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
    <title>브랜드관리자페이지</title>
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
                            <p>&copy;2022 CODE GREEN. <br/> All rights reversed.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ps-main__wrapper">
            <header class="header--dashboard">
                <div class="header__left">
                    <h3>매출관리</h3>
<!--                     <p>Everything here</p> -->
                </div>
                <div class="header__center">
                    <form class="ps-form--search-bar" action="index.html" method="get">
                        <input class="form-control" type="text" placeholder="Search something">
                        <button><i class="icon-magnifier"></i></button>
                    </form>
                </div>
                <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 이동</span><i class="icon-exit-right"></i></a></div>
            </header>
            <section class="ps-dashboard">
                <div class="ps-section__left">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="ps-card ps-card--sale-report">
                                <div class="ps-card__header">
                                 <h4><a href="sales_management.jsp">매출 현황</a></h4>
                                </div>
                                <div class="ps-card__content">
                                    <div id="chart"></div>
                                </div>
                                <div class="ps-card__footer">
                                    <div class="row">
                                        <div class="col-md-8">
<!--                                             <p>Items Earning Sales ($)</p> -->
                                        </div>
<!--                                         <div class="col-md-4"><a href="#">Export Report<i class="icon icon-cloud-download ml-2"></i></a></div> -->
                                    </div>
                                </div>
                            </div>
                        </div>
<!--                         <div class="col-md-4"> -->
<!--                             <div class="ps-card ps-card--earning"> -->
<!--                                 <div class="ps-card__header"> -->
<!--                                     <h4>총매출</h4> -->
<!--                                 </div> -->
<!--                                 <div class="ps-card__content"> -->
<!--                                     <div class="ps-card__chart"> -->
<!--                                         <div id="donut-chart"></div> -->
<!--                                         <div class="ps-card__information"><i class="icon icon-wallet"></i><strong>$12,560</strong><small>Balance</small></div> -->
<!--                                     </div> -->
<!--                                     <div class="ps-card__status"> -->
<!--                                         <p class="yellow"><strong> $20,199</strong><span>소득</span></p> -->
<!--                                         <p class="red"><strong> $1,021</strong><span>세금</span></p> -->
<!--                                         <p class="green"><strong> $992.00</strong><span>수수료</span></p> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->


<!-- <div class="ps-card"> -->
                        <div class="ps-card__header">
                        <br>
                            <h4>매출 집계</h4>
                        </div>
                        <div class="ps-card__content">
                            <div class="table-responsive">
                                <table class="table ps-table">
                                    <thead>
                                        <tr>
                                            <th>판매순위</th>
                                            <th>제품명</th>
                                            <th>매출</th>
                                            <th>누적판매량</th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1위</td>
                                            <td><strong>두부면</strong></td>
                                            <td><a href="order-detail.html"><strong>50,000원</strong></a></td>
<!--                                             <td><span class="ps-badge success">1873명</span> -->
                                            <td><span>398건</span>
                                            </td>
<!--                                             <td><strong>37건</strong></td> -->
                                            <td>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2위</td>
                                            <td><strong>두부텐더</strong></td>
                                            <td><a href="order-detail.html"><strong>30,000원</strong></a></td>
<!--                                             <td><span class="ps-badge success">187명</span> -->
                                            <td><span>318건</span>
                                            </td>
<!--                                             <td><strong>35건</strong></td> -->
                                            <td>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3위</td>
                                            <td><strong>비건마들렌</strong></td>
                                            <td><a href="order-detail.html"><strong>30,000원</strong></a></td>
<!--                                             <td><span class="ps-badge success">17명</span> -->
                                            <td><span>38건</span>
                                            </td>
<!--                                             <td><strong>3건</strong></td> -->
                                            <td>
                                            </td>
                                        </tr>
                                       </tbody>
                                       </table>
                                       </div>
                                       </div>
                                       </div>
                                       </div>
                                  
<!--                     <div class="ps-card"> -->
<!--                         <div class="ps-card__header"> -->
<!--                          <td><a href="orders.jsp"><strong><h4>최근 주문</h4></strong></a></td> -->
                            
<!--                         </div> -->
<!--                         <div class="ps-card__content"> -->
<!--                             <div class="table-responsive"> -->
<!--                                 <table class="table ps-table"> -->
<!--                                     <thead> -->
<!--                                        <tr> -->
<!--                                     <th>상품번호</th> -->
<!--                                     <th>날짜</th> -->
<!--                                     <th>상품명</th> -->
<!--                                     <th>결제</th> -->
<!--                                     <th>주문상태</th> -->
<!--                                     <th>총금액</th> -->
<!--                                     <th></th> -->
<!--                                 </tr> -->
<!--                                     </thead> -->
<!--                                     <tbody> -->
<!--                                       <tr> -->
<!--                                           <tr> -->
<!--                                     <td>#A580</td> -->
<!--                                     <td><strong> Aug, 15, 2020</strong></td> -->
<!--                                     <td><a href="order-detail.html"><strong>Unero Black Military</strong></a></td> -->
<!--                                     <td><span class="ps-badge success">결제</span> -->
<!--                                     </td> -->
<!--                                     <td><span class="ps-fullfillment success">배송</span> -->
<!--                                     </td> -->
<!--                                     <td><strong>$56.00</strong></td> -->
<!--                                     <td> -->
<!--                                         <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a> -->
<!--                                             <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div> -->
<!--                                         </div> -->
<!--                                     </td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <td>#B260</td> -->
<!--                                     <td><strong> Aug, 15, 2020</strong></td> -->
<!--                                     <td><a href="order-detail.html"><strong>Marsh Speaker</strong></a></td> -->
<!--                                     <td><span class="ps-badge gray">미결제</span> -->
<!--                                     </td> -->
<!--                                     <td><span class="ps-fullfillment success">배송 접수</span> -->
<!--                                     </td> -->
<!--                                     <td><strong>$56.00</strong></td> -->
<!--                                     <td> -->
<!--                                         <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a> -->
<!--                                             <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div> -->
<!--                                         </div> -->
<!--                                     </td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <td>#A583</td> -->
<!--                                     <td><strong> Aug, 15, 2020</strong></td> -->
<!--                                     <td><a href="order-detail.html"><strong>Lined Blend T-Shirt</strong></a></td> -->
<!--                                     <td><span class="ps-badge success">결제</span> -->
<!--                                     </td> -->
<!--                                     <td><span class="ps-fullfillment warning">주문 접수</span> -->
<!-- <!--                                     </td>order In Progress --> 
<!--                                     <td><strong>$516.00</strong></td> -->
<!--                                     <td> -->
<!--                                         <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a> -->
<!--                                             <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div> -->
<!--                                         </div> -->
<!--                                     </td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <td>#A583</td> -->
<!--                                     <td><strong> Aug, 15, 2020</strong></td> -->
<!--                                     <td><a href="order-detail.html"><strong>DJI MAcvic Quadcopter</strong></a></td> -->
<!--                                     <td><span class="ps-badge gray">미결제</span> -->
<!--                                     </td> -->
<!--                                     <td><span class="ps-fullfillment success">배송 접수</span> -->
<!--                                     </td> -->
<!--                                     <td><strong>$112.00</strong></td> -->
<!--                                     <td> -->
<!--                                         <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a> -->
<!--                                             <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div> -->
<!--                                         </div> -->
<!--                                     </td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <td>#A112</td> -->
<!--                                     <td><strong> Aug, 15, 2020</strong></td> -->
<!--                                     <td><a href="order-detail.html"><strong>Black T-Shirt</strong></a></td> -->
<!--                                     <td><span class="ps-badge success">결제</span> -->
<!--                                     </td> -->
<!--                                     <td><span class="ps-fullfillment danger">주문 취소</span> -->
<!--                                     </td> -->
<!--                                     <td><strong>$30.00</strong></td> -->
<!--                                     <td> -->
<!--                                                 <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a> -->
<!--                                                     <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div> -->
<!--                                                 </div> -->
<!--                                             </td> -->
<!--                                         </tr> -->
<!--                                     </tbody> -->
<!--                                 </table> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="ps-card__footer"><a class="ps-card__morelink" href="orders.htmls">View Full Orders<i class="icon icon-chevron-right"></i></a></div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="ps-section__right"> -->
<!--                     <section class="ps-card ps-card--statics"> -->
<!--                         <div class="ps-card__header"> -->
<!--                             <h4>Statics</h4> -->
<!--                             <div class="ps-card__sortby"><i class="icon-calendar-empty"></i> -->
<!--                                 <div class="form-group--select"> -->
<!--                                     <select class="form-control"> -->
<!--                                         <option value="1">Last 30 days</option> -->
<!--                                         <option value="2">Last 90 days</option> -->
<!--                                         <option value="3">Last 180 days</option> -->
<!--                                     </select><i class="icon-chevron-down"></i> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="ps-card__content"> -->
<!--                             <div class="ps-block--stat yellow"> -->
<!--                                 <div class="ps-block__left"><span><i class="icon-cart"></i></span></div> -->
<!--                                 <div class="ps-block__content"> -->
<!--                                     <p>총주문수</p> -->
<!--                                     <h4>254<small class="asc"><i class="icon-arrow-up"></i><span>12,5%</span></small></h4> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="ps-block--stat pink"> -->
<!--                                 <div class="ps-block__left"><span><i class="icon-cart"></i></span></div> -->
<!--                                 <div class="ps-block__content"> -->
<!--                                     <p>총누적금액</p> -->
<!--                                     <h4>$6,260<small class="asc"><i class="icon-arrow-up"></i><span>7.1%</span></small></h4> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="ps-block--stat green"> -->
<!--                                 <div class="ps-block__left"><span><i class="icon-cart"></i></span></div> -->
<!--                                 <div class="ps-block__content"> -->
<!--                                     <p>이번달누적금액</p> -->
<!--                                     <h4>$2,567<small class="desc"><i class="icon-arrow-down"></i><span>0.32%</span></small></h4> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </section> -->
<!--                     <section class="ps-card ps-card--top-country"> -->
<!--                         <div class="ps-card__header"> -->
<!--                             <h4>Top Countries</h4> -->
<!--                         </div> -->
<!--                         <div class="ps-card__content"> -->
<!--                             <div class="row"> -->
<!--                                 <div class="col-6"> -->
<!--                                     <figure class="organge"> -->
<!--                                         <figcaption>United States</figcaption><strong>80%</strong> -->
<!--                                     </figure> -->
<!--                                 </div> -->
<!--                                 <div class="col-6"> -->
<!--                                     <figure class="red"> -->
<!--                                         <figcaption>United Kingdom</figcaption><strong>65%</strong> -->
<!--                                     </figure> -->
<!--                                 </div> -->
<!--                                 <div class="col-6"> -->
<!--                                     <figure class="green"> -->
<!--                                         <figcaption>Germany</figcaption><strong>65%</strong> -->
<!--                                     </figure> -->
<!--                                 </div> -->
<!--                                 <div class="col-6"> -->
<!--                                     <figure class="cyan"> -->
<!--                                         <figcaption>Russia</figcaption><strong>35%</strong> -->
<!--                                     </figure> -->
<!--                                 </div> -->
<!--                             </div><img src="img/map-and-bundle.png" alt=""> -->
<!--                             <p>We only started collecting region data from January 2015</p> -->
<!--                         </div> -->
<!--                     </section> -->
<!--                 </div> -->
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
    <script src="/Code_Green/resources/js/chart.js"></script>
    <script src="/Code_Green/resources/js/main_manager.js"></script>
</body>

</html>