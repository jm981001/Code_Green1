<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="format-detection" content="telephone=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
	<title>브랜드 메인</title>
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
    <link rel="stylesheet" href="/Code_Green/resources/css/autopart.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/vendor.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
</head>
<body>
    
    
    <!-- 헤더 삽입 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 삽입 -->
    
    
    
    
    <div class="ps-page--single ps-page--vendor">
        <section class="ps-store-list">
            <div class="container">
                <aside class="ps-block--store-banner">
                	<!-- 브랜드 정보 및 대표이미지 넣을 곳 -->
                    <div class="ps-block__content bg--cover" data-background="/Code_Green/resources/img/브랜드이미지샘플.jpg">
                        <h3>브랜드 이름</h3><a class="ps-block__inquiry" href="#"><i class="#"></i>Follow</a>
                    </div>
                    <div class="ps-block__user">
                        <div class="ps-block__user-content">
                           <i>여기에 브랜드별 상세정보 및 간단한 소개 넣으면 되지않을까.</i>
                        </div>
                    </div>
                </aside>
                
                
                <div class="ps-section__wrapper">
                    <div class="ps-section__left">
                        <aside class="widget widget--vendor">
                            <h3 class="widget-title">브랜드별</h3>
                            <ul class="ps-list--arrow">
                                <li><a href="#">가나다순</a></li>
                                <li><a href="#">알파벳순</a></li>
                                <li class="menu-item-has-children"><a href="#">뭐이런식</a>
                                    <ul class="sub-menu ps-list--arrow">
                                        <li><a href="#"> Custom Grilles</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children"><a href="#">Wheels & Tires</a>
                                    <ul class="sub-menu ps-list--categories">
                                        <li><a href="#"> Custom Grilles</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Factory Wheels</a></li>
                            </ul>
                        </aside>
                       
                    </div>
                    <div class="ps-section__right">
                        <nav class="ps-store-link">
                            <ul>
                                <li class="active"><a href="#">베스트순</a></li>
                                <li><a href="#">신상품순</a></li>
                                <li><a href="#">후기많은순</a></li>
                                <li><a href="#">낮은가격순</a></li>
                            </ul>
                        </nav>
							
                        <div class="ps-shopping ps-tab-root">
                            <div class="ps-shopping__header">
                                <p>총<strong> 6</strong> 개의 상품</p>
<!--                                 <div class="ps-shopping__actions"> -->
                                	<!-- 이건혹시 만약 뷰 종류할거면 재활용 -->
                                	
