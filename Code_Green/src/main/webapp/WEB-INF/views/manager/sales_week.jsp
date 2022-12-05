<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
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
<script>
	$(function(){
		$("#dateSet").click(function(){
			let status = document.querySelector(".dateDiv").style.display;
			if(status == 'none'){
				$(".dateDiv").show();
			} else {
				$(".dateDiv").hide();
			}
			
		});
	});
	
	function searchByDate(period){
		$.ajax({
			url:"sales_management",
			type:"get",
			data:{ period : period },
			success: function(data){
				$(".table_salesList").html(data);
			}
		});
	};

	
</script>
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
                    <h3>정산페이지</h3>
                </div>
                
                
                <div class="header__center">
                    <form class="ps-form--search-bar" action="sales_management" method="get">
                    </form>
                </div>
                <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 이동</span><i class="icon-exit-right"></i></a></div>
            </header>
            <section class="ps-dashboard ps-items-listing">
                <div class="ps-section__left">
                    <div class="table-responsive">
                    

                    
                    
                      <div class="ps-card"> 
                        <div class="ps-card__header">
                        <br>
                            <h4>매출 집계</h4>
                        </div>
                      <div class="options_area">
								<select name="searchDate" onchange="searchByDate(this.value)" required >    
									<option value="">기간조회</option>    
									<option value="1">1개월</option>    
									<option value="2">2개월</option>    
									<option value="6">6개월</option>    
								</select>
								<input type="button" name="searchDateSet" id="dateSet" value="+상세조회">
								</div>
								<div class="dateDiv" style="display: none;">
									<form action="sales_management"  id="dates" method=get>
										<input type="date" name="date1" required="required"> - <input type="date" name="date2" required="required">
										<input type="submit" id="dateSet" value="검색" >
										<input type="reset" id="dateSet" value="초기화" >
									</form>
								</div>
                       
                    <table class="table ps-table">
                          <thead>
                             <label for="date">날짜를 선택하세요:
							  		<input type="date"
							         id="date"
							         max="2077-06-20"
							         min="2077-06-05"
							         value="2077-06-15">
                              <tr>
                              
<!--                                    <th>총매출</th><br> -->
<!--                                    <th>이번달매출</th><br> -->
<!--                                     <th>이번주매출</th><br> -->
<!--                                     <th>오늘매출</th><br> -->
<!--                                     <th>순수익</th><br> -->
                              </tr>
                          </thead>
                          <tbody>
                           <tr>       
                          <td><strong>총 매출</strong></td>
                           <td>${salesTotal}</td>
                                </tr>
                           <tr>       
                                  <tr>    
                                  <td><h3><strong>월별 매출</strong></h3></td>
                                  <td>${salesMonth}</td>
                                  </tr>
                                  <tr>
                                  <td><h3><strong>주별 매출</strong></h3></td>
                                  <td>${salesWeek}</td>
                                 </tr>
                                 <tr>
                                  <td><h3><strong>일별 매출</strong></h3></td>
                                 <td>${salesday}</td>
                                  </tr>
                                  <tr>
                                 <td><h3><strong>순수익</strong></h3></td>
<%--                                   <td><fmt:formatNumber value="${sellTotal.net}" pattern="#,###원" /><small class="asc"></small></td>  --%>
                              </tr>
                              
                              <tr>
                              <c:forEach var="salesList" items="${salesList }">
                               <tr>
                              	<fmt:parseDate var="dateString" value="${salesList.sell_date }" pattern="yyyy-MM-dd HH:mm:ss" />
        					<td>
        					<span><fmt:formatDate value="${dateString }" type="date" pattern="yyyy.MM.dd HH:mm:ss" /></span>
        					</td>
                                  <td>
                                     <div class="ps-product--cart">
                                          <div class="ps-product__content"><a href="sales_management">${salesList.sell_order_number }</a></div>
                                      </div>
                                  </td>
                                  <td><fmt:formatNumber value="${salesTotal.salesTotal}" pattern="#,###원" /><small class="asc"></small></td>
                                  <td><fmt:formatNumber value="${salesList.brandtotal}" pattern="#,###원" /><small class="asc"></small></td>
                                  <td><fmt:formatNumber value="${salesList.salesMonth}" pattern="#,###원" /><small class="asc"></small></td>
                                  <td><fmt:formatNumber value="${salesList.salesWeek}" pattern="#,###원" /><small class="asc"></small></td>
                                  <td><fmt:formatNumber value="${salesList.commission.net}" pattern="#,###원" /><small class="asc"></small></td>
                             
                              </c:forEach>
                          </tbody>
                      </table>
                      


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