<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <title>커뮤니티 - 글 상세</title>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/slick/slick/slick.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/nouislider/nouislider.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/lightGallery-master/dist/css/lightgallery.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
</head>
<script type="text/javascript">

	function deleteCheck(){
		return confirm("삭제하시겠습니까?\n삭제 시 복구가 불가능합니다.");
	}

	
	function forwardReply(){
		var sId = ;
		// 세션 아이디가 있을 경우에만 쓰기 동작 수행 -> 세션 아이디 없으면 경고 출력 후 중단
		if(${sessionScope.sId} != null){
		
		var content = document.getElementById("reply_content").value;
		
		// notice_content_reply_writePro.jsp 페이지로 포워딩
		// => 파라미터 : 글번호,작성자(세션아이디), 댓글내용, 댓글게시판 타입(driver)
		location.href = "#";
		
		} else {
			alert("댓글은 로그인 후 사용가능합니다!");
		}
		
	}
</script>
<body>
    
    <!-- 헤더 삽입 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 삽입 -->
    
    
   <!-- 블로그 바디 시작  -->
    <div class="ps-page--blog">
        <div class="container">
            <div class="ps-blog--sidebar">
                <div class="ps-blog__left">
                    <div class="ps-post--detail sidebar">
                    
                        <!-- 블로그 헤더 시작  -->
                        <div class="ps-post__header">
                        	<div class="colorheaderhead">
                            <h2>${cBoard.board_subject }</h2>
                            <p>
	                            [${cBoard.board_category }] 
	                    		<fmt:parseDate var="dateString" value="${cBoard.board_date}" pattern="yyyyMMdd" />
		                        / <fmt:formatDate value="${dateString }" pattern="yyyy.MM.dd" />
	                            / ${cBoard.board_id }
	                            / 조회수 ${cBoard.board_readcount }
	                            / 댓글(45) 
                            </p>
                            </div>
                        </div>
                        <!-- 블로그 헤더 끝  -->
                        
                        <!-- 블로그 본문 시작  -->
                        <div class="ps-post__content">
                        	<p>${cBoard.board_content }
                        	<p><img src="/Code_Green/resources/img/홍콩센트럴소호비건레스토랑.jpg">
                        </div>
                       	<!-- 태그를...쓸건가? -->