<!--                                     <div class="ps-shopping__view"> -->
<!--                                         <p>View</p> -->
<!--                                         <ul class="ps-tab-list"> -->
<!--                                             <li class="active"><a href="#tab-1"><i class="icon-grid"></i></a></li> -->
<!--                                             <li><a href="#tab-2"><i class="icon-list4"></i></a></li> -->
<!--                                         </ul> -->
<!--                                     </div> -->
<!--                                 </div> -->
                            </div>
                            <div class="ps-tabs">
                                <div class="ps-tab active" id="tab-1">
                                    <div class="ps-shopping-product">
                                        <div class="row">
                                        
                                        	<!-- 상품 1개당 시작 -->
                                            <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6 col-6 ">
                                                <div class="ps-product">
                                                    <div class="ps-product__thumbnail"><a href="item_detail"><img src="/Code_Green/resources/img/products/home-2/recommend/1.jpg" alt="" /></a>
                                                        <ul class="ps-product__actions">
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="ps-product__container"><a class="ps-product__vendor" href="#">풀무원</a>
                                                        <div class="ps-product__content"><a class="ps-product__title" href="item_detail">두부텐더스틱</a>
                                                            <div class="ps-product__rating">
                                                                <select class="ps-rating" data-read-only="true">
                                                                    <option value="1">1</option>
                                                                    <option value="1">2</option>
                                                                    <option value="1">3</option>
                                                                    <option value="1">4</option>
                                                                    <option value="2">5</option>
                                                                </select><span>02</span>
                                                            </div>
                                                            <p class="ps-product__price sale">6,800원 <del>10,800원 </del></p>
                                                        </div>
                                                        <div class="ps-product__content hover"><a class="ps-product__title" href="item_detail">두부텐더스틱</a>
                                                            <p class="ps-product__price sale">6,800원 <del>10,800원 </del></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 상품 1개당 끝 -->
                                            
                                            
                                            
                                        
                                        	<!-- 상품 1개당 시작 -->
                                            <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6 col-6 ">
                                                <div class="ps-product">
                                                    <div class="ps-product__thumbnail"><a href="item_detail"><img src="/Code_Green/resources/img/products/home-2/recommend/1.jpg" alt="" /></a>
                                                        <ul class="ps-product__actions">
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="ps-product__container"><a class="ps-product__vendor" href="#">풀무원</a>
                                                        <div class="ps-product__content"><a class="ps-product__title" href="item_detail">두부텐더스틱</a>
                                                            <div class="ps-product__rating">
                                                                <select class="ps-rating" data-read-only="true">
                                                                    <option value="1">1</option>
                                                                    <option value="1">2</option>
                                                                    <option value="1">3</option>
                                                                    <option value="1">4</option>
                                                                    <option value="2">5</option>
                                                                </select><span>02</span>
                                                            </div>
                                                            <p class="ps-product__price sale">6,800원 <del>10,800원 </del></p>
                                                        </div>
                                                        <div class="ps-product__content hover"><a class="ps-product__title" href="item_detail">두부텐더스틱</a>
                                                            <p class="ps-product__price sale">6,800원 <del>10,800원 </del></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 상품 1개당 끝 -->
                                            
                                            
                                            
                                        
                                        	<!-- 상품 1개당 시작 -->
                                            <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6 col-6 ">
                                                <div class="ps-product">
                                                    <div class="ps-product__thumbnail"><a href="item_detail"><img src="/Code_Green/resources/img/products/home-2/recommend/1.jpg" alt="" /></a>
                                                        <ul class="ps-product__actions">
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="ps-product__container"><a class="ps-product__vendor" href="#">풀무원</a>
                                                        <div class="ps-product__content"><a class="ps-product__title" href="item_detail">두부텐더스틱</a>
                                                            <div class="ps-product__rating">
                                                                <select class="ps-rating" data-read-only="true">
                                                                    <option value="1">1</option>
                                                                    <option value="1">2</option>
                                                                    <option value="1">3</option>
                                                                    <option value="1">4</option>
                                                                    <option value="2">5</option>
                                                                </select><span>02</span>
                                                            </div>
                                                            <p class="ps-product__price sale">6,800원 <del>10,800원 </del></p>
                                                        </div>
                                                        <div class="ps-product__content hover"><a class="ps-product__title" href="item_detail">두부텐더스틱</a>
                                                            <p class="ps-product__price sale">6,800원 <del>10,800원 </del></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 상품 1개당 끝 -->
                                            
                                            
                                            
                                        
                                        	<!-- 상품 1개당 시작 -->
                                            <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6 col-6 ">
                                                <div class="ps-product">
                                                    <div class="ps-product__thumbnail"><a href="item_detail"><img src="/Code_Green/resources/img/products/home-2/recommend/1.jpg" alt="" /></a>
                                                        <ul class="ps-product__actions">
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="ps-product__container"><a class="ps-product__vendor" href="#">풀무원</a>
                                                        <div class="ps-product__content"><a class="ps-product__title" href="item_detail">두부텐더스틱</a>
                                                            <div class="ps-product__rating">
                                                                <select class="ps-rating" data-read-only="true">
                                                                    <option value="1">1</option>
                                                                    <option value="1">2</option>
                                                                    <option value="1">3</option>
                                                                    <option value="1">4</option>
                                                                    <option value="2">5</option>
                                                                </select><span>02</span>
                                                            </div>
                                                            <p class="ps-product__price sale">6,800원 <del>10,800원 </del></p>
                                                        </div>
                                                        <div class="ps-product__content hover"><a class="ps-product__title" href="item_detail">두부텐더스틱</a>
                                                            <p class="ps-product__price sale">6,800원 <del>10,800원 </del></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 상품 1개당 끝 -->
                                            
                                            
                                            
                                        
                                        	<!-- 상품 1개당 시작 -->
                                            <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6 col-6 ">
                                                <div class="ps-product">
                                                    <div class="ps-product__thumbnail"><a href="item_detail"><img src="/Code_Green/resources/img/products/home-2/recommend/1.jpg" alt="" /></a>
                                                        <ul class="ps-product__actions">
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="ps-product__container"><a class="ps-product__vendor" href="#">풀무원</a>
                                                        <div class="ps-product__content"><a class="ps-product__title" href="item_detail">두부텐더스틱</a>
                                                            <div class="ps-product__rating">
                                                                <select class="ps-rating" data-read-only="true">
                                                                    <option value="1">1</option>
                                                                    <option value="1">2</option>
                                                                    <option value="1">3</option>
                                                                    <option value="1">4</option>
                                                                    <option value="2">5</option>
                                                                </select><span>02</span>
                                                            </div>
                                                            <p class="ps-product__price sale">6,800원 <del>10,800원 </del></p>
                                                        </div>
                                                        <div class="ps-product__content hover"><a class="ps-product__title" href="item_detail">두부텐더스틱</a>
                                                            <p class="ps-product__price sale">6,800원 <del>10,800원 </del></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 상품 1개당 끝 -->
                                            
                                            
                                            
                                        
                                        	<!-- 상품 1개당 시작 -->
                                            <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6 col-6 ">
                                                <div class="ps-product">
                                                    <div class="ps-product__thumbnail"><a href="item_detail"><img src="/Code_Green/resources/img/products/home-2/recommend/1.jpg" alt="" /></a>
                                                        <ul class="ps-product__actions">
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="ps-product__container"><a class="ps-product__vendor" href="#">풀무원</a>
                                                        <div class="ps-product__content"><a class="ps-product__title" href="item_detail">두부텐더스틱</a>
                                                            <div class="ps-product__rating">
                                                                <select class="ps-rating" data-read-only="true">
                                                                    <option value="1">1</option>
                                                                    <option value="1">2</option>
                                                                    <option value="1">3</option>
                                                                    <option value="1">4</option>
                                                                    <option value="2">5</option>
                                                                </select><span>02</span>
                                                            </div>
                                                            <p class="ps-product__price sale">6,800원 <del>10,800원 </del></p>
                                                        </div>
                                                        <div class="ps-product__content hover"><a class="ps-product__title" href="item_detail">두부텐더스틱</a>
                                                            <p class="ps-product__price sale">6,800원 <del>10,800원 </del></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 상품 1개당 끝 -->
                                            
                                            
                                        </div>
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
            </div>
        </section>
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