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
    <title>item_detail</title>
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

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>  
  <style type="text/css">  
    table {
  	  width:100%;
  	  height:100% ;
  	  border-color: #e1e1e1;
    }  
    table thead tr th{
		font-weight: 500;
		color: #000;
/* 		border-bottom:none; */
		border-top: none;
		border-left: none;
		border-right: none;
		text-align: center;
		padding: 15px 15px 15px 15px;
    }  
    
    table tbody tr td  {
	    font-weight: 500;
	    color: #000;
/* 	    border-bottom:none; */
	    border-top: none;
	    border-left: none;
	    border-right: none;
	    text-align: center;
		padding: 15px 15px 15px 15px;
	   
	    
	}  
	
/* 	.item table tr:hover{ */
/* 		background-color: #f2f2f2; */
/* 	} */
    .hide {
   	 display:none;
    }  
    .show {
   	 display:table-row;
    }  
    .item td {
   	 cursor:pointer;
   	 background-color: #FAFAFA;
    }  
    
   </style>  
   
</head>
<style>
	select {
		width: 130px; padding: .5em .5em; border: 1px solid #999; font-family: inherit;  
		background: url('/Code_Green/resources/img/arrow.jpg') no-repeat 95% 50%; border-radius: 5px; 
		-webkit-appearance: none; -moz-appearance: none;appearance: none;
		  float: right; padding-bottom: 3px; font-size: 1em;
	}
	select::-ms-expand {
	        display: none;
	    }
</style>
<body>
    <!-- 헤더 삽입 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 삽입 -->
    
     
    <!-- 바디시작 -->
    <div class="ps-page--product">
        <div class="ps-container">
            <div class="ps-page__container">
                <div class="ps-page__left">
                    <div class="ps-product--detail ps-product--fullwidth">
                        <div class="ps-product__header">
                            <div class="ps-product__thumbnail" data-vertical="true">
                                <figure>
                                    <div class="ps-wrapper">
                                        <div class="ps-product__gallery" data-arrow="true">
                                            <div class="item"><a href="/Code_Green/resources/img/products/detail/fullwidth/1.jpg"><img src="/Code_Green/resources/img/products/detail/fullwidth/1.jpg" alt=""></a></div>
                                        </div>
                                    </div>
                                </figure>
                            </div>
                            <div class="ps-product__info">
                                <h1  class="ps-product__price">유기농 가지</h1>
                                <p>삶으면 할머니의, 튀기면 나의 밥도둑 (한줄소개)</p>
                                <h4 class="ps-product__price">40000원</h4>
                                <div class="ps-product__meta">
<!--                                     <p>Brand:<a href="shop-default.html">Son</a></p> -->
                                    <div class="ps-product__rating" >
                                        <select class="ps-rating" data-read-only="true">
                                            <option value="1">1</option>
                                            <option value="1">2</option>
                                            <option value="1">3</option>
                                            <option value="1">4</option>
                                            <option value="2">5</option>
                                        </select><span>(1 review)</span>
                                    </div>
                                </div>
                                
                                
                                <div class="ps-product__desc">
                                    <ul class="ps-list--dot">
                                        <li>판매자 </li>
                                        <li>포장타입 </li>
                                        <li>판매단위 </li>
                                        <li>원산지 </li>
                                        <li>포장타입 </li>
                                    </ul>
                                </div>
