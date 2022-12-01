<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="icon" href="/Code_Green/resources/img/favicon.png">
    <link href="favicon.png" rel="icon">
    <title>브랜드관리자페이지</title>
	<link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/summernote/summernote-bs4.min.css">
<!--     <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/apexcharts-bundle/dist/apexcharts.css"> -->
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
   
    <div class="ps-site-overlay"></div>
    <main class="ps-main">
    
     <jsp:include page="../inc/manager_menu.jsp"></jsp:include>
        <div class="ps-main__wrapper">
            <header class="header--dashboard">
                <div class="header__left">
                    <h3>매출관리</h3>
                </div>
                <div class="header__center">
                    <form class="ps-form--search-bar" action="sales_main" method="get">
<!--                         <input class="form-control" type="text" placeholder="Search something"> -->
<!--                         <button><i class="icon-magnifier"></i></button> -->
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
                        

					<div class="ps-card">
                        <div class="ps-card__header">
                        <br>
                           <h4>베스트상품</h4>
                        </div>
                        <div class="ps-card__content">
                            <div class="table-responsive">
                                <table class="table ps-table">
                                    <thead>
                                        <tr>
                                            <th>Top</th>
                                            <th>상품명</th>
                                            <th>후기</th>
                                            <th>좋아요</th>
                                            <th>평점</th>
                                            <th>판매수량</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="top" items="${top3 }">
                                        <tr>
                                            <td>${top.ranking }위</td>
                                            <td><strong>${top.item_name}</strong></td>
                                            <td><a href=""><strong>${top.review}개</strong></a></td>
                                            <td><span><strong>${top.heart }개</strong></span></td>
                                            <td><strong>${top.board_star_score }점</strong></td>
                                            <td><span><strong>${top.count }개</strong></span></td>
                                        </tr>
                                        </c:forEach>
                                        
                                       
                                        
                                        
<!--   위는 브랜드별 매출 순위   위는 브랜드별 매출 순위    위는 브랜드별 매출 순위  위는 브랜드별 매출 순위 -->
                                        
                                    </tbody>
                                </table>
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
<!--     <script src="/Code_Green/resources/plugins_manager/apexcharts-bundle/dist/apexcharts.min.js"></script> -->
    <script src="/Code_Green/resources/js/chart.js"></script>
    <script src="/Code_Green/resources/js/main_manager.js"></script>
</body>

</html>