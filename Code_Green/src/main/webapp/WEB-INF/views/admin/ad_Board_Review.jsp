<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>게시판 관리 페이지</title>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/summernote/summernote-bs4.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/apexcharts-bundle/dist/apexcharts.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_manager.css">
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
                            <li><a href="ad_Notice"><i class="icon-users2"></i>공지 관리</a></li>
                            <li><a href="ad_Board_Management"><i class="icon-papers"></i>게시판 관리</a></li>
                            <li><a href="ad_One_Board"><i class="icon-papers"></i>문의글 관리</a></li>
                            <li><a href="ad_Report_Management"><i class="icon-papers"></i>신고글 관리</a></li>
                        </ul>
                    </div>
                    <div class="ps-sidebar__footer">
                        <div class="ps-copyright"><img src="/Code_Green/resources/img/logo.png" alt="">
                            <p>&copy;2022 최고의 비건마켓 어쩌구. <br/> All rights reversed.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ps-main__wrapper">
            <header class="header--dashboard">
                <div class="header__left">
                    <h3><a href="ad_Board_Management">커뮤니티 </a><a href="ad_Board_Recipe">| 레시피 </a>| 후기 </h3>
                    <p>Board Manager</p>
                </div>
                <div class="header__center">
<!--                     <form class="ps-form--search-bar" action="index.html" method="get"> -->
<!--                         <input class="form-control" type="text" placeholder="Search something" /> -->
<!--                         <button><i class="icon-magnifier"></i></button> -->
<!--                     </form> -->
                </div>
                <div class="header__right"><a class="header__site-link" href="#"><span>메인페이지로 돌아가기</span><i class="icon-exit-right"></i></a></div>
            </header>
            <section class="ps-items-listing">
                <div class="ps-section__header simple">
                    <div class="ps-section__filter">
                    
<!--  키워드 검색기능 구현 sql LIKE 사용하여 원하는 키워드 검색 -->
                        <form class="ps-form--filter" action="ad_member_Manage" method="get">
                            <div class="ps-form__left">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="keyword" placeholder="Search..." >
                                </div>
                                <div class="form-group">
                                    <select class="ps-select" name="searchType">
                                        <option value="id">아이디</option>
                                        <option value="name">이름</option>
                                        <option value="email">이메일</option>
                                    </select>
                                </div>
                            </div>
                            <div class="ps-form__right">
                                <button class="ps-btn ps-btn--gray" type="submit"><i class="icon icon-funnel mr-2"></i>Filter</button>
                            </div>
                        </form>
                    </div>
<!--                     <div class="ps-section__actions"><a class="ps-btn success" href="#"><i class="icon icon-plus mr-2"></i>Add Customer</a></div> -->
                </div>
                <div class="ps-section__content">
                    <div class="table-responsive">


<!--   <tbody>  가운데 정렬 넣음   <tbody>  가운데 정렬 넣음  <tbody>  가운데 정렬 넣음  <tbody>  가운데 정렬 넣음  <tbody>  가운데 정렬 넣음-->
<!--   <tbody>  가운데 정렬 넣음   <tbody>  가운데 정렬 넣음  <tbody>  가운데 정렬 넣음  <tbody>  가운데 정렬 넣음  <tbody>  가운데 정렬 넣음-->


                    
                        <table class="table ps-table" style="text-align: center;">
                            <thead>
                                <tr>
                                	<th>게시판</th>
                                    <th>제목</th>
                                    <th>작성자(아이디)</th>
                                    <th>작성일</th>
                                    <th>조회수</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody >
                            <c:forEach var="rList" items="${reviewList }">
                                <tr>
                                	<td>${rList.board_type }</td>
                                    <td onclick="location.href='ad_Board_Detail'"><strong>${rList.board_subject }</strong></td>
                                    <td>${rList.board_id }</td>
                                    <td>${rList.board_date }</td>
                                    <td>${rList.board_readcount }</td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">삭제하기</a></div>
                                        </div>
                                    </td>
                                </tr>
                               </c:forEach>
                               
<!-- 페이징 처리 해야합니더 페이징 처리 해야합니더 페이징 처리 해야합니더 페이징 처리 해야합니더 -->
<!-- 페이징 처리 해야합니더 페이징 처리 해야합니더 페이징 처리 해야합니더 페이징 처리 해야합니더 -->
<!-- 페이징 처리 해야합니더 페이징 처리 해야합니더 페이징 처리 해야합니더 페이징 처리 해야합니더 -->
                               
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="ps-section__footer">
                    <p>Show 10 in 30 items.</p>
                    <ul class="pagination">
                        <li><a href="#"><i class="icon icon-chevron-left"></i></a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#"><i class="icon-chevron-right"></i></a></li>
                    </ul>
                </div>
            </section>
            
            <section id="pageList">
		<!-- 현재 페이지번호가 시작 페이지번호보다 클 때 현재 페이지번호 - 1 값으로 페이지 이동 -->

			<%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
			<input type="button" value="이전" <%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%>onclick="location.href='ad_Board_Review?pageNum=${pageInfo.pageNum - 1}'"<%} %>>
			<!-- 시작페이지(startPage) 부터 끝페이지(endPage) 까지 페이지 번호 표시 -->
			&nbsp;
			<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
				<!-- 현재 페이지 번호와 i 값이 같을 경우 하이퍼링크 없이 페이지 번호 표시 -->
				<!-- 아니면, pageNum 파라미터를 i 값으로 설정하여 BoardList.bo 서블릿 주소 링크 -->
				<c:choose>
					<c:when test="${i eq pageInfo.pageNum }">${i }</c:when>
					<c:otherwise><a href="ad_Board_Review?pageNum=${i }">${i }</a></c:otherwise>
				</c:choose>
				&nbsp;
			</c:forEach>
		<!-- 현재 페이지번호가 끝 페이지번호보다 작을 때 현재 페이지번호 + 1 값으로 페이지 이동 -->
		<input type="button" value="다음" <%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%>onclick="location.href='ad_Board_Review?pageNum=${pageInfo.pageNum + 1}'"<%} %>>
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