<!--                                 <div class="ps-product__variations"> -->
<!--                                     <figure> -->
<!--                                         <figcaption>Color</figcaption> -->
<!--                                         <div class="ps-variant ps-variant--color color--1"><span class="ps-variant__tooltip">Black</span></div> -->
<!--                                         <div class="ps-variant ps-variant--color color--2"><span class="ps-variant__tooltip"> Gray</span></div> -->
<!--                                     </figure> -->
<!--                                 </div> -->
                                <div class="ps-product__shopping">
                                    <figure>
                                        <figcaption>상품선택</figcaption>
                                        <div class="form-group--number">
                                            <button class="up"><i class="fa fa-plus"></i></button>
                                            <button class="down"><i class="fa fa-minus"></i></button>
                                            <input class="form-control" type="text" placeholder="1">
                                        </div>
                                    </figure><a class="ps-btn ps-btn--black" href="#">Add to cart</a>
                                    <div class="ps-product__actions"><a href="#"><i class="icon-heart"></i></a></div>
                                </div>
                            </div>
                        </div>
                        <div class="ps-product__content ps-tab-root">
                            <ul class="ps-tab-list">
                                <li class="active"><a href="#tab-1">상품설명</a></li>
                                <li><a href="#tab-2">상세정보</a></li>
                                <li><a href="#tab-3">후기9999+</a></li><!--tab-3-1은 작성폼 -->
                                <li><a href="#tab-4">문의</a></li> <!--tab-4-1은 작성폼 -->
                            </ul>
                            <div class="ps-tabs">
                            
                            
 <!-- ==========상품설명=========================================================================================================     -->                          
                                <div class="ps-tab active" id="tab-1">
                                    <div class="ps-document">
                                        <h5>Embodying the Raw, Wayward Spirit of Rock 'N' Roll</h5>
                                        <p>Embodying the raw, wayward spirit of rock ‘n’ roll, the Kilburn portable active stereo speaker takes the unmistakable look and sound of Marshall, unplugs the chords, and takes the show on the road.</p>
                                        <p>Weighing in under 7 pounds, the Kilburn is a lightweight piece of vintage styled engineering. Setting the bar as one of the loudest speakers in its class, the Kilburn is a compact, stout-hearted hero with a well-balanced audio which boasts a clear midrange and extended highs for a sound that is both articulate and pronounced. The analogue knobs allow you to fine tune the controls to your personal preferences while the guitar-influenced leather strap enables easy and stylish travel.</p><img class="mb-30" src="img/products/detail/content/description.jpg" alt="">
                                        <h5>What do you get</h5>
                                        <p>Sound of Marshall, unplugs the chords, and takes the show on the road.</p>
                                        <p>Weighing in under 7 pounds, the Kilburn is a lightweight piece of vintage styled engineering. Setting the bar as one of the loudest speakers in its class, the Kilburn is a compact, stout-hearted hero with a well-balanced audio which boasts a clear midrange and extended highs for a sound that is both articulate and pronounced. The analogue knobs allow you to fine tune the controls to your personal preferences while the guitar-influenced leather strap enables easy and stylish travel.</p>
                                        <p>The FM radio is perhaps gone for good, the assumption apparently being that the jury has ruled in favor of streaming over the internet. The IR blaster is another feature due for retirement – the S6 had it, then the Note5 didn’t, and now with the S7 the trend is clear.</p>
                                        <h5>Perfectly Done</h5>
                                        <p>Meanwhile, the IP68 water resistance has improved from the S5, allowing submersion of up to five feet for 30 minutes, plus there’s no annoying flap covering the charging port</p>
                                        <ul class="pl-0">
                                            <li>No FM radio (except for T-Mobile units in the US, so far)</li>
                                            <li>No IR blaster</li>
                                            <li>No stereo speakers</li>
                                        </ul>
                                        <p>If you’ve taken the phone for a plunge in the bath, you’ll need to dry the charging port before plugging in. Samsung hasn’t reinvented the wheel with the design of the Galaxy S7, but it didn’t need to. The Gala S6 was an excellently styled device, and the S7 has managed to improve on that.</p>
                                    </div>
                                </div>

