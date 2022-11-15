<%@page import="com.itwillbs.Code_Green.vo.ItemVO"%>
<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>베지터틀-${item.item_name }</title>
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/slick/slick/slick.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/lightGallery-master/dist/css/lightgallery.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/organic.css">

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>  
<!--   아코디언게시판 -->
  <style type="text/css">  
    table {
  	  width:100%;
  	  height:100% ;
  	  border-color: #e1e1e1;
    }  
    table thead tr th{
		font-weight: 500;
		color: #000;
		border-top: none;
		border-left: none;
		border-right: none;
		text-align: center;
		padding: 15px 15px 15px 15px;
    }  
    
    table tbody tr td  {
	    font-weight: 500;
	    color: #000;
	    border-top: none;
	    border-left: none;
	    border-right: none;
	    text-align: center;
		padding: 15px 15px 15px 15px;
	   
	    
	}  
	
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
   
 	<style type="text/css">
    	#goodList{
     		display: none; 
    	}
    	#bestList{
    		display: none;
    	}
    	#worstList{
    		display: none;
    	}
    </style>
     <script type="text/javascript">
// 	 	window.onload = function(){
			
// 			$('#sort').val('${sort}')
// 			sortItemList($('#sort').val());
			
// 		}	
    
    	var sortItemList = function(value) {
    		
    		var aLinks = $('.pageLink');
    		for(var i=0; i<aLinks.length; i++){
	    		var str = aLinks[i].href.split('sort=')[0] + 'sort=';
	    		aLinks[i].href = str + value;
    		}
    		
    		if(value == "worst"){
    			$('#itemList').hide();
    			$('#goodList').hide(); 
	        	$('#bestList').hide();
	    		$('#worstList').show();
    		} else if(value == "good") {
	    		$('#itemList').hide();
	    		$('#goodList').show();  
	        	$('#bestList').hide();
	    		$('#worstList').hide();
    		} else if(value == "best"){
	    		$('#itemList').hide();
	    		$('#goodList').hide(); 
	        	$('#bestList').show();
	    		$('#worstList').hide();
	    	} else {
	    		$('#itemList').show(); 
	    		$('#goodList').hide();
	        	$('#bestList').hide();
	    		$('#worstList').hide();
			}
    	};
    	
    </script>  
	<script type="text/javascript">
		$(function(){
			$(":button").click(function(){
				
				if(${sessionScope.sId == null}){
					alert("로그인 후 사용가능합니다!");
					return history.back();
				}
			});
		});	
	</script>
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
                                            <div class="item"><a href="/Code_Green/resources/item/${item.file1 } "><img  src="/Code_Green/resources/item/${item.file1 } " alt=""></a></div>
                                        </div>
                                    </div>
                                </figure>
                            </div>
                            <div class="ps-product__info">
                                <h1  class="ps-product__price">${item.item_name }</h1>
                                <p>${item.item_info }</p>
                                <h4 class="ps-product__price">${item.item_price }원</h4>
                                <div class="ps-product__meta">
