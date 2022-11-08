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
                        <!-- 블로그 헤더 끝  -->
                        
                        <!-- 블로그 본문 시작  -->
                        <div class="ps-post__content">
                        	<p>${cBoard.board_content }
                        	<p><img src="/Code_Green/resources/img/홍콩센트럴소호비건레스토랑.jpg">
<!--                             <h4>On the off chance that you have an escalated stop, mull over a short taking a gander at outing. This especially is shrewd in urban areas with brilliant open transportation decisions.</h4> -->
<!--                             <p>Today most people get on average 4 to 6 hours of exercise every day, and make sure that everything they put in their mouths is not filled with sugars or preservatives, but they pay no attention to their mental health, no vacations, not even the occasional long weekend. All of this for hopes of one day getting that big promotion.This response is important for our ability to learn from mistakes, but it also gives rise to self-criticism, because it is part of the threat-protection system. In other words, what keeps us safe can go too far, and keep us too safe. In fact, it can trigger self-censoring. Coven try is a city with a thousand years of history that has plenty to offer the visiting tourist. Located in the heart of Warwickshire. One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections.</p> -->
<!--                             <blockquote class="ps-blockquote"> -->
<!--                                 <p>“When you think ‘I know’ and ‘it is,’ you have the illusion of knowing, the illusion of certainty, and then you’re mindless”</p><span class="ps-blockquote__author">JELLY CRISTIANA</span> -->
<!--                             </blockquote> -->
<!--                             <p>That immediately brought to mind one of my fondest memories, involving my daughter when she was just a toddler of one: taking her with me on the short walk to check the mail. I live in a small enclave of homes in which all the mailboxes are together in a central location, less than a minute’s walk from my front door</p> -->
<!--                             <div class="row"> -->
<!--                                 <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 "><img class="mb-30" src="/Code_Green/resources/img/blog/detail/2.jpg" alt=""> -->
<!--                                 </div> -->
<!--                                 <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 "><img class="mb-30" src="/Code_Green/resources/img/blog/detail/3.jpg" alt=""> -->
<!--                                 </div> -->
<!--                                 <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 "><img class="mb-30" src="/Code_Green/resources/img/blog/detail/4.jpg" alt=""> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <h4>Defaulting to Mindfulness: The Third Person Effect</h4> -->
<!--                             <p>Cray post-ironic plaid, Helvetica keffiyeh tousled Carles banjo before they sold out blog photo booth Marfa semiotics Truffaut. Mustache Schlitz next level blog Williamsburg, deep v typewriter tote bag Banksy +1 literally.</p> -->
<!--                             <ul> -->
<!--                                 <li>Welsh novelist Sarah Waters sums it up eloquently</li> -->
<!--                                 <li>In their classic book, Creativity in Business, based on a popular course they co-taught</li> -->
<!--                                 <li>Novelist and screenwriter Steven Pressfield</li> -->
<!--                                 <li>A possible off-the-wall idea or solution appears like a blip and disappears without us even realizing</li> -->
<!--                             </ul> -->
<!--                             <p>The short answer is yes. <strong>According to Kross</strong>, when you think of yourself as another person, it allows you give yourself more objective, helpful feedback.</p> -->
<!--                             <h4>Recommended Items</h4> -->
<!--                             <p>Both of these assumptions, of course, could be entirely false. Self-censoring is firmly rooted in our experiences with mistakes in the past and not the present</p> -->
                        </div>
                       	<!-- 태그를...쓸건가? -->
<!--                         <div class="ps-post__footer"> -->
<!--                             <p class="ps-post__tags">Tags:<a href="#">business</a><a href="#">technology</a></p> -->
<!--                         </div> -->
                        
                    </div>
                </div>
                
                <!-- 오른쪽 메뉴 시작  -->
                <div class="ps-blog__right">
                    <aside class="widget widget--blog widget--recent-post">
	                        <div class="widget__content">
		                        <a href="/Code_Green"><i class="fi fi-rr-home"></i> 메인 홈</a>
		                        <a href="community_main"><i class="fi fi-rr-list"></i> 목록 보기</a>
		                        <a href="community_write"><i class="fi fi-rr-edit"></i> 새글 쓰기</a>
		                        <a href="community_modify"><i class="fi fi-rr-scissors"></i> 글 수정</a>
		                        <a href="community_delete"><i class="fi fi-rr-cross-circle"></i> 글 삭제</a>
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