<!-- ==========상세정보=========================================================================================================     -->                                 
                                <div class="ps-tab" id="tab-2">
                                    <div class="table-responsive">
                                        <table class="table table-bordered ps-table ps-table--specification">
                                            <tbody>
                                                <tr>
                                                    <td>상품의 유형</td>
                                                    <td>상품설명 및 상품이미지 참조</td>
                                                    <td>생산자 및 소재지</td>
                                                    <td>상품설명 및 상품이미지 참조</td>
                                                </tr>
                                                <tr>
                                                    <td>제조연월일,유통기한 또는 품질유지기간</td>
                                                    <td>상품설명 및 상품이미지 참조</td>
                                                    <td>포장단위별용량, 수량</td>
                                                    <td>상품설명 및 상품이미지 참조</td>
                                                </tr>
                                                <tr>
                                                    <td>원재료명 및 함량</td>
                                                    <td>상품설명 및 상품이미지 참조</td>
                                                    <td>영양성분(식품위생법에 따른 영양성분 표시대상에 한함)</td>
                                                    <td>상품설명 및 상품이미지 참조</td>
                                                </tr>
                                                <tr>
                                                    <td>유전자변형식품에 해당하는 경우 표시</td>
                                                    <td>해당사항 없음</td>
                                                    <td>영유아 또는 체중조절식품에 해당하는경우</td>
                                                    <td>해당사항 없음</td>
                                                </tr>
                                                <tr>
                                                    <td>수입식품에 해당하는경우"식품위생법에 따른 수입신고를 필함" 의 문구</td>
                                                    <td>식품위생법에 따른 수입신고를 필함</td>
                                                    <td>소비자 상담관련 전화번호</td>
                                                    <td>ㅇㅇㅇ마켓 고객센터(803-0909)</td>
                                                </tr>
                                              
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
 <!-- ==========상세정보 끝 =========================================================================================================     -->   
 
                                
 <!-- ==========상품후기 목록=========================================================================================================     -->                                 
                     
                                <div class="ps-tab" id="tab-3">
                                    <div class="row">
                                        <div class="col-xl-4 col-lg-5 col-md-12 col-sm-12 col-12 ">
                                            <div class="ps-block--average-rating">
                                                <div class="ps-block__header">
                                                    <h3>4.00</h3>
                                                    <select class="ps-rating" data-read-only="true">
                                                        <option value="1">1</option>
                                                        <option value="1">2</option>
                                                        <option value="1">3</option>
                                                        <option value="1">4</option>
                                                        <option value="2">5</option>
                                                    </select><span>1 Review</span>
                                                </div>
                                                <div class="ps-block__star"><span>5 Star</span>
                                                    <div class="ps-progress" data-value="100"><span></span></div><span>100%</span>
                                                </div>
                                                <div class="ps-block__star"><span>4 Star</span>
                                                    <div class="ps-progress" data-value="0"><span></span></div><span>0</span>
                                                </div>
                                                <div class="ps-block__star"><span>3 Star</span>
                                                    <div class="ps-progress" data-value="0"><span></span></div><span>0</span>
                                                </div>
                                                <div class="ps-block__star"><span>2 Star</span>
                                                    <div class="ps-progress" data-value="0"><span></span></div><span>0</span>
                                                </div>
                                                <div class="ps-block__star"><span>1 Star</span>
                                                    <div class="ps-progress" data-value="0"><span></span></div><span>0</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <form class="ps-form--review" method="get">
                                                <h4>PRODUCT REVIEW</h4>
                                                <p><sup>*</sup>상품에 대한 후기를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.<br>
												<sup>*</sup>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 비건마켓 내 1:1 문의에 남겨주세요.</p>
												<select>    
													<option>최근등록순</option>    
													<option>좋아요 많은순</option>    
												</select>
												<table cellspacing="0" border="1" class="recruit" >
												        <colgroup>  
												            <col width="10%">  
												            <col width="60%">  
												            <col width="10%">  
												            <col width="10%">  
												            <col width="10%">  
												        </colgroup>  
												        <thead align="center">  
												            <tr class="" >  
												                <th scope="col">번호</th>  
												                <th scope="col">제목</th>  
												                <th scope="col">작성자</th>  
												                <th scope="col">작성일</th>  
												                <th scope="col">도움</th>  
												            </tr>  
												        </thead>  
												        <tbody>  
												            <tr class="item">  
												                <td>1</td>  
												                <td>오늘 처음 시켜봤어요!!!</td>  
												                <td>정민이</td>  
												                <td>2022.10.24</td>  
												                <td>12</td>  
												            </tr>  
												            <tr class="hide">  
												                <td colspan="5"> 
												                   (회원글 내용)<br> 
												                   가격도 저렴하고 중량에 비해 칼로리도 적당한 편이라 너무 좋았어요!<br>
																	하루 샐러드 하나는 꼭 먹고 있는데 여러가지 맛 시켰는데<br>
																	스윗밸런스 닭가슴살 고구마 샐러드 너무 맛있네요!<br>
																	닭가슴살은 엄청 촉촉하고 약간 짭쪼름하게 간이 되어 있어요.<br>
																	저는 빨간 토마토 보다 다른색 토마토를 더 좋아하는데 기분탓일지 모르겠지만 비린맛이 덜 하다고 해야할까? 그래서 더 좋았어용<br>
																	메추리알이 물릴 때쯤 새로운 맛으로 입안에 씹혀지는게 너무 맛있고 매력적 이였는데요.<br>
																	병아리콩이랑 샐러드가 적절히 섞여 있어서 너무 맛있었어요!<br>
																	이거 하나 먹었는데 포만감이 아주 상당해요 든든합니다. 좀 부족하신 분들은 채소를 따로 추가해서 드셔도 될 것 같아료.<br>
																	시저 드레싱 소스가 은근 양이 많고 맛도 있어서 아주 굿이거든용! 스윗밸런스 기억해뒀다가 자주 시켜먹어야 겠어요!<br>
																	사진<br>
												                    
																	<div align="right">
																	    <button>좋아용</button>
																	 </div>
												                </td>  
												            </tr>  
												            <tr class="item">  
												                <td>2</td>  
												                <td>한끼 식사로 훌륭합니다</td>  
												                <td>하동이</td>  
												                <td>2022.10.24</td>  
												                <td>12</td>  
												            </tr>  
												            <tr class="hide">  
												                <td colspan="5">  
												                   (회원글 내용)<br>
												                    가격도 저렴하고 중량에 비해 칼로리도 적당한 편이라 너무 좋았어요!<br>
																	하루 샐러드 하나는 꼭 먹고 있는데 여러가지 맛 시켰는데<br>
																	스윗밸런스 닭가슴살 고구마 샐러드 너무 맛있네요!<br>
																	닭가슴살은 엄청 촉촉하고 약간 짭쪼름하게 간이 되어 있어요.<br>
																	저는 빨간 토마토 보다 다른색 토마토를 더 좋아하는데 기분탓일지 모르겠지만 비린맛이 덜 하다고 해야할까? 그래서 더 좋았어용<br>
																	메추리알이 물릴 때쯤 새로운 맛으로 입안에 씹혀지는게 너무 맛있고 매력적 이였는데요.<br>
																	병아리콩이랑 샐러드가 적절히 섞여 있어서 너무 맛있었어요!<br>
																	이거 하나 먹었는데 포만감이 아주 상당해요 든든합니다. 좀 부족하신 분들은 채소를 따로 추가해서 드셔도 될 것 같아료.<br>
																	시저 드레싱 소스가 은근 양이 많고 맛도 있어서 아주 굿이거든용! 스윗밸런스 기억해뒀다가 자주 시켜먹어야 겠어요!<br>
																	사진<br>
												                    <div align="right">
																	    <button>좋아용</button>
																	 </div>
												                </td>  
												            </tr>  
												            <tr class="item">  
												                <td>3</td>  
												                <td>든든한 식단!!</td>  
												                <td>도토리</td>  
												                <td>2022.10.24</td>  
												                <td>12</td>  
												            </tr>  
												            <tr class="hide">  
												                <td colspan="5">  
												                   (회원글 내용)<br>
												                    가격도 저렴하고 중량에 비해 칼로리도 적당한 편이라 너무 좋았어요!<br>
																	하루 샐러드 하나는 꼭 먹고 있는데 여러가지 맛 시켰는데<br>
																	스윗밸런스 닭가슴살 고구마 샐러드 너무 맛있네요!<br>
																	닭가슴살은 엄청 촉촉하고 약간 짭쪼름하게 간이 되어 있어요.<br>
																	저는 빨간 토마토 보다 다른색 토마토를 더 좋아하는데 기분탓일지 모르겠지만 비린맛이 덜 하다고 해야할까? 그래서 더 좋았어용<br>
																	메추리알이 물릴 때쯤 새로운 맛으로 입안에 씹혀지는게 너무 맛있고 매력적 이였는데요.<br>
																	병아리콩이랑 샐러드가 적절히 섞여 있어서 너무 맛있었어요!<br>
																	이거 하나 먹었는데 포만감이 아주 상당해요 든든합니다. 좀 부족하신 분들은 채소를 따로 추가해서 드셔도 될 것 같아료.<br>
																	시저 드레싱 소스가 은근 양이 많고 맛도 있어서 아주 굿이거든용! 스윗밸런스 기억해뒀다가 자주 시켜먹어야 겠어요!<br>
																	사진<br>
												                    <div align="right">
																	    <button>좋아용</button>
																	 </div> 
												                </td>  
												            </tr>  
												        </tbody>  
												    </table>  
												    <script type="text/javascript">  
												        $(function(){  
												            var article = (".recruit .show");  
												            $(".recruit .item  td").click(function() {  
												                var myArticle =$(this).parents().next("tr");  
												                if($(myArticle).hasClass('hide')) {  
												                    $(article).removeClass('show').addClass('hide');  
												                    $(myArticle).removeClass('hide').addClass('show');  
												                }  
												                else {  
												                    $(myArticle).addClass('hide').removeClass('show');  
												                }  
												            });  
												        });  
												    </script>  
												    <br>
												    
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
				                                    
													<!--리뷰작성 버튼 -->
												   <div align="right">
							                            <ul class="ps-tab-list" >
							                                <li ><a href="#tab-3-1" class="ps-btn" style="color: white ">리뷰작성</a></li>
							                            </ul>
						                            </div> 
						                            <!--리뷰작성 버튼 끝 -->
                                            </form>
                                        </div>
                                    </div>
                                </div>          