<!--                                     <p>Brand:<a href="shop-default.html">Son</a></p> -->
                                                <%
                                                	ItemVO item = (ItemVO)request.getAttribute("item");
                                                	int score = (int)Math.round(Double.parseDouble(item.getBoard_star_score()));
                                                	pageContext.setAttribute("score", score);
                                                %>
                                    <div class="ps-product__rating" >
                                        <select class="ps-rating" data-read-only="true">
       										 <c:forEach var="i" begin="1" end="5">
                                             
                                             	<c:choose>
                                             		<c:when test="${i <= score}">
                                             			<option value="1">${i }</option>
                                             		</c:when>
                                             		<c:otherwise>
                                             			<option value="2">${i }</option>
                                             		</c:otherwise>
                                             	</c:choose>
                                             
                                             </c:forEach>
                                        </select><span>(${item.count } review)</span>
                                    </div>
                                </div>
                                
                                
                                <div class="ps-product__desc">
                                    <ul class="ps-list--dot">
                                        <li>판매자 &nbsp;${item.manager_brandname }</li>
                                        <li>포장타입 &nbsp; ${item.item_packing }</li>
                                        <li>카테고리 &nbsp; ${item.item_category }</li>
                                        <li>원산지   &nbsp;&nbsp; ${item.item_packing }</li>
                                        <li>포장타입 &nbsp; ${item.item_packing }</li>
                                        <li>포장타입 &nbsp; ${item.item_packing }</li>
                                    </ul>
                                </div>
                                <div class="ps-product__shopping">
                                    <figure>
                                        <figcaption>상품선택</figcaption>
                                        <div class="form-group--number">
                                            <button class="up"><i class="fa fa-plus"></i></button>
                                            <button class="down"><i class="fa fa-minus"></i></button>
                                            <input class="form-control" type="text" placeholder="1">
                                        </div>
                                    </figure>
                                    
                                    <a class="ps-btn ps-btn--black" href="#">Add to cart</a>
                                    <div class="ps-product__actions"><a href="WishList.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}&member_id=${sessionScope.sId}"><i class="icon-heart"></i>${item.heart }</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="ps-product__content ps-tab-root">
                            <ul class="ps-tab-list">
                                <li class="active"><a href="#tab-1">상품설명</a></li>
                                <li><a href="#tab-2">상세정보</a></li>
                                <li><a href="#tab-3">후기 ${item.count }</a></li><!--tab-3-1은 작성폼 -->
                                <li><a href="#tab-4">문의</a></li> <!--tab-4-1은 작성폼 -->
                            </ul>
                            <div class="ps-tabs">
                            
                            
 <!-- ==========상품설명=========================================================================================================     -->                          
                                <div class="ps-tab active" id="tab-1">
                                    <div class="ps-document" align="center">
                                    <a href="/Code_Green/resources/item/${item.file2 } "><img  src="/Code_Green/resources/item/${item.file2} " alt=""></a>
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
                                                <%
                                                	item = (ItemVO) request.getAttribute("item");
                                                	score = (int)Math.round(Double.parseDouble(item.getBoard_star_score()));
                                                	pageContext.setAttribute("score", score);
                                                %>
                                                    <h3>${item.board_star_score }</h3>
                                                    <select class="ps-rating" data-read-only="true">
                                                    <c:forEach var="i" begin="1" end="5">
                                                    
                                                    	<c:choose>
                                                    		<c:when test="${i <= score}">
                                                    			<option value="1">${i }</option>
                                                    		</c:when>
                                                    		<c:otherwise>
                                                    			<option value="2">${i }</option>
                                                    		</c:otherwise>
                                                    	</c:choose>
                                                    
                                                    </c:forEach>
                                                    </select><span>${item.count } review</span>
                                                </div>
                                                <div class="ps-block__star"><span>5 Star</span>
                                                    <div class="ps-progress" data-value="${item.star5 }"><span></span></div><span>${item.star5 }%</span>
                                                </div>
                                                <div class="ps-block__star"><span>4 Star</span>
                                                    <div class="ps-progress" data-value="${item.star4 }"><span></span></div><span>${item.star4 }%</span>
                                                </div>
                                                <div class="ps-block__star"><span>3 Star</span>
                                                    <div class="ps-progress" data-value="${item.star3 }"><span></span></div><span>${item.star3 }%</span>
                                                </div>
                                                <div class="ps-block__star"><span>2 Star</span>
                                                    <div class="ps-progress" data-value="${item.star2 }"><span></span></div><span>${item.star2 }%</span>
                                                </div>
                                                <div class="ps-block__star"><span>1 Star</span>
                                                    <div class="ps-progress" data-value="${item.star1 }"><span></span></div><span>${item.star1 }%</span>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-lg-8">
                                            <form class="ps-form--review" action=""  method="get"  >
                                                <h4>PRODUCT REVIEW</h4>
                                                <p><sup>*</sup>상품에 대한 후기를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.<br>
												<sup>*</sup>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 비건마켓 내 1:1 문의에 남겨주세요.</p>
													<select name="sortType" id="sort" class="form-select" aria-label="Default select example" onchange="sortItemList(this.value)">
													  <option value="new">최근 등록순</option>
													  <option value="best">추천 많은순</option>
													  <option value="good">별점 높은순</option>
													  <option value="worst">별점 낮은순</option>
													</select>
												<table border="1" class="recruit" >
												        <colgroup>  
												            <col width="70%">  
												            <col width="10%">  
												            <col width="10%">  
												            <col width="10%">  
												        </colgroup>  
												        <thead align="center">  
												            <tr class="" >  
												                <th scope="col">제목</th>  
												                <th scope="col">작성자</th>  
												                <th scope="col">작성일</th>  
												                <th scope="col">도움</th>  
												            </tr>  
												        </thead>
												  </table>
												  
												  
												  
												  