<!--                         <div class="ps-post__footer"> -->
<!--                             <p class="ps-post__tags">Tags:<a href="#">business</a><a href="#">technology</a></p> -->
<!--                         </div> -->



			   <!-- 신고하기 / 추천하기 버튼 시작 -->
				
				
				<div class="form-group-comm">
                        <button class="ps-btn-report">신고하기</button>
                        <button class="ps-btn-best">추천하기</button>
                </div>
				
			   <!-- 신고하기 / 추천하기 버튼 끝 -->
			   <!-- ========================================= 댓글 영역 ========================================= -->
			   
			   
               <div class="ps-post-comments">
                <h4> 댓글 (3) </h4>
                <div class="ps-block--comment">
                    <div class="ps-block__thumbnail">
                    	<img src="http://1.gravatar.com/avatar/af7935f33b10cec23f77b8d9717641df?s=70&amp;d=mm&amp;r=g">
                    </div>
                    <div class="ps-block__content">
                        <h5>고리라<small>2022년 11월 08일 오후 6시 43분</small></h5>
                        <p>오늘 저녁메뉴는 맥도날드구요. 아직 메뉴는 못정했는데, 세트먹고 감자튀김은 소금빼서 받을생각 입니다. 이의있으신가요?</p>
                        <a class="ps-block__reply" href="#">답글</a>
                    </div>
                </div>
                
                <div class="ps-block--comment">
                    <div class="ps-block__thumbnail"><img src="http://2.gravatar.com/avatar/b2c1febfd11117eef66c351c1d4c10f1?s=70&amp;d=mm&amp;r=g"></div>
                    <div class="ps-block__content">
                        <h5>김춘배<small>2022년 11월 05일 오후 2시 4분</small></h5>
                        <p>마!니 이정도면 고양이 중독이담ㅁ ㅏ!!!!!!!!!!</p><a class="ps-block__reply" href="#">답글</a>
                        
                        <div class="ps-block--comment">
                            <div class="ps-block__thumbnail"><img src="http://2.gravatar.com/avatar/25df3939b2e33bd19783411afd5bc6e3?s=70&amp;d=mm&amp;r=g"></div>
                            <div class="ps-block__content">
                                <h5>황애옹<small>2022년 11월 08일 오후 6시 43분</small></h5>
                                <p>심각한고양이중독입니다. 마음의준비애옹</p><a class="ps-block__reply" href="#">답글</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
                <!-- 댓글쓰기 영역 -->
                <form class="ps-form--post-comment" action="do_action" method="post">
                    <h4>댓글 쓰기</h4>
                    <div class="form-group">
                        <textarea class="form-control" rows="4" placeholder="댓글을 입력하세요" required></textarea>
                    </div>
                    <div class="form-group submit">
                        <button class="ps-btn"> 댓글입력</button>
                    </div>
                </form>
            </div>
             <!-- ========================================= 댓글 영역 ========================================= -->
             <hr>
                        
                        
                    </div>
                </div>
                
                <!-- 오른쪽 메뉴 시작  -->
                <div class="ps-blog__right">
                    <aside class="widget widget--blog widget--recent-post">
	                        <div class="widget__content">
		                        <a href="/Code_Green"><i class="fi fi-rr-home"></i> 메인 홈</a>
		                        <a href="CommunityList.bo"><i class="fi fi-rr-list"></i> 목록 보기</a>
		                        <a href="CommunityWrite.bo"><i class="fi fi-rr-edit"></i> 새글 쓰기</a>
		                        <c:if test="${cBoard.board_id eq sessionScope.sId }">
			                        <a href="CommunityModify.bo"><i class="fi fi-rr-scissors"></i> 글 수정</a>
			                        <a href="CommunityDelete.bo?board_idx=${cBoard.board_idx }&pageNum=${param.pageNum }" onclick="return deleteCheck();"><i class="fi fi-rr-cross-circle"></i> 글 삭제</a>
		                        </c:if>
	                        </div>
                    </aside>
                </div>
                <!-- 오른쪽 메뉴 끝  -->
                
            </div>
        </div>
        
    </div>
    
    <!-- 맨위로 올라가는 화살표버튼! 지우지마세요! -->
	<div id="back2top">
		<i class="icon icon-arrow-up"></i>
	</div>
	<!-- 맨위로 올라가는 화살표버튼! 지우지마세요! -->
    
    <!-- 푸터 삽입 -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
    <!-- 푸터 삽입 -->
    
    <script src="/Code_Green/resources/plugins/jquery.min.js"></script>
    <script src="/Code_Green/resources/plugins/nouislider/nouislider.min.js"></script>
    <script src="/Code_Green/resources/plugins/popper.min.js"></script>
    <script src="/Code_Green/resources/plugins/owl-carousel/owl.carousel.min.js"></script>
    <script src="/Code_Green/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="/Code_Green/resources/plugins/imagesloaded.pkgd.min.js"></script>
    <script src="/Code_Green/resources/plugins/masonry.pkgd.min.js"></script>
    <script src="/Code_Green/resources/plugins/isotope.pkgd.min.js"></script>
    <script src="/Code_Green/resources/plugins/jquery.matchHeight-min.js"></script>
    <script src="/Code_Green/resources/plugins/slick/slick/slick.min.js"></script>
    <script src="/Code_Green/resources/plugins/jquery-bar-rating/dist/jquery.barrating.min.js"></script>
    <script src="/Code_Green/resources/plugins/slick-animation.min.js"></script>
    <script src="/Code_Green/resources/plugins/lightGallery-master/dist/js/lightgallery-all.min.js"></script>
    <script src="/Code_Green/resources/plugins/sticky-sidebar/dist/sticky-sidebar.min.js"></script>
    <script src="/Code_Green/resources/plugins/select2/dist/js/select2.full.min.js"></script>
    <script src="/Code_Green/resources/plugins/gmap3.min.js"></script>
    <!-- custom scripts-->
    <script src="/Code_Green/resources/js/main.js"></script>
</body>

</html>