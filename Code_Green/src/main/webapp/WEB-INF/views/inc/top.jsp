<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script>
	function logout() {
		let result = confirm("로그아웃 하시겠습니까?");
		
		if(result) {
			location.href = "MemberLogout.me";
		}
	}
</script>

<style>
	/* 	거북스 넣어봤스...히히 */
	.header--organic .ps-form--quick-search input::-webkit-input-placeholder{
	
	    background-image: url("/Code_Green/resources/img/turtle4searchbox.png");
	    background-repeat: no-repeat;
		background-size: 27px 27px;
	    background-position:  40px center;
	    background-repeat: no-repeat;
	    text-indent: 0;
	}

</style>
    
    
    <header class="header header--organic" data-sticky="true">
        <div class="header__top">
            <div class="container">
                <div class="header__left">
                   <a class="ps-logo" href="/Code_Green"><img src="/Code_Green/resources/img/logo-organic.png"></a>
                </div>
                
                
                <!-- 서치박스 -->
                
                <div class="header__center">
                    <form class="ps-form--quick-search" action="index.html" method="get">
                        <div class="form-group--icon"><i class="icon-chevron-down"></i>
                            <select class="form-control">
                                <option value="1">All</option>
                                <option value="1">상품명</option>
                                <option value="1">브랜드명</option>
                                <option value="1">게시글</option>
                                <option value="1">레시피</option>
                            </select>
                        </div>
                        <input class="form-control" type="text" placeholder=".............">
                        <button>search</button> <!-- 여기 단어대신에 그냥 아이콘(돋보기)넣어도 깔끔할듯 -->
                    </form>
                </div>
                <div class="header__right">
                    <div class="header__actions"><a class="header__extra" href="myPage_heart?member_id=${sessionScope.sId }"><i class="icon-heart"></i><span><i>0</i></span></a>
                        <div class="ps-cart--mini"><a class="header__extra" href="cart"><i class="icon-bag2"></i><span><i>0</i></span></a>
                        </div>
                        <c:choose>
                      	  <c:when test="${empty sessionScope.sId }">
	                        <div class="ps-block--user-header">
	                            <div class="ps-block__left"><i class="icon-user"></i></div>
	                            <div class="ps-block__right"><a href="login">Login</a><a href="join">Join</a></div>
	                        </div>
	                       </c:when>
	                       <c:otherwise>
	                        <a href="MemberInfo.me?member_id=${sessionScope.sId }">${sessionScope.sId}님 </a> <a href="javascript:logout()">Logout</a>
                   	   		<c:if test="${sessionScope.sId eq 'admin' }">| <a href="AdminMain.me">관리자페이지</a></c:if>
                   	   		</c:otherwise>
                   	    </c:choose>
                    </div>
                </div>
            </div>
        </div>
        
        
        <!-- -----------------------------------------여기가 웹시작임----------------------------------------------------- -->
        <nav class="navigation">
            <div class="container">
                <div class="navigation__left">
                    <div class="menu--product-categories">
                        <div class="menu__toggle"><i class="icon-menu"></i><span>카테고리</span></div>
                        <div class="menu__content">
                            <ul class="menu--dropdown">
                                <li><a href="category_sale">특가 상품</a> </li>
                                <li><a href="category_fruit_vegi">과일 / 채소</a> </li>
                                <li><a href="category_dairy_drink">유제품 / 음료</a></li>
                                <li><a href="category_iced_easy">냉동 식품 / 간편 식품</a></li>
                                <li><a href="category_fish">해산물 </a></li>
                                <li><a href="category_snack">간식류</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                
                
                <div class="navigation__right">
                    <ul class="menu menu--organic">
                    
                        <li class="menu-item-has-children"><a href="ItemList.bo">신상품</a><span class="sub-toggle"></span> </li>                     
          
                        <li class="menu-item-has-children has-mega-menu"><a href="item_best">베스트</a><span class="sub-toggle"></span></li>   
                        <li class="menu-item-has-children has-mega-menu"><a href="welcome_vegun">어서와, 비건은 처음이지?</a></li>   
                        <li class="menu-item-has-children has-mega-menu"><a href="brand_main">브랜드별</a><span class="sub-toggle"></span></li>   
                        <li class="menu-item-has-children has-mega-menu"><a href="recipe_main">레시피</a></li>   
                        <li class="menu-item-has-children has-mega-menu"><a href="community_main">커뮤니티</a></li>   
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    