<!-------------------------------------------리뷰) 최근등록순 정렬------------------------------------------->
												  <table border="1" class="recruit" id="itemList">
												        <c:forEach var="board" items="${itemList }">
													        <tbody>  
													            <tr class="item">  
													                <td width="70%">${board.board_subject } (별점:${board.board_star_score })</td>  
													                <td width="10%">${board.board_id }</td>  
													                <fmt:parseDate var="dateString" value="${board.board_date}" pattern="yyyyMMdd" />
													                <td><fmt:formatDate value="${dateString }" type="date" pattern="yyyy.MM.dd" /></td> 
													                <td width="10%">12</td>  
													            </tr>  
													            <tr class="hide" style="height:300px">  
													                <td colspan="5">  
													                     <img  src="/Code_Green/resources/commUpload/${board.file1}" style="width:400px; height:400px;" onerror="this.style.display='none'">
													                     <img  src="/Code_Green/resources/commUpload/${board.file2}" style="width:400px; height:400px;" onerror="this.style.display='none'">
																			<br><br>${board.board_content }
																			
																		<div align="right">
																		    <button>좋아용</button>
																			<input type="button" value="수정" onclick="location.href='ReviewModify.bo?board_idx=${param.board_idx }'">
																			<input type="button" value="삭제" onclick="confirmDelete('${board.board_idx}&item_category=${param.item_category}&manager_brandname=${param.manager_brandname}')">
																		 </div>
													                </td>  
													            </tr>  
													        </tbody>  
												        </c:forEach>
												    </table>  

<!-------------------------------------------리뷰) 별점 높은 순 정렬------------------------------------------->												    
											<table border="1" class="recruit" id="goodList">

												        <c:forEach var="board" items="${goodList }">
													        <tbody>  
													            <tr class="item">  
													                <td width="70%">${board.board_subject } (별점:${board.board_star_score })</td>  
													                <td width="10%">${board.board_id }</td>  
													                <fmt:parseDate var="dateString" value="${board.board_date}" pattern="yyyyMMdd" />
													                <td><fmt:formatDate value="${dateString }" type="date" pattern="yyyy.MM.dd" /></td>
													                <td width="10%">12</td>  
													            </tr>  
													            <tr class="hide" style="height:300px">  
													                <td colspan="5">  
													                     <img  src="/Code_Green/resources/commUpload/${board.file1}" style="width:400px; height:400px;" onerror="this.style.display='none'">
													                     <img  src="/Code_Green/resources/commUpload/${board.file2}" style="width:400px; height:400px;" onerror="this.style.display='none'">
																			<br><br>${board.board_content }
																			
																		<div align="right">
																		    <button>좋아용</button>
																			<input type="button" value="수정" onclick="location.href='ReviewModify.bo?board_idx=${param.board_idx }'">
																			<input type="button" value="삭제" onclick="confirmDelete('${board.board_idx}&item_category=${param.item_category}&manager_brandname=${param.manager_brandname}')">
																		 </div>
													                </td>  
													            </tr>  
													        </tbody>  
												        </c:forEach>
												    </table>  
												    
<!-------------------------------------------리뷰) 추천 많은 순 정렬------------------------------------------->
												  <table border="1" class="recruit" id="bestList">
												        <c:forEach var="board" items="${bestList }">
													        <tbody>  
													            <tr class="item">  
													                <td width="70%">${board.board_subject } (별점:${board.board_star_score })</td>  
													                <td width="10%">${board.board_id }</td>  
													                <fmt:parseDate var="dateString" value="${board.board_date}" pattern="yyyyMMdd" />
													                <td><fmt:formatDate value="${dateString }" type="date" pattern="yyyy.MM.dd" /></td>  
													                <td width="10%">12</td>  
													            </tr>  
													            <tr class="hide" style="height:300px">  
													                <td colspan="5">  
													                     <img  src="/Code_Green/resources/commUpload/${board.file1}" style="width:400px; height:400px;" onerror="this.style.display='none'">
													                     <img  src="/Code_Green/resources/commUpload/${board.file2}" style="width:400px; height:400px;" onerror="this.style.display='none'">
																			<br><br>${board.board_content }
																			
																		<div align="right">
																		    <button>좋아용</button>
																			<input type="button" value="수정" onclick="location.href='ReviewModify.bo?board_idx=${param.board_idx }'">
																			<input type="button" value="삭제" onclick="confirmDelete('${board.board_idx}&item_category=${param.item_category}&manager_brandname=${param.manager_brandname}')">
																		 </div>
													                </td>  
													            </tr>  
													        </tbody>  
												        </c:forEach>
												    </table>  			
												    									    
