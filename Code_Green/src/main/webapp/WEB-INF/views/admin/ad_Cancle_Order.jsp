<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>주문취소요청 - 베지터틀</title>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/summernote/summernote-bs4.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/apexcharts-bundle/dist/apexcharts.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_manager.css">
    
    <style type="text/css">
    .header--dashboard .header__left {
    	max-width: 400px;
    }
    
    .header--dashboard > * {
    	flex-basis: 130%;
    	}
    #cancleSuccessList {
    	display: none;
    }
    
    #cancleReturnList {
    	display: none;
    }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		$('#selectBox').change(function() {
    			
			    var result = $('#selectBox option:selected').val();
			    
			    if (result == 'cancleRequest') {
			    	$('#cancleRequestList').show();
			    	$('#cancleSuccessList').hide();
			    	$('#cancleReturnList').hide();
			    } else if (result == 'cancleSuccess') {
			    	$('#cancleSuccessList').show();
			    	$('#cancleRequestList').hide();
			    	$('#cancleReturnList').hide();
			    } else {
			    	$('#cancleReturnList').show();
			    	$('#cancleRequestList').hide();
			    	$('#cancleSuccessList').hide();
			    }
			    
			  }); 
    	});
    	
    	
    </script>
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
    
        <jsp:include page="../inc/ad_menu.jsp"></jsp:include>
        
        <div class="ps-main__wrapper">
            <header class="header--dashboard">
                <div class="header__left">
                    <h3><a href="ad_Cancle_Order">결제취소요청</a></h3>
                    <p>Cancle Order</p>
                </div>
                <div class="header__center">
                </div>
                <div class="header__right"><a class="header__site-link" href="#"><span>메인페이지로 돌아가기</span><i class="icon-exit-right"></i></a></div>
            </header>
            <section class="ps-items-listing">
                <div class="ps-section__header simple">
                    <div class="ps-section__filter">
                        <form class="ps-form--filter" action="ad_One_Board" method="get">
                            <div class="ps-form__left">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="keyword" placeholder="Search..." />
                                </div>
                               <div class="form-group">
                                    <select class="ps-select" name="searchType" id="selectBox">
                                        <option value="cancleRequest">취소요청</option>
                                        <option value="cancleSuccess" onclick="ad_cancleSuccess">승인목록</option>
                                        <option value="cancleReturn" >취소반려</option>
                                    </select>
                                </div>
                            </div>
                            <div class="ps-form__right">
                                <button class="ps-btn ps-btn--gray"><i class="icon icon-funnel mr-2"></i>Filter</button>
                            </div>
                        </form>
                    </div>
<!--                     <div class="ps-section__actions"><a class="ps-btn success" href="#"><i class="icon icon-plus mr-2"></i>Add Customer</a></div> -->
                </div>
                <div class="ps-section__content" id="cancleRequestList">
                    <div class="table-responsive">
                        <table class="table ps-table" style="text-align: center;">
                            <thead>
                                <tr>
                                    <th>금액</th>
                                    <th>주문번호</th>
                                    <th>작성자(아이디)</th>
                                    <th>결제일</th>
                                    <th>처리상태</th>
                                </tr>
                            </thead>
                            <tbody >
                            <c:forEach var="cList" items="${CancleRequest }">
                                <tr>
                                	<td><fmt:formatNumber value="${cList.sell_total_price }" pattern="#,###원"/></td>
                                    <td onclick="location.href='ad_One_Board_Detail?qna_idx=${cList.sell_idx }&id=${cList.sell_idx }'"><strong>${cList.sell_order_number }</strong></td>
                                    <td>${cList.member_id }</td>
                                    <fmt:parseDate var="dateString" value="${cList.sell_pay_date }" pattern="yyyy-MM-ddHH:mm:ss" />	
                      				<td><fmt:formatDate value="${dateString }" pattern="yyyy.MM.dd"/></td>
                                    <td><button type="button" class="btn btn-info" style="font-size: 13px"><strong>${cList.sell_status }</strong></button>
                                    </td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="ad_oneQnaDelete">삭제하기</a></div>
                                        </div>
                                    </td>
                                </tr>
                               </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                
