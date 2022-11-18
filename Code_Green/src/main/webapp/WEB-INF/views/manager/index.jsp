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
<!-- 차트 API -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
   

</head>

<body>
    <header class="header--mobile">
        <div class="header__left">
            <button class="ps-drawer-toggle"><i class="icon icon-menu"></i></button><img src="" alt="">
        </div>
        <div class="header__center"><a class="ps-logo" href="#"><img src="img/logo.png" alt=""></a></div>
        <div class="header__right"><a class="header__site-link" href="#"><i class="icon-exit-right"></i></a></div>
    </header>
   
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
                        <div class="ps-block__action"><a href=""><i class="icon-exit"></i></a></div>
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
<!-- 				                <li><a href="brand_mypage_modify"><i class="icon-cog"></i>브랜드정보수정</a></li> -->
                        
                        </ul>
                    </div>
                    </aside>
                    <div class="ps-sidebar__footer">
                        <div class="ps-copyright"><img src="img/logo.png" alt="">
                            <p>&copy;2022 CODEGREEN <br/> All rights reversed.</p>
                        </div>`
                    </div>
                </div>
            </div>
        </div>
        <div class="ps-main__wrapper">
            <header class="header--dashboard">
                <div class="header__left">
                    <h3>매출현황</h3>
                    <p>Sales Status</p>
                </div>
                <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 돌아가기</span><i class="icon-exit-right"></i></a></div>
            </header>
            <section class="ps-dashboard">
                <div class="ps-section__left">
                    <div class="row">
                        <div class="col-md-11">
                        
                        
                        <canvas id="myChart" width="800" height="400"></canvas>
                        
<!-- 원래차트 원래차트 원래차트 원래차트 원래차트 원래차트-->
<!--                             <div class="ps-card ps-card--sale-report"> -->
<!--                                 <div class="ps-card__header"> -->
<!--                                     <h4>Sales Reports</h4> -->
<!--                                 </div> -->
<!--                                 <div class="ps-card__content"> -->
<!--                                     <div id="chart"></div> -->
<!--                                 </div> -->
<!--                                 <div class="ps-card__footer"> -->
<!--                                     <div class="row"> -->
<!--                                         <div class="col-md-8"> -->
<!--                                             <p>Items Earning Sales ($)</p> -->
<!--                                         </div> -->
<!--                                         <div class="col-md-4"><a href="#">Export Report<i class="icon icon-cloud-download ml-2"></i></a></div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                        </div>
                        
<!-- 도넛차트 도넛차트 도넛차트 도넛차트 도넛차트 도넛차트-->

                    </div>
                     <div class="ps-card">
                        <div class="ps-card__header">
                         <td><a href="orders"><strong><h4>최근 주문</h4></strong></a></td>
                            
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
                                    <td><a href="order-detail"><strong>Unero Black Military</strong></a></td>
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
                                <tr>
                                    <td>#B260</td>
                                    <td><strong> Aug, 15, 2020</strong></td>
                                    <td><a href="order-detail"><strong>Marsh Speaker</strong></a></td>
                                    <td><span class="ps-badge gray">미결제</span>
                                    </td>
                                    <td><span class="ps-fullfillment success">배송 접수</span>
                                    </td>
                                    <td><strong>$56.00</strong></td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>#A583</td>
                                    <td><strong> Aug, 15, 2020</strong></td>
                                    <td><a href="order-detail"><strong>Lined Blend T-Shirt</strong></a></td>
                                    <td><span class="ps-badge success">결제</span>
                                    </td>
                                    <td><span class="ps-fullfillment warning">주문 접수</span>
<!--                                     </td>order In Progress -->
                                    <td><strong>$516.00</strong></td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>#A583</td>
                                    <td><strong> Aug, 15, 2020</strong></td>
                                    <td><a href="order-detail"><strong>DJI MAcvic Quadcopter</strong></a></td>
                                    <td><span class="ps-badge gray">미결제</span>
                                    </td>
                                    <td><span class="ps-fullfillment success">배송 접수</span>
                                    </td>
                                    <td><strong>$112.00</strong></td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>#A112</td>
                                    <td><strong> Aug, 15, 2020</strong></td>
                                    <td><a href="order-detail"><strong>Black T-Shirt</strong></a></td>
                                    <td><span class="ps-badge success">결제</span>
                                    </td>
                                    <td><span class="ps-fullfillment danger">주문 취소</span>
                                    </td>
                                    <td><strong>$30.00</strong></td>
                                    <td>
                                                <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div>
                                                </div>
                                            </td>
                                        </tr>
                                       
                                        
                                        
<!--   위는 브랜드별 매출 순위   위는 브랜드별 매출 순위    위는 브랜드별 매출 순위  위는 브랜드별 매출 순위 -->
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
<!--                         <div class="ps-card__footer"><a class="ps-card__morelink" href="orders">순위 더 알아보기(더 수정해야함)<i class="icon icon-chevron-right"></i></a></div> -->
                    </div>
                </div>
               <div class="ps-section__right">
                    <section class="ps-card ps-card--statics">
                        <div class="ps-card__header">
                            <h4>Statics</h4>
                            <div class="ps-card__sortby"><i class="icon-calendar-empty"></i>
                                <div class="form-group--select">
                                    <select class="form-control">
                                        <option value="1">Last 30 days</option>
                                        <option value="2">Last 90 days</option>
                                        <option value="3">Last 180 days</option>
                                    </select><i class="icon-chevron-down"></i>
                                </div>
                            </div>
                        </div>
                       <div class="ps-card__content">
                            <div class="ps-block--stat yellow">
                                <div class="ps-block__left"><span><i class="icon-cart"></i></span></div>
                                <div class="ps-block__content">
                                    <p>총주문수</p>
                                    <h4>254<small class="asc"><i class="icon-arrow-up"></i><span>12,5%</span></small></h4>
                                </div>
                            </div>
                            <div class="ps-block--stat pink">
                                <div class="ps-block__left"><span><i class="icon-cart"></i></span></div>
                                <div class="ps-block__content">
                                    <p>총누적금액</p>
                                    <h4>$6,260<small class="asc"><i class="icon-arrow-up"></i><span>7.1%</span></small></h4>
                                </div>
                            </div>
                            <div class="ps-block--stat green">
                                <div class="ps-block__left"><span><i class="icon-cart"></i></span></div>
                                <div class="ps-block__content">
                                    <p>이번달누적금액</p>
                                    <h4>$2,567<small class="desc"><i class="icon-arrow-down"></i><span>0.32%</span></small></h4>
                                </div>
                            </div>
                        </div>
                    </section>

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
    <script src="/Code_Green/resources/js/chart.js"></script>
    <script src="/Code_Green/resources/js/main_manager.js"></script>
    
<!-- 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API -->
<!-- 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API -->
<!-- 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API -->
    
    <script type="text/javascript">
// 차트를 그럴 영역을 dom요소로 가져온다.
var chartArea = document.getElementById('myChart').getContext('2d');
// 차트를 생성한다. 
var myChart = new Chart(chartArea, {
    // ①차트의 종류(String)
    type: 'bar',
    // ②차트의 데이터(Object)
    data: {
        // ③x축에 들어갈 이름들(Array)
        labels: ['베지가든', '매일유업', '풀무원', '이츠리얼', '삼삼물산', '그릭데이'],
        // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
        datasets: [{
            // ⑤dataset의 이름(String)
            label: '# of Votes',
            // ⑥dataset값(Array)
            data: [364, 150, 30, 50, 22, 80],
            // ⑦dataset의 배경색(rgba값을 String으로 표현)
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            // ⑧dataset의 선 색(rgba값을 String으로 표현)
            borderColor: 'rgba(255, 99, 132, 1)',
            // ⑨dataset의 선 두께(Number)
            borderWidth: 1
        }]
    },
    // ⑩차트의 설정(Object)
    options: {
        // ⑪축에 관한 설정(Object)
        scales: {
            // ⑫y축에 대한 설정(Object)
            y: {
                // ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
                beginAtZero: true
            }
        }
    }
});
</script>
</body>

</html>