<!-------------------------------------------리뷰) 최근등록순 정렬------------------------------------------->
												  <table border="1" class="recruit" id="worstList">
												        <c:forEach var="board" items="${worstList }">
													        <tbody>  
													            <tr class="item">  
													                <td width="70%">${board.board_subject } (별점:${board.board_star_score })</td>  
													                <td width="10%">${board.board_id }</td>  
													                <fmt:parseDate var="dateString" value="${board.board_date}" pattern="yyyyMMdd" />
													                <td><fmt:formatDate value="${dateString }" type="date" pattern="yyyy.MM.dd" /></td>
													                <td width="10%">12</td>  
													            </tr>  
													            <tr class="hide" style="height:300px">  
													                <td colspan="5">  
													                     <img  src="/Code_Green/resources/commUpload/${board.file1}" style="width:400px; height:400px;" onerror="this.style.display='none'">
													                     <img  src="/Code_Green/resources/commUpload/${board.file2}" style="width:400px; height:400px;" onerror="this.style.display='none'">
																			<br><br>${board.board_content }
																			
																		<div align="right">
																		    <button>좋아용</button>
																			<input type="button" value="수정" onclick="location.href='ReviewModify.bo?board_idx=${param.board_idx }'">
																			<input type="button" value="삭제" onclick="confirmDelete('${board.board_idx}&item_category=${param.item_category}&manager_brandname=${param.manager_brandname}')">
																		 </div>
													                </td>  
													            </tr>  
													        </tbody>  
												        </c:forEach>
												    </table>  												    
<!-------------------------------------------게시판 끝------------------------------------------->


												    <script type="text/javascript">
														function confirmDelete(board_idx) {
															// confirm() 함수를 사용하여 "삭제하시겠습니까?" 메세지로 확인받아 result 변수에 저장 후
															// result 변수값이 true 일 경우 MemberDelete.me 서블릿 주소 요청(파라미터로 id 전달)
															let result = confirm("삭제하시겠습니까?");
															
															if(result) {
																location.href="ReviewDelete.bo?board_idx=" + board_idx+"&item_idx=" + ${item.item_idx};
															}
														}
													</script>
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
								                   <%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
								                    <div class="ps-pagination">
								                        <ul class="pagination">
								                            <li><%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%><a href="BoardList.bo?board_idx=${board.board_idx} '"><%}%>Prev<i class="icon-chevron-left"></i></a></li>
								                            <li><%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%><a href="BoardList.bo?board_idx=${board.board_idx} "><%}%>Next<i class="icon-chevron-right"></i></a></li>
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
                                                    <%
                                                	item = (ItemVO) request.getAttribute("item");
                                                	score = (int)Math.round(Double.parseDouble(item.getBoard_star_score()));
                                                	pageContext.setAttribute("score", score);
                                         	        %>
                                                    <h3>${item.board_star_score }</h3>
                                                    <select class="ps-rating" data-read-only="true">
                                                    <c:forEach var="i" begin="1" end="5">
                                                    
                                                    	<c:choose>
                                                    		<c:when test="${i <= score}">
                                                    			<option value="1">${i }</option>
                                                    		</c:when>
                                                    		<c:otherwise>
                                                    			<option value="2">${i }</option>
                                                    		</c:otherwise>
                                                    	</c:choose>
                                                    
                                                    </c:forEach>
                                                    </select><span>${item.count } review</span>
                                                </div>
                                                <div class="ps-block__star"><span>5 Star</span>
                                                    <div class="ps-progress" data-value="${item.star5 }"><span></span></div><span>${item.star5 }%</span>
                                                </div>
                                                <div class="ps-block__star"><span>4 Star</span>
                                                    <div class="ps-progress" data-value="${item.star4 }"><span></span></div><span>${item.star4 }%</span>
                                                </div>
                                                <div class="ps-block__star"><span>3 Star</span>
                                                    <div class="ps-progress" data-value="${item.star3 }"><span></span></div><span>${item.star3 }%</span>
                                                </div>
                                                <div class="ps-block__star"><span>2 Star</span>
                                                    <div class="ps-progress" data-value="${item.star2 }"><span></span></div><span>${item.star2 }%</span>
                                                </div>
                                                <div class="ps-block__star"><span>1 Star</span>
                                                    <div class="ps-progress" data-value="${item.star1 }"><span></span></div><span>${item.star1 }%</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-8 col-lg-7 col-md-12 col-sm-12 col-12 ">
                                            <form class="ps-form--review" action="ReviewWritePro.bo" method="post" name="reviewForm" enctype="multipart/form-data">
                                                <h4>PRODUCT REVIEW</h4>
                                                <p><sup>*</sup>상품에 대한 후기를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.<br>
												<sup>*</sup>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 비건마켓 내 1:1 문의에 남겨주세요.</p>
                                                <div class="form-group form-group__rating">
                                                    <label>별점을 매겨주세요</label>
                                                    <select class="ps-rating" data-read-only="false" id="board_star_score" name="board_star_score" required="required">
                                                        <option value="0">0</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                	<input type="hidden" name="board_id" value="${sessionScope.sId}" />
                                                	<input type="hidden" name="item_idx" value="${item.item_idx}" />
                                                	<input type="hidden" name="item_category" value="${item.item_category}" />
                                                	<input type="hidden" name="manager_brandname" value="${item.manager_brandname}" />
                                                	<input type="hidden" id="pageNum" name="pageNum" value="${param.pageNum }" />
                                                    <textarea class="form-control" id="board_subject" name="board_subject" rows="1" placeholder="상품후기를 남겨주세요" required="required"></textarea>
                                                    <textarea class="form-control" id="board_content" name="board_content" rows="6" placeholder="상품후기를 남겨주시면 적립금을 드립니다?!?!?!?!?!?!?" required="required"></textarea>
                                                </div>
                                                <div align="right">
	                                                <div class="form-group submit">
	                                                     <input type="file" name="file_1" id="file_1">
	                                                     <input type="file" name="file_2" id="file_2">
	                                                    <button class="ps-btn" type="submit">Submit Review</button>
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
<!-- 													<table cellspacing="0" border="1" class="recruit" > -->
													<table border="1" class="recruit" >
													        <colgroup>  
													            <col width="63%">  
													            <col width="10%">  
													            <col width="10%">  
													            <col width="10%">  
													        </colgroup>  
													        <thead align="center">  
													            <tr class="" >  