<!-- ==========상품후기 끝================================================================================== -->                           
                            
                                
<!-- ==========상품후기 작성=========================================================================================================     -->                                 

                                <div class="ps-tab" id="tab-3-1">
                                    <div class="row">
                                        <div class="col-xl-4 col-lg-5 col-md-12 col-sm-12 col-12 ">
                                            <div class="ps-block--average-rating">
                                                <div class="ps-block__header">
                                                    <h3>4.00</h3>
                                                    <select class="ps-rating" data-read-only="true">
                                                        <option value="1">1</option>
                                                        <option value="1">2</option>
                                                        <option value="1">3</option>
                                                        <option value="1">4</option>
                                                        <option value="2">5</option>
                                                    </select><span>1 Review</span>
                                                </div>
                                                <div class="ps-block__star"><span>5 Star</span>
                                                    <div class="ps-progress" data-value="100"><span></span></div><span>100%</span>
                                                </div>
                                                <div class="ps-block__star"><span>4 Star</span>
                                                    <div class="ps-progress" data-value="0"><span></span></div><span>0</span>
                                                </div>
                                                <div class="ps-block__star"><span>3 Star</span>
                                                    <div class="ps-progress" data-value="0"><span></span></div><span>0</span>
                                                </div>
                                                <div class="ps-block__star"><span>2 Star</span>
                                                    <div class="ps-progress" data-value="0"><span></span></div><span>0</span>
                                                </div>
                                                <div class="ps-block__star"><span>1 Star</span>
                                                    <div class="ps-progress" data-value="0"><span></span></div><span>0</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-8 col-lg-7 col-md-12 col-sm-12 col-12 ">
                                            <form class="ps-form--review" action="index.html" method="get">
                                                <h4>PRODUCT REVIEW</h4>
                                                <p><sup>*</sup>상품에 대한 후기를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.<br>
												<sup>*</sup>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 비건마켓 내 1:1 문의에 남겨주세요.</p>
                                                <div class="form-group form-group__rating">
                                                    <label>별점을 매겨주세요</label>
                                                    <select class="ps-rating" data-read-only="false">
                                                        <option value="0">0</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <textarea class="form-control" rows="6" placeholder="Write your review here"></textarea>
                                                </div>
                                                <div align="right">
	                                                <div class="form-group submit">
	                                                    <button class="ps-btn">Submit Review</button>
	                                                </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                
 <!-- ==========상품후기 작성 끝=========================================================================================================     -->  
                                      
 <!-- ==========상품문의 목록  시작=========================================================================================================     --> 

 
 							  <div class="ps-tab" id="tab-4">
