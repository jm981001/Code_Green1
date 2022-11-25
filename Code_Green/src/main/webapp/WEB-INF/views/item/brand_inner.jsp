<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
           
           
             <div class="ps-section__left">
                  <aside class="widget widget--vendor">
                           
                            <h3 class="widget-title" id="brandNameBar">${ brandDetail.manager_brandname}</h3>
	                           
	                            <div class="brandfollowbtn" style="display: none">
		                            <img src="/Code_Green/resources/img/forzero/eheart.png" class="heart_icon_brand">
									<%--  팔로확인 할때 ${brandItemList.manager_idx }, ${sessionScope.sId} 가져가야함 --%>
		                            <a class="ps-block__inquiry" href="#">Follow</a>
	                            </div>
	                            
                            <div class="ps-block__user" >
		                     	<div class="ps-block__user-avatar">
		                     	<!-- 브랜드별 로고띄우기 -->
	                     		   <img src="<%=request.getContextPath() %>/resources/brand_logo/${ brandDetail.manager_original_file}">
		                           <div class="brand_info">
		                           		${ brandDetail.manager_info}<br>
		                           		<c:choose>
			                           		<c:when test="${ brandDetail.brand_follower gt 0}"> 
			                           		<small>지금 이 브랜드를<br>
			                           			${brandDetail.brand_follower}명이 팔로하고 있습니다!</small>
			                           		</c:when>
			                           		<c:when test="${brandDetail.brand_follower == 0 }">
				                           		<small>아직 아무도 팔로하고있지 않습니다!<br>
				                           		첫 단골이 되어보세요:) </small>
			                           		</c:when>
		                           		</c:choose>
		                           </div>
		                    	</div>
		                    </div>
	<!-- =========================================== 사이드바 시작 ======================================================== -->

					<aside class="widget widget_shop">
		                <h4 class="widget-title">BY BRANDS</h4>
		                <figure class="ps-custom-scrollbar" data-height="250">
		                  <c:forEach var="brand" items="${brandList }" >
		                    <div class="ps-checkbox">
		                        <input class="form-control" type="checkbox" id="m-brand-${brand.manager_idx }" name="${brand.manager_idx }" />
		                        <label for="m-brand-${brand.manager_idx }">${brand.manager_brandname } 
		                        <c:choose>
		                        	<c:when test="${not empty brand.brand_itemCnt }">
		                        	(${brand.brand_itemCnt })</label></c:when>
		                        	<c:otherwise>(0)</label></c:otherwise>
		                     	</c:choose>
		                    </div>
		                   </c:forEach>
		                </figure>
		                
		                <figure>
		                	<!-- 가격검색 목록 -->    
		                    <h4 class="widget-title">By Price</h4>
		                    <div class="leftbar_searchbyprice">
		                            <form action="SearchByPrice.mo" method="get">
		                            	<input type="hidden" name="manager_idx" value="${ brandDetail.manager_idx}">
			                            <input type="text" class="num1" name="min_p" placeholder="최저가" style="width: 70px" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">원 ~ 
			                            <input type="text" class="num2" name="max_p" placeholder="최고가" style="width: 70px"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">원<br>  
			                            <input type="submit" value="검색" >
		                            </form>
		                     </div>
		                </figure>
		                
					</aside>
 	<!-- =========================================== 사이드바 끝======================================================== -->	
					
                 </aside>
             </div>
         	 <div class="ps-section__right">
           
           
          <!-- 상품리스트 헤더  -->
                    
               <div class="ps-shopping ps-tab-root">
                   <div class="ps-shopping__header">
                       <p>총<strong> ${brandDetail.brand_itemCnt } </strong> 개의 상품 </p>
                      <div id="orderbylist"><a href="#">최근순</a>  |  <a href="#">판매량순</a></div>
                   </div>
           <!-- =========================================== 상품리스트 시작=====================================================-->
           <!-- ===================================== 상품 1개당 ================================================== --> 
                    <div class="ps-tabs">
                        <div class="ps-tab active" id="tab-1">
                            <div class="ps-shopping-product">
                                <div class="row">
                                
           						<c:forEach var="brand" items="${brandItemList }">
                                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-6 ">
                                        <div class="ps-product">
                                            <div class="ps-product__thumbnail">
                                            
                                            <a href="ItemDetail.bo?item_idx=${brand.item_idx}&manager_brandname=${brand.manager_brandname}&item_category=${brand.item_category}" ><img src="/Code_Green/resources/item/${brand.file1 }"/></a>
                                                <ul class="ps-product__actions">
                                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add To Cart"><i class="icon-bag2"></i></a></li>
                                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                                </ul>
                                            </div>
                                           <div class="ps-product__container"><a class="ps-product__vendor" href="ItemDetail.bo?item_idx=${brand.item_idx}&manager_brandname=${brand.manager_brandname}&item_category=${brand.item_category}">${brand.manager_brandname }</a>
                                               <div class="ps-product__content"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${brand.item_idx}&manager_brandname=${brand.manager_brandname}&item_category=${brand.item_category}">${brand.item_name }</a>
                                                    <div class="ps-product__rating">
                                                   	 <select class="ps-rating" data-read-only="true">
                                                        <c:forEach var="i" begin="1" end="5">
			                                             	<c:choose>
			                                             		<c:when test="${i <= brand.score}">
			                                             			<option value="1">${i }</option>
			                                             		</c:when>
			                                             		<c:otherwise>
			                                             			<option value="2">${i }</option>
			                                             		</c:otherwise>
			                                             	</c:choose>
			                                             </c:forEach>
                                                      </select><span>${brand.board_star_score }</span>
                                                    </div>
                                                  <h4 class="ps-product__price">${brand.item_price }원</h4>
                                                </div>
                                                
                                                <div class="ps-product__content hover"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${brand.item_idx}&manager_brandname=${brand.manager_brandname}&item_category=${brand.item_category}">${brand.item_name }</a>
                                                <h4 class="ps-product__price">${brand.item_price }원</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                               </c:forEach>     
                                </div>
                            </div>
                                </div>
                           </div>
                       </div>
					</div>
		<!-- =========================================== 상품리스트 끝=====================================================-->