<!-- 													                <th scope="col">번호</th>   -->
													                <th scope="col">제목</th>  
													                <th scope="col">작성자</th>  
													                <th scope="col">작성일</th>  
													                <th scope="col">답변상태</th>  
													            </tr>  
													        </thead>  
													        
													        
													        <c:forEach var="qna" items="${qnaList }">
														        <tbody>  
														            <tr class="item">  
<!-- 														                <td>1</td>   -->
														                <td>${qna.qna_subject }</td>  
														                <td>${qna.qna_id }</td>  
															            <fmt:parseDate var="dateString" value="${qna.qna_date }" pattern="yyyyMMdd" />
														                <td><fmt:formatDate value="${dateString }" type="date" pattern="yyyy.MM.dd" /></td> 
														                <td>${qna.qna_category }</td>  
														            </tr>  
														            <tr class="hide">  
														                <td colspan="4"><br>
														            		${qna.qna_content }
														            		<br><br><br>
														            	
														                	(관리자의 답글)<br>
														                    안녕하세요 베지터틀 입니다. <br>
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
														                    <br><br><br>
														                  <div align="right">
																		    <button>좋아용</button>
																			<input type="button" value="수정" onclick="location.href='QnaModify.bo?item_idx=${item.item_idx }&qna_idx=${qna.qna_idx }&item_category=${param.item_category}&manager_brandname=${param.manager_brandname }'">
																			<input type="button" value="삭제" onclick="qnaDelete('${qna.qna_idx}&item_category=${param.item_category}&manager_brandname=${param.manager_brandname}')">
																		 </div>
														                </td>  
														            </tr>  
														        </tbody>  
													        </c:forEach>
													    </table>  
												    <br>
												    
												     <!-- 페이징 버튼들 시작 -->
								                   <%PageInfo pageInfo1 = (PageInfo)request.getAttribute("pageInfo"); %>
								                    <div class="ps-pagination">
								                        <ul class="pagination">
								                           
								                            <li><%if(pageInfo1.getPageNum() > pageInfo1.getStartPage()) {%><a href="BoardList.bo?pageNum=${pageInfo1.pageNum - 1}'"><%}%><i class="icon-chevron-left"></i>Prev</a></li>
								                            <li><%if(pageInfo1.getPageNum() < pageInfo1.getMaxPage()) {%><a href="ItemDetail.bo?item_idx=${item.item_idx}"><%}%>Next<i class="icon-chevron-right"></i></a></li>
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
  								<script type="text/javascript">
									function qnaDelete(qna_idx) {
										// confirm() 함수를 사용하여 "삭제하시겠습니까?" 메세지로 확인받아 result 변수에 저장 후
										// result 변수값이 true 일 경우 MemberDelete.me 서블릿 주소 요청(파라미터로 id 전달)
										let result = confirm("삭제하시겠습니까잉?");
										
										if(result) {
											location.href="QnaDelete.bo?qna_idx=" + qna_idx+"&item_idx=" + ${item.item_idx};
										}
									}
								</script>
 <!-- ==========상품문의 목록 끝=========================================================================================================     -->   
  
  
  
  
  <!-- ==========상품문의 작성  시작=========================================================================================================     --> 
  							  <div class="ps-tab" id="tab-4-1">
                                    <div class="row">
                                        <div class="col-xl-10 col-lg-7 col-md-12 col-sm-12 col-12 ">
                                            <form class="ps-form--review" action="QnaWritePro.bo" method="post" name="QnaForm">
                                                
                                                <h4>PRODUCT REVIEW</h4>
                                                <p><sup>*</sup>상품에 대한 후기를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.<br>
												<sup>*</sup>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 비건마켓 내 1:1 문의에 남겨주세요.</p>
                                                <div class="form-group">
                                                	<input type="hidden" name="qna_id" value="${sessionScope.sId}" />
                                                	<input type="hidden" name="item_idx" value="${item.item_idx}" />
                                                	<input type="hidden" name="item_category" value="${item.item_category}" />
                                                	<input type="hidden" name="manager_brandname" value="${item.manager_brandname}" />
                                                	<input type="hidden" id="pageNum" name="pageNum" value="${param.pageNum }" />
                                                    <textarea class="form-control" id="qna_subject" name="qna_subject" rows="1" placeholder="상품문의 작성 전 확인해주세요 "></textarea>
                                                    <textarea class="form-control" id="qna_content" name="qna_content" rows="15" cols="60" placeholder=