<!--                                     <div class="table-responsive"> -->
                       				
                       				  	<div class="col-lg-15">
                                            <form class="ps-form--review" method="get">
                                                <h4>PRODUCT REVIEW</h4>
                                                <p>
	                                                <sup>*</sup>상품에 대한 후기를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.<br>
													<sup>*</sup>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 비건마켓 내 1:1 문의에 남겨주세요.
												</p>
												<select>    
													<option>최근등록순</option>    
													<option>좋아요 많은순</option>    
												</select>
													<table cellspacing="0" border="1" class="recruit" >
													        <colgroup>  
													            <col width="7%">  
													            <col width="63%">  
													            <col width="10%">  
													            <col width="10%">  
													            <col width="10%">  
													        </colgroup>  
													        <thead align="center">  
													            <tr class="" >  
													                <th scope="col">번호</th>  
													                <th scope="col">제목</th>  
													                <th scope="col">작성자</th>  
													                <th scope="col">작성일</th>  
													                <th scope="col">답변상태</th>  
													            </tr>  
													        </thead>  
													        <tbody>  
													            <tr class="item">  
													                <td>1</td>  
													                <td>상품이 터져서 왔어요 ㅜ</td>  
													                <td>정민이</td>  
													                <td>2022.10.24</td>  
													                <td>-</td>  
													            </tr>  
													            <tr class="hide">  
													                <td colspan="5">  
													                	(관리자의 답글)<br>
													                    안녕하세요 ㅇㅇㅇ 입니다. <br>
																		순차적인 문의 확인으로 답변 지연이 발생된 점 깊이 사과드립니다.<br>
																		<br>
																		먼저 필요하시어 주문해주신 상품으로 불편함을 드려 죄송합니다. <br>
																		상품 생산 및 포장과정에서 검수가 미흡하여 불편함을 드린 부분으로 말씀주신 사항은 유관부서로 전달하여 개선 요청하겠습니다.<br>
																		<br>
																		문의해 주신 사항 관련하여 학인 및 처리 도움드렸습니다. <br>
																		<br>
																		추후 상품 문의 외 배송관련 또는 상품 CS 조치 필요할 경우 1:1문의를 통해 남겨주시면 감사하겠습니다<br>
																		<br>
																		앞으로 정확한 상품으로 마켓컬리 이용에 만족을 드리고자 더욱 노력하겠습니다.<br>
																		<br>
																		감사합니다.
													                    
													                </td>  
													            </tr>  
													            <tr class="item">  
													                <td>2</td>  
													                <td>이게 맞는지 저는 모르겠네요</td>  
													                <td>하동이</td>  
													                <td>2022.10.24</td>  
													                <td>답변완료</td>  
													            </tr>  
													            <tr class="hide">  
													                <td colspan="5">  
													                   (관리자의 답글)<br>
													                   안녕하세요 ㅇㅇㅇ 입니다. <br>
																		순차적인 문의 확인으로 답변 지연이 발생된 점 깊이 사과드립니다.<br>
																		<br>
																		먼저 필요하시어 주문해주신 상품으로 불편함을 드려 죄송합니다. <br>
																		상품 생산 및 포장과정에서 검수가 미흡하여 불편함을 드린 부분으로 말씀주신 사항은 유관부서로 전달하여 개선 요청하겠습니다.<br>
																		<br>
																		문의해 주신 사항 관련하여 학인 및 처리 도움드렸습니다. <br>
																		<br>
																		추후 상품 문의 외 배송관련 또는 상품 CS 조치 필요할 경우 1:1문의를 통해 남겨주시면 감사하겠습니다<br>
																		<br>
																		앞으로 정확한 상품으로 마켓컬리 이용에 만족을 드리고자 더욱 노력하겠습니다.<br>
																		<br>
																		감사합니다.  
													                </td>  
													            </tr>  
													            <tr class="item">  
													                <td>3</td>  
													                <td>배달이 안왔습니다</td>  
													                <td>도토리</td>  
													                <td>2022.10.24</td>  
													                <td>답변완료</td>  
													            </tr>  
													            <tr class="hide">  
													                <td colspan="5">  
													                   (관리자의 답글)<br>
													                   안녕하세요 ㅇㅇㅇ 입니다. <br>
																		순차적인 문의 확인으로 답변 지연이 발생된 점 깊이 사과드립니다.<br>
																		<br>
																		먼저 필요하시어 주문해주신 상품으로 불편함을 드려 죄송합니다. <br>
																		상품 생산 및 포장과정에서 검수가 미흡하여 불편함을 드린 부분으로 말씀주신 사항은 유관부서로 전달하여 개선 요청하겠습니다.<br>
																		<br>
																		문의해 주신 사항 관련하여 학인 및 처리 도움드렸습니다. <br>
																		<br>
																		추후 상품 문의 외 배송관련 또는 상품 CS 조치 필요할 경우 1:1문의를 통해 남겨주시면 감사하겠습니다<br>
																		<br>
																		앞으로 정확한 상품으로 마켓컬리 이용에 만족을 드리고자 더욱 노력하겠습니다.<br>
																		<br>
																		감사합니다.
													                </td>  
													            </tr>  
													        </tbody>  
													    </table>  
												    <br>
												    
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
												    
												    <!-- 문의작성 버튼 -->
												   <div align="right">
							                            <ul class="ps-tab-list" >
							                                <li ><a href="#tab-4-1" class="ps-btn" style="color: white ">문의작성</a></li>
							                            </ul>
						                            </div> 
						                            <!-- 문의작성 버튼 끝 -->
                                            </form>
                                        </div>
   								</div>
 
 <!-- ==========상품문의 목록 끝=========================================================================================================     -->   
  
  
  
  
  <!-- ==========상품문의 작성  시작=========================================================================================================     --> 
  							  <div class="ps-tab" id="tab-4-1">
                                    <div class="row">
                                        <div class="col-xl-10 col-lg-7 col-md-12 col-sm-12 col-12 ">
                                            <form class="ps-form--review" action="index.html" method="get">
                                                <h4>PRODUCT REVIEW</h4>
                                                <p><sup>*</sup>상품에 대한 후기를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.<br>
												<sup>*</sup>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 비건마켓 내 1:1 문의에 남겨주세요.</p>
                                                <div class="form-group">
                                                    <textarea class="form-control" rows="15" cols="60" placeholder=
