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
    <title>관리자 이원경 페이지</title>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/summernote/summernote-bs4.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/apexcharts-bundle/dist/apexcharts.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_manager.css">
<!-- 차트 API -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
   

</head>

<body>
    <header class="header--mobile">
        <div class="header__left">
            <button class="ps-drawer-toggle"><i class="icon icon-menu"></i></button><img src="" alt="">
        </div>
        <div class="header__center"><a class="ps-logo" href="#"><img src="/Code_Green/resources/img/logo.png" alt=""></a></div>
        <div class="header__right"><a class="header__site-link" href="#"><i class="icon-exit-right"></i></a></div>
    </header>
   
    <div class="ps-site-overlay"></div>
    <main class="ps-main">
        <div class="ps-main__sidebar">
            <div class="ps-sidebar">
                <div class="ps-sidebar__top">
                    <div class="ps-block--user-wellcome">
                        <div class="ps-block__left"><img src="/Code_Green/resources/img/users/admin.jpg" alt="" /></div>
                        <div class="ps-block__right">
                            <p>여기는<a href="#">총관리자</a></p>
                        </div>
                        <div class="ps-block__action"><a href="#"><i class="icon-exit"></i></a></div>
                    </div>
                    <div class="ps-block--earning-count"><small>총매출</small>
                        <h3>3조5억</h3>
                    </div>
                </div>
                <div class="ps-sidebar__content">
                    <div class="ps-sidebar__center">
                        <ul class="menu">
                            <li><a class="active" href="index"><i class="icon-home"></i>매출현황조회</a></li>
                            <li><a href="ad_member_Manage"><i class="icon-users2"></i>회원관리</a></li>
                            <li><a href="ad_Manager_manage"><i class="icon-users2"></i>기업관리</a></li>
                            <li><a href="ad_One_Board"><i class="icon-papers"></i>1:1 문의 관리</a></li>
                            <li><a href="ad_Board_Management"><i class="icon-papers"></i>게시판 관리</a></li>
                            <li><a href="ad_Report_Management"><i class="icon-papers"></i>신고글 관리</a></li>
                            <li><a href="#"><i class="icon-users2"></i>이제...끝?</a></li>
                        </ul>
                    </div>
                    <div class="ps-sidebar__footer">
                        <div class="ps-copyright"><img src="/Code_Green/resources/img/logo.png" alt="">
                            <p>&copy;2022 최고의 비건마켓 어쩌구. <br/> All rights reversed.</p>
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
                <div class="header__center">
<!--                     <form class="ps-form--search-bar" action="index.html" method="get"> -->
<!--                         <input class="form-control" type="text" placeholder="Search something"> -->
<!--                         <button><i class="icon-magnifier"></i></button> -->
<!--                     </form> -->
                </div>
                <div class="header__right"><a class="header__site-link" href="main"><span>메인페이지로 돌아가기</span><i class="icon-exit-right"></i></a></div>
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
                        <br><!-- 여기 어케 수습점ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ -->
                            <h4>브랜드별 매출 순위</h4>
                        </div>
                        <div class="ps-card__content">
                            <div class="table-responsive">
                                <table class="table ps-table">
                                    <thead>
                                        <tr>
                                            <th>Top</th>
                                            <th>브랜드명</th>
                                            <th>매출</th>
                                            <th>팔로워</th>
                                            <th>주문건</th>
                                            <th>취소건</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1위</td>
                                            <td><strong>잇츠베러</strong></td>
                                            <td><a href="order-detail.html"><strong>50,000원</strong></a></td>
                                            <td><span class="ps-badge success">1873명</span>
                                            </td>
                                            <td><span>398건</span>
                                            </td>
                                            <td><strong>37건</strong></td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2위</td>
                                            <td><strong>매일유업</strong></td>
                                            <td><a href="order-detail.html"><strong>30,000원</strong></a></td>
                                            <td><span class="ps-badge success">187명</span>
                                            </td>
                                            <td><span>318건</span>
                                            </td>
                                            <td><strong>35건</strong></td>
                                            <td>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3위</td>
                                            <td><strong>브링그린</strong></td>
                                            <td><a href="order-detail.html"><strong>30,000원</strong></a></td>
                                            <td><span class="ps-badge success">17명</span>
                                            </td>
                                            <td><span>38건</span>
                                            </td>
                                            <td><strong>3건</strong></td>
                                            <td>
                                            </td>
                                        </tr>
                                       
                                        
                                        
<!--   위는 브랜드별 매출 순위   위는 브랜드별 매출 순위    위는 브랜드별 매출 순위  위는 브랜드별 매출 순위 -->
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="ps-card__footer"><a class="ps-card__morelink" href="orders.htmls">순위 더 알아보기(더 수정해야함)<i class="icon icon-chevron-right"></i></a></div>
                    </div>
                </div>
                <div class="ps-section__right">
                    <section class="ps-card ps-card--statics">
                        <div class="ps-card__header">
                            <h4>Total</h4>
                            <div class="ps-card__sortby"><!-- <i class="icon-calendar-empty"></i> -->

                            </div>
                        </div>
                        <div class="ps-card__content">
                            <div class="ps-block--stat yellow">
                                <div class="ps-block__left"><span><i class="icon-cart"></i></span></div>
                                <div class="ps-block__content">
                                    <p>총매출</p>
                                    <h4>25400<small class="asc"><i class="icon-arrow-up"></i></small></h4>
                                </div>
                            </div>
                            <div class="ps-block--stat pink">
                                <div class="ps-block__left"><span><i class="icon-cart"></i></span></div>
                                <div class="ps-block__content">
                                    <p>총주문수</p>
                                    <h4>6,260<small class="asc"><i class="icon-arrow-up"></i></small></h4>
                                </div>
                            </div>
                            <div class="ps-block--stat green">
                                <div class="ps-block__left"><span><i class="icon-cart"></i></span></div>
                                <div class="ps-block__content">
                                    <p>환불/취소 건</p>
                                    <h4>180<small class="desc"><i class="icon-arrow-down"></i></small></h4>
                                </div>
                            </div>
                        </div>
                    </section>

                </div>
            </section>
        </div>
    </main>
    <script src="/Code_Green/resources/plugins_admin/jquery.min.js"></script>
    <script src="/Code_Green/resources/plugins_admin/popper.min.js"></script>
    <script src="/Code_Green/resources/plugins_admin/bootstrap/js/bootstrap.min.js"></script>
    <script src="/Code_Green/resources/plugins_admin/jquery.matchHeight-min.js"></script>
    <script src="/Code_Green/resources/plugins_admin/select2/dist/js/select2.full.min.js"></script>
    <script src="/Code_Green/resources/plugins_admin/summernote/summernote-bs4.min.js"></script>
    <script src="/Code_Green/resources/plugins_admin/apexcharts-bundle/dist/apexcharts.min.js"></script>
    <script src="/Code_Green/resources/js/chart.js"></script>
    <!-- custom code-->
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
        labels: ['잇츠베러', '매일유업', '왕만두', '먹고', '싶다', 'Orange'],
        // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
        datasets: [{
            // ⑤dataset의 이름(String)
            label: '# of Votes',
            // ⑥dataset값(Array)
            data: [364, 19, 3, 5, 2, 3],
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