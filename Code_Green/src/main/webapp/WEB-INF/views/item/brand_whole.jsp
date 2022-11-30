<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

           							<c:forEach var="brand" items="${brandItemList }">
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
		                               </c:forEach>     
                                   
		<!-- =========================================== 상품리스트 끝=====================================================-->