"상품문의 작성 전 확인해주세요 

* 답변은 영업일 기준 2~3일 소요됩니다
* 해당 게시판의 성격과 다른 글은 사전동이 없이 담당 게시판으로 이동될 수 있습니다.
* 배송관련, 주문(취소, 교환, 환불) 관련 문의 및 요청사항은 마이컬리 내 1:1 문의에 남겨주세요.

제품
* 제품 상세정보 : 영양성분 및 함량, 용량, 보관 및 취급 방법 등 제품 정보는 상세이미지, 또는 상세정보에서
확인가능합니다

주문취소
* 배송 단계별로 주문취소 방법이 상이합니다. 
* [입금확인] 단계 : [ㅇㅇㅇㅇ > 주문내역 상세페이지] 에서 직접 취소 가능
* [입금확인] 이후 단계 : 고객센터로 문의
* 주문상품의 부분 취소는 불가능합니다. 전체 주문 취소 후 재구매 해주세요.

배송
* 주문 완료 후 변경은 불가능합니다.
* 배송일 배송시간 지정은 불가능합니다.
* 전화번호, 이메일, 주소, 계좌번호등의 상세 개인정보가 문의 내용에 
저장되지 않도록 주의해 주시기 바랍니다"></textarea>
                                                </div>
                                                <div align="right">
	                                                <div class="form-group submit">
	                                                    <button class="ps-btn">Submit Review</button>
	                                                </div>
	                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
  <!-- ==========상품문의 작성 끝=========================================================================================================     -->   
                           
                            </div>
                        </div>
                    </div>
                </div>
                
<!--======================오른쪽 Same Brand=====================================================  -->
                <div class="ps-page__right">
                        <h3> Same Brand</h3>
                        <div class="widget__content">
                            <div class="ps-product">
                                <div class="ps-product__thumbnail"><a href="../product-default.html"><img src="/Code_Green/resources/img/products/shop/5.jpg" alt="" /></a>
                                    <div class="ps-product__badge">-37%</div>
                                    <ul class="ps-product__actions">
                                        <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                        <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="ps-product__container"><a class="ps-product__vendor" href="#">Robert's Store</a>
                                    <div class="ps-product__content"><a class="ps-product__title" href="../product-default.html">Grand Slam Indoor Of Show Jumping Novel</a>
                                        <div class="ps-product__rating">
                                            <select class="ps-rating" data-read-only="true">
                                                <option value="1">1</option>
                                                <option value="1">2</option>
                                                <option value="1">3</option>
                                                <option value="1">4</option>
                                                <option value="2">5</option>
                                            </select><span>01</span>
                                        </div>
                                        <p class="ps-product__price sale">$32.99 <del>$41.00 </del></p>
                                    </div>
                                    <div class="ps-product__content hover"><a class="ps-product__title" href="product-default.html">Grand Slam Indoor Of Show Jumping Novel</a>
                                        <p class="ps-product__price sale">$32.99 <del>$41.00 </del></p>
                                    </div>
                                </div>
                            </div>
                            <div class="ps-product">
                                <div class="ps-product__thumbnail"><a href="../product-default.html"><img src="/Code_Green/resources/img/products/shop/6.jpg" alt="" /></a>
                                    <div class="ps-product__badge">-5%</div>
                                    <ul class="ps-product__actions">
                                        <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                        <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="ps-product__container"><a class="ps-product__vendor" href="#">Youngshop</a>
                                    <div class="ps-product__content"><a class="ps-product__title" href="../product-default.html">Sound Intone I65 Earphone White Version</a>
                                        <div class="ps-product__rating">
                                            <select class="ps-rating" data-read-only="true">
                                                <option value="1">1</option>
                                                <option value="1">2</option>
                                                <option value="1">3</option>
                                                <option value="1">4</option>
                                                <option value="2">5</option>
                                            </select><span>01</span>
                                        </div>
                                        <p class="ps-product__price sale">$100.99 <del>$106.00 </del></p>
                                    </div>
                                    <div class="ps-product__content hover"><a class="ps-product__title" href="../product-default.html">Sound Intone I65 Earphone White Version</a>
                                        <p class="ps-product__price sale">$100.99 <del>$106.00 </del></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
            
            
            