"* 답변은 영업일 기준 2~3일 소요됩니다
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
	                                                    <button class="ps-btn" type="submit">Submit Review</button>
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
						 <c:forEach var="item" items="${sameBrand }">
                         <div class="ps-product">
                            <div class="ps-product__thumbnail"><a href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}"><img  src="/Code_Green/resources/item/${item.file1 } " alt=""></a>
                                <ul class="ps-product__actions">
                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                </ul>
                            </div>
                            <div class="ps-product__container"><a class="ps-product__vendor" href="#">${item.manager_brandname }</a>
                                <div class="ps-product__content"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                    <div class="ps-product__rating">
                                        <select class="ps-rating" data-read-only="true">
                                            <option value="1">1</option>
                                            <option value="1">2</option>
                                            <option value="1">3</option>
                                            <option value="1">4</option>
                                            <option value="2">5</option>
                                        </select><span>${item.board_star_score }</span>
                                    </div>
                                   <h4 class="ps-product__price">${item.item_price }원</h4>
                                </div>
                                <div class="ps-product__content hover"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                     <h4 class="ps-product__price">${item.item_price }원</h4>
                                </div>
                            </div>
                        </div>
                       </c:forEach>
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
                    <div class="ps-carousel--nav owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="2500" data-owl-gap="30" data-owl-nav="true" data-owl-dots="true" data-owl-item="6" data-owl-item-xs="2" data-owl-item-sm="2" data-owl-item-md="3" data-owl-item-lg="4" data-owl-item-xl="5" data-owl-duration="1000" data-owl-mousedrag="on">
                       
                       <c:forEach var="item" items="${itemList6 }">
                       
                        <div class="ps-product">
                            <div class="ps-product__thumbnail"><a href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}"><img  src="/Code_Green/resources/item/${item.file1 } " alt=""></a>
                                <ul class="ps-product__actions">
                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                </ul>
                            </div>
                            <div class="ps-product__container"><a class="ps-product__vendor" href="#">${item.manager_brandname }</a>
                                <div class="ps-product__content"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                    <div class="ps-product__rating">
                                        <select class="ps-rating" data-read-only="true">
                                            <option value="1">1</option>
                                            <option value="1">2</option>
                                            <option value="1">3</option>
                                            <option value="1">4</option>
                                            <option value="2">5</option>
                                        </select><span>${item.board_star_score }</span>
                                    </div>
                                   <h4 class="ps-product__price">${item.item_price }원</h4>
                                </div>
                                <div class="ps-product__content hover"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                     <h4 class="ps-product__price">${item.item_price }원</h4>
                                </div>
                            </div>
                        </div>
                       </c:forEach>
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