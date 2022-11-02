<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <li class="active"><a href="community_main">커뮤니티</a></li>
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
                                    <tr>
                                        <td>7</td>
                                        <td>[공지]</td>
                                        <td><a href="community_detail">[안내] 자유롭게 의견 나누시는 곳입니다.</a></td>
                                        <td>관리자</td>
                                        <td>2022-09-21</td>
                                        <td>321546</td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>[맛집]</td>
                                        <td><a href="community_detail">여기 저희동네 비건베이커리 맛집추천해봅니다! (45)</a></td>
                                        <td>도토리</td>
                                        <td>2022-10-25</td>
                                        <td>654</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>[사담]</td>
                                        <td><a href="community_detail">평소에 알러지있어서 비건으로 드시는분 계세요? (8)</a></td>
                                        <td>너구리</td>
                                        <td>2022-10-25</td>
                                        <td>325</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>[사담]</td>
                                        <td><a href="community_detail">여행가셔서 다들 어떻게 드세요? (32)</a></td>
                                        <td>비둘기</td>
                                        <td>2022-10-25</td>
                                        <td>458</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>[추천]</td>
                                        <td><a href="community_detail">마트에 비건양념 많아졌어요! (77)</a></td>
                                        <td>토마토마토</td>
                                        <td>2022-10-24</td>
                                        <td>337</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>[맛집]</td>
                                        <td><a href="community_detail">한식뷔페인데 비건요리로만 되있는곳 추천드려요!!</a></td>
                                        <td>가지가지</td>
                                        <td>2022-10-23</td>
                                        <td>752</td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
                        
                         <!-- 페이징 버튼들 시작 -->
                         
                         
                        
                         <div id="widget-search-select">
                          	<select class="search-category">
                                <option value="">카테고리</option>
                                <option value="head">말머리</option>
                                <option value="subject">제목</option>
                                <option value="writer">작성자</option>
                                <option value="content">내용</option>
                            </select>
                        </div>
                          <aside class="widget widget--blog widget--search">
	                        <form class="ps-form--widget-search" action="do_action" method="get">
	                            <input class="form-control" type="text" placeholder="검색">
	                            <button><i class="icon-magnifier"></i></button>
	                        </form>
                   		 </aside>
                   		 
                   		 
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