<!-- 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료-->
                
                 <div class="ps-section__content" id="cancleSuccessList">
                    <div class="table-responsive">
                        <table class="table ps-table" style="text-align: center;">
                            <thead>
                                <tr>
                                    <th>금액</th>
                                    <th>주문번호</th>
                                    <th>작성자(아이디)</th>
                                    <th>결제일</th>
                                    <th>처리상태</th>
                                </tr>
                            </thead>
                            <tbody >
                            <c:forEach var="csList" items="${cancleSuccess }">
                                <tr>
                                	<td><fmt:formatNumber value="${csList.sell_total_price }" pattern="#,###원"/></td>
                                    <td onclick="location.href='ad_One_Board_Detail?qna_idx=${csList.sell_idx }&id=${csList.sell_idx }'"><strong>${csList.sell_order_number }</strong></td>
                                    <td>${csList.member_id }</td>
                                    <fmt:parseDate var="dateString" value="${csList.sell_pay_date }" pattern="yyyy-MM-ddHH:mm:ss" />	
                      				<td><fmt:formatDate value="${dateString }" pattern="yyyy.MM.dd"/></td>
                                    <td><button type="button" class="btn btn-info" style="font-size: 13px"><strong>${csList.sell_status }</strong></button>
                                    </td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="ad_oneQnaDelete">삭제하기</a></div>
                                        </div>
                                    </td>
                                </tr>
                               </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                
<!-- 취소반려 취소반려 취소반려 취소반려 취소반려 취소반려 취소반려 취소반려 취소반려 취소반려 취소반려 취소반려 취소반려 취소반려 취소반려 취소반려 취소반려 취소반려-->
                
                 <div class="ps-section__content" id="cancleReturnList">
                    <div class="table-responsive">                    
                        <table class="table ps-table" style="text-align: center;">
                            <thead>
                                <tr>
                                    <th>금액리턴</th>
                                    <th>주문번호</th>
                                    <th>작성자(아이디)</th>
                                    <th>결제일</th>
                                    <th>처리상태</th>
                                </tr>
                            </thead>
                            <tbody >
                            <c:forEach var="crList" items="${cancleReturn }">
                                <tr>
                                	<td><fmt:formatNumber value="${crList.sell_total_price }" pattern="#,###원"/></td>
                                    <td onclick="location.href='ad_One_Board_Detail?qna_idx=${crList.sell_idx }&id=${crList.sell_idx }'"><strong>${crList.sell_order_number }</strong></td>
                                    <td>${crList.member_id }</td>
                                    <fmt:parseDate var="dateString" value="${crList.sell_pay_date }" pattern="yyyy-MM-ddHH:mm:ss" />	
                      				<td><fmt:formatDate value="${dateString }" pattern="yyyy.MM.dd"/></td>
                                    <td><button type="button" class="btn btn-info" style="font-size: 13px"><strong>${crList.sell_status }</strong></button>
                                    </td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="ad_oneQnaDelete">삭제하기</a></div>
                                        </div>
                                    </td>
                                </tr>
                               </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
<!--                <div class="ps-section__footer"> -->
<!--                    페이징 버튼들 시작 -->
<%-- 				                   <%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %> --%>
<!-- 				                    <div class="ps-pagination"> -->
<!-- 				                        <ul class="pagination"> -->
				                           
<%-- 				                            <li><%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%><a href="ad_Cancle_Order?pageNum=${pageInfo.pageNum - 1}&searchType=${searchType }&keyword=${keyword}"><%}%><i class="icon-chevron-left"></i></a></li> --%>
<%-- 				                            <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }"> --%>
<%-- 				                               <c:choose> --%>
<%-- 				                                  <c:when test="${i eq pageInfo.pageNum }"><li class="active"><a href="#">${i }</a></li></c:when> --%>
<%-- 				                                  <c:otherwise><li><a href="ad_Cancle_Order?pageNum=${i }&searchType=${searchType }&keyword=${keyword}">${i }</a></li></c:otherwise> --%>
<%-- 				                               </c:choose> --%>
<%-- 				                            </c:forEach> --%>
<%-- 				                            <li><%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%><a href="ad_Cancle_Order?pageNum=${pageInfo.pageNum + 1}&searchType=${searchType }&keyword=${keyword}"><%}%><i class="icon-chevron-right"></i></a></li> --%>
<!-- 				                        </ul> -->
<!-- 				                    </div> -->
<!-- 				  페이징 버튼들 끝 -->
<!--                 		</div> -->
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
    <!-- custom code-->
    <script src="/Code_Green/resources/js/main_manager.js"></script>
</body>

</html>