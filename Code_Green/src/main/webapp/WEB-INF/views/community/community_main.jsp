<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>커뮤니티</title>
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
    <link rel="stylesheet" href="/Code_Green/resources/css/market-place-1.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
</head>
<body>
   
   
    <!-- 헤더 삽입 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 삽입 -->
   
   
   
    <div class="ps-page--single">
        <div class="ps-breadcrumb">
            <div class="container">
                <ul class="breadcrumb">
                    <li><a href="/Code_Green">Home</a></li>
                    <li><a href="community_main">커뮤니티</a></li>
                </ul>
            </div>
        </div>
    </div>
    
    
    <div class="ps-vendor-dashboard">
        <div class="container">
            <div class="ps-section__header">
                <h3>Community</h3>
                <p>지구와 환경을 위한 발걸음, 여러분의 실천들을 공유해주세요.<br>함께하면 더욱 즐겁게 멀리 갈 수 있습니다.</p>
                
            </div>
            <div class="ps-section__content">
                <ul class="ps-section__links">
                    <li><a href="welcome_vegun">어서와,비건은 처음이지?</a></li>
                    <li class="active"><a href="CommunityList.bo">커뮤니티</a></li>
                    <li><a href="#">캠페인</a></li>
                </ul>
                <div class="ps-block--vendor-dashboard">
<!--                     <div class="ps-block__header"> -->
<!--                         <h3>게시판</h3> -->
<!--                     </div> -->
                    	<div class="ps-block__content">
		                        <div class="table-responsive">
		                            <table class="table ps-table ps-table--vendor">
		                                <thead>
		                                    <tr>
		                                        <th>번호</th>
		                                        <th>말머리</th>
		                                        <th>제목</th>
		                                        <th>작성자</th>
		                                        <th>작성일</th>
		                                        <th>조회수</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                               	 <c:forEach var="board" items="${communityList }">
		                                    <tr>
		                                        <td>${board.board_idx }</td>
		                                        <td>[${board.board_category }]</td>
		                                        <td><a href="communityDetail.bo">${board.board_subject }</a></td>
		                                        <td>${board.board_id }</td>
		                                        <td>${board.board_date }</td>
		                                        <td>${board.board_readcount }</td>
		                                    </tr>
		                                 </c:forEach>
		                                </tbody>
		                            </table>
		                        </div>
                        
                         
                         
                         
                      
                       
                        
                   <!-- 검색 부분  -->
                  <div id="widget-search-select" align="right">
	                 <form class="ps-form--widget-search" action="CommunityList.bo" method="get">
                         <select name="searchType">
                               <option value="">카테고리</option>
                               <option value="category">말머리</option>
                               <option value="id">작성자</option>
                               <option value="subject">제목</option>
                               <option value="content">내용</option>
                               <option value="subject_content">제목&내용</option>
                          </select>
                          <aside class="widget widget--blog widget--search">
	                            <input class="form-control" type="text"  name="keyword" placeholder="검색">
	                            <button><i class="icon-magnifier"></i></button>
                   		 </aside>
	                  </form>
                  </div>
                   	
                   		<!-- 글작성 버튼 -->
                   		<div class="ps-form--quick-search--com">
                   			<button>글쓰기</button>
                   		</div>
                   		 			<!-- 페이징 버튼들 시작 -->
                                    <div class="ps-pagination">
                                        <ul class="pagination">
                                            <li class="active"><a href="#">1</a></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">Next<i class="icon-chevron-right"></i></a></li>
                                        </ul>
                                    </div>
                                    <!-- 페이징 버튼들 끝 -->
                                    
                    </div>
                </div>
                
            </div>
        </div>
    
   
            
        
        
    </div>

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