<!-- ===================================================================================================================     -->
<!--             연관상품 -->
            <div class="ps-section--default">
                <div class="ps-section__header">
                    <h3>Related products</h3>
                </div>
                <div class="ps-section__content">
                    <div class="ps-carousel--nav owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="10000" data-owl-gap="30" data-owl-nav="true" data-owl-dots="true" data-owl-item="6" data-owl-item-xs="2" data-owl-item-sm="2" data-owl-item-md="3" data-owl-item-lg="4" data-owl-item-xl="5" data-owl-duration="1000" data-owl-mousedrag="on">
                        <div class="ps-product">
                            <div class="ps-product__thumbnail"><a href="../product-default.html"><img src="/Code_Green/resources/img/products/shop/11.jpg" alt="" /></a>
                                <ul class="ps-product__actions">
                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                </ul>
                            </div>
                            <div class="ps-product__container"><a class="ps-product__vendor" href="#">1번스토어</a>
                                <div class="ps-product__content"><a class="ps-product__title" href="../product-default.html">Men’s Sports Runnning Swim Board Shorts</a>
                                    <div class="ps-product__rating">
                                        <select class="ps-rating" data-read-only="true">
                                            <option value="1">1</option>
                                            <option value="1">2</option>
                                            <option value="1">3</option>
                                            <option value="1">4</option>
                                            <option value="2">5</option>
                                        </select><span>01</span>
                                    </div>
                                    <p class="ps-product__price">$13.43</p>
                                </div>
                                <div class="ps-product__content hover"><a class="ps-product__title" href="product-default.html">Men’s Sports Runnning Swim Board Shorts</a>
                                    <p class="ps-product__price">$13.43</p>
                                </div>
                            </div>
                        </div>
                        <div class="ps-product">
                            <div class="ps-product__thumbnail"><a href="product-default.html"><img src="/Code_Green/resources/img/products/shop/12.jpg" alt="" /></a>
                                <ul class="ps-product__actions">
                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                </ul>
                            </div>
                            <div class="ps-product__container"><a class="ps-product__vendor" href="#">Global Office</a>
                                <div class="ps-product__content"><a class="ps-product__title" href="product-default.html">Paul’s Smith Sneaker InWhite Color</a>
                                    <div class="ps-product__rating">
                                        <select class="ps-rating" data-read-only="true">
                                            <option value="1">1</option>
                                            <option value="1">2</option>
                                            <option value="1">3</option>
                                            <option value="1">4</option>
                                            <option value="2">5</option>
                                        </select><span>01</span>
                                    </div>
                                    <p class="ps-product__price">$75.44</p>
                                </div>
                                <div class="ps-product__content hover"><a class="ps-product__title" href="../product-default.html">Paul’s Smith Sneaker InWhite Color</a>
                                    <p class="ps-product__price">$75.44</p>
                                </div>
                            </div>
                        </div>
                        <div class="ps-product">
                            <div class="ps-product__thumbnail"><a href="../product-default.html"><img src="/Code_Green/resources/img/products/shop/13.jpg" alt="" /></a>
                                <div class="ps-product__badge">-7%</div>
                                <ul class="ps-product__actions">
                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                </ul>
                            </div>
                            <div class="ps-product__container"><a class="ps-product__vendor" href="#">Young Shop</a>
                                <div class="ps-product__content"><a class="ps-product__title" href="../product-default.html">MVMTH Classical Leather Watch In Black</a>
                                    <div class="ps-product__rating">
                                        <select class="ps-rating" data-read-only="true">
                                            <option value="1">1</option>
                                            <option value="1">2</option>
                                            <option value="1">3</option>
                                            <option value="1">4</option>
                                            <option value="2">5</option>
                                        </select><span>01</span>
                                    </div>
                                    <p class="ps-product__price sale">$57.99 <del>$62.99 </del></p>
                                </div>
                                <div class="ps-product__content hover"><a class="ps-product__title" href="../product-default.html">MVMTH Classical Leather Watch In Black</a>
                                    <p class="ps-product__price sale">$57.99 <del>$62.99 </del></p>
                                </div>
                            </div>
                        </div>
                        <div class="ps-product">
                            <div class="ps-product__thumbnail"><a href="../product-default.html"><img src="/Code_Green/resources/img/products/shop/14.jpg" alt="" /></a>
                                <div class="ps-product__badge">-7%</div>
                                <ul class="ps-product__actions">
                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                </ul>
                            </div>
                            <div class="ps-product__container"><a class="ps-product__vendor" href="#">Global Office</a>
                                <div class="ps-product__content"><a class="ps-product__title" href="../product-default.html">Beat Spill 2.0 Wireless Speaker – White</a>
                                    <div class="ps-product__rating">
                                        <select class="ps-rating" data-read-only="true">
                                            <option value="1">1</option>
                                            <option value="1">2</option>
                                            <option value="1">3</option>
                                            <option value="1">4</option>
                                            <option value="2">5</option>
                                        </select><span>01</span>
                                    </div>
                                    <p class="ps-product__price sale">$57.99 <del>$62.99 </del></p>
                                </div>
                                <div class="ps-product__content hover"><a class="ps-product__title" href="../product-default.html">Beat Spill 2.0 Wireless Speaker – White</a>
                                    <p class="ps-product__price sale">$57.99 <del>$62.99 </del></p>
                                </div>
                            </div>
                        </div>
                        <div class="ps-product">
                            <div class="ps-product__thumbnail"><a href="../product-default.html"><img src="/Code_Green/resources/img/products/shop/15.jpg" alt="" /></a>
                                <ul class="ps-product__actions">
                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                </ul>
                            </div>
                            <div class="ps-product__container"><a class="ps-product__vendor" href="#">Young Shop</a>
                                <div class="ps-product__content"><a class="ps-product__title" href="../product-default.html">ASUS Chromebook Flip – 10.2 Inch</a>
                                    <div class="ps-product__rating">
                                        <select class="ps-rating" data-read-only="true">
                                            <option value="1">1</option>
                                            <option value="1">2</option>
                                            <option value="1">3</option>
                                            <option value="1">4</option>
                                            <option value="2">5</option>
                                        </select><span>01</span>
                                    </div>
                                    <p class="ps-product__price sale">$332.38</p>
                                </div>
                                <div class="ps-product__content hover"><a class="ps-product__title" href="../product-default.html">ASUS Chromebook Flip – 10.2 Inch</a>
                                    <p class="ps-product__price sale">$332.38</p>
                                </div>
                            </div>
                        </div>
                        <div class="ps-product">
                            <div class="ps-product__thumbnail"><a href="../product-default.html"><img src="/Code_Green/resources/img/products/shop/16.jpg" alt="" /></a>
                                <div class="ps-product__badge">-7%</div>
                                <ul class="ps-product__actions">
                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                </ul>
                            </div>
                            <div class="ps-product__container"><a class="ps-product__vendor" href="#">Young Shop</a>
                                <div class="ps-product__content"><a class="ps-product__title" href="../product-default.html">Apple Macbook Retina Display 12&quot;</a>
                                    <div class="ps-product__rating">
                                        <select class="ps-rating" data-read-only="true">
                                            <option value="1">1</option>
                                            <option value="1">2</option>
                                            <option value="1">3</option>
                                            <option value="1">4</option>
                                            <option value="2">5</option>
                                        </select><span>01</span>
                                    </div>
                                    <p class="ps-product__price sale">$1200.00 <del>$1362.99 </del></p>
                                </div>
                                <div class="ps-product__content hover"><a class="ps-product__title" href="../product-default.html">Apple Macbook Retina Display 12&quot;</a>
                                    <p class="ps-product__price sale">$1200.00 <del>$1362.99 </del></p>
                                </div>
                            </div>
                        </div>
                        <div class="ps-product">
                            <div class="ps-product__thumbnail"><a href="../product-default.html"><img src="/Code_Green/resources/img/products/shop/17.jpg" alt="" /></a>
                                <ul class="ps-product__actions">
                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                </ul>
                            </div>
     						<div class="ps-product__container"><a class="ps-product__vendor" href="#">Young Shop</a>
                                <div class="ps-product__content"><a class="ps-product__title" href="../product-default.html">Apple Macbook Retina Display 12&quot;</a>
                                    <div class="ps-product__rating">
                                        <select class="ps-rating" data-read-only="true">
                                            <option value="1">1</option>
                                            <option value="1">2</option>
                                            <option value="1">3</option>
                                            <option value="1">4</option>
                                            <option value="2">5</option>
                                        </select><span>01</span>
                                    </div>
                                    <p class="ps-product__price sale">$1200.00 <del>$1362.99 </del></p>
                                </div>
                                <div class="ps-product__content hover"><a class="ps-product__title" href="../product-default.html">Apple Macbook Retina Display 12&quot;</a>
                                    <p class="ps-product__price sale">$1200.00 <del>$1362.99 </del></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
     
        <!-- ---------------------------------------------------------- 푸터푸터 ---------------------------------------------------------- -->
     	<jsp:include page="../inc/footer.jsp"></jsp:include>
    	<!-- ---------------------------------------------------------- 푸터푸터 끝 ---------------------------------------------------------- -->
    </div>
    
    
    
    <!-- 맨위로 올라가는 화살표버튼! 지우지마세요! -->
    
    <div id="back2top"><i class="icon icon-arrow-up"></i></div>
    
    <!-- 맨위로 올라가는 화살표버튼! 지우지마세요! -->
    
    
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