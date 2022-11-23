<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="apple-touch-icon.png" rel="apple-touch-icon">
    <link href="favicon.png" rel="icon">
    <title>내 브랜드 정보수정</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/summernote/summernote-bs4.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/apexcharts-bundle/dist/apexcharts.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_manager.css">

</head>

<body>
    <header class="header--mobile">
        <div class="header__left">
            <button class="ps-drawer-toggle"><i class="icon icon-menu"></i></button><img src="" alt="">
        </div>
        <div class="header__center"><a class="ps-logo" href="#"><img src="img/logo.png" alt=""></a></div>
        <div class="header__right"><a class="header__site-link" href="#"><i class="icon-exit-right"></i></a></div>
    </header>
    <aside class="ps-drawer--mobile">
        <div class="ps-drawer__header">
            <h4> Menu</h4>
            <button class="ps-drawer__close"><i class="icon icon-cross"></i></button>
        </div>
        <div class="ps-drawer__content">
            <ul class="menu">
              		           <li><a class="active" href="manager_index"><i class="icon-home"></i>관리자메인페이지</a></li>
				                <li><a href="products?manager_id=${sessionScope.sId }"><i class="icon-database"></i>상품관리</a></li>
				                <li><a href="inventory_management"><i class="icon-database"></i>재고관리</a></li>
				                <li><a href="orders"><i class="icon-bag2"></i>주문관리</a></li>
				                <li><a href="sales_main"><i class="icon-papers"></i>매출관리</a></li>
				                <li><a href="qnaboard_list"><i class="icon-users2"></i>답변관리</a></li>
				                <li><a href="follower_list"><i class="icon-users2"></i>팔로우목록</a></li>
				                <li><a href="sales_management"><i class="icon-percent-circle"></i>정산</a></li>
								<li><a href="brand_mypage?manager_id=${sessionScope.sId }"><i class="icon-cog"></i>내브랜드정보</a></li>
            </ul>
        </div>
    </aside>
    <div class="ps-site-overlay"></div>
    <main class="ps-main">
        <div class="ps-main__sidebar">
            <div class="ps-sidebar">
                <div class="ps-sidebar__top">
                    <div class="ps-block--user-wellcome">
                        <div class="ps-block__left"><img src="img/user/admin.jpg" alt="" /></div>
                        <div class="ps-block__right">
                        <h4><strong>${sessionScope.sId }</strong> 님 환영합니다</h4>
                        </div>
                        <div class="ps-block__action"><a href="#"><i class="icon-exit"></i></a></div>
                    </div>
                    <div class="ps-block--earning-count"><small>수익</small>
                        <h3>$12,560.55</h3>
                    </div>
                </div>
                <div class="ps-sidebar__content">
                    <div class="ps-sidebar__center">
                        <ul class="menu">
               					<li><a class="active" href="manager_index"><i class="icon-home"></i>관리자메인페이지</a></li>
				                <li><a href="products?manager_id=${sessionScope.sId }"><i class="icon-database"></i>상품관리</a></li>
				                <li><a href="inventory_management"><i class="icon-database"></i>재고관리</a></li>
				                <li><a href="orders"><i class="icon-bag2"></i>주문관리</a></li>
				                <li><a href="sales_main"><i class="icon-papers"></i>매출관리</a></li>
				                <li><a href="qnaboard_list"><i class="icon-users2"></i>답변관리</a></li>
				                <li><a href="follower_list"><i class="icon-users2"></i>팔로우목록</a></li>
				                <li><a href="sales_management"><i class="icon-percent-circle"></i>정산</a></li>
								<li><a href="brand_mypage?manager_id=${sessionScope.sId }"><i class="icon-cog"></i>내브랜드정보</a></li>
                        </ul>
                    </div>
                    <div class="ps-sidebar__footer">
                        <div class="ps-copyright"><img src="img/logo.png" alt="">
                            <p>&copy;2022 CODE GREEN. <br/> All rights reversed.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ps-main__wrapper">
            <header class="header--dashboard">
                <div class="header__left">
                    <h3>내브랜드 정보</h3>
                </div>
                <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 이동</span><i class="icon-exit-right"></i></a></div>
            </header>
            <section class="ps-dashboard ps-items-listing">
                <div class="ps-section__left">
                    <section class="ps-card">
                        <div class="ps-card__header">
                            <h4>${brandInfo.manager_id }님의 페이지</h4>
                            

                            <hr>
                            <br>
                          <!-- 파일 업로드 부분 -->
                                 <div class="card" style="width: 25rem;">
						  <img src="/Code_Green/resources/img/brand_logo/${brandInfo.manager_original_file }" alt="${brandInfo.manager_original_file }" />
						  <div class="card-body">
<%-- 						    <h5 class="card-title">${brandInfo.manager_brandname }</h5> --%>
						    <p class="card-text">${brandInfo.manager_realfile }</p>
						    <input type="file"class="파일선택1" id="manager_realfile"name="manager_realfile"value="${brandInfo.manager_realfile }">
						    	<c:if test="${manager_realfile ne 'N' }">(기존파일:<span id="here"></span>
	                                    	<button onclick="deletemanager_Realfile()">삭제</button>)
		                                   		 <script>
										       		let name = '${manager_realfile}';
										       		let result = name.split('_');
										       		$('#here').text(result[1]);
										      	</script>
	                                    	</c:if>
						      
                            <!-- 파일 업로드 부분 -->
                                          
                                    </div>
                                    </div>
                                    </div>
						    
						    
						 
                        <div class="ps-card__content">
                            <form class="ps-form--account-settings" action="brand_mypage_modifyPro.bo?id=${sessionScope.sId}" method="get"name="modifyForm">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>기업번호</label>
                                            <input type="text"class="form-control" id="manager_idx"name="manager_idx"value="${brandInfo.manager_idx}"readonly="readonly"/>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>가입날짜</label>
                                            <input type="text"class="form-control" id="manager_date"name="manager_date"value="${brandInfo.manager_date}"readonly="readonly"/>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>대표이름</label>
                                            <input type="text" class="form-control" id="manager_name" name="manager_name"value="${brandInfo.manager_name}" />
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>브랜드이름</label>
                                            <input type="text" class="form-control" id="manager_brandname"name="manager_brandname" value="${brandInfo.manager_brandname}" />
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>기업아이디</label>
                                            <input type="text" class="form-control" id="manager_id"name="manager_id"value="${brandInfo.manager_id }" />
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>기업비밀번호</label>
                                            <input type="text"class="form-control" id="manager_pass" name="manager_pass"value="${brandInfo.manager_pass}"required="required"/>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>사업자번호</label>
                                            <input type="text" class="form-control" id="manager_storecode"name="manager_storecode" value="${brandInfo.manager_storecode}" />
                                        </div>
                                    </div>
                                
                                  <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>기업 전화번호 </label>
                                             <input type="text"class="form-control" id="manager_phone"name="manager_phone" value="${brandInfo.manager_phone }" />
                                        </div>
                                    </div>
                                
                                  <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>기업이메일</label>
                                            <input type="text"class="form-control" id="manager_email" name="manager_email"value="${brandInfo.manager_email }" />
                                        </div>
                                    </div>
                                     <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>기업 우편번호</label>
                                            <input type="text" class="form-control" id="manager_postcode"name="manager_postcode" value="${brandInfo.manager_postcode }" />
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>기업 주소 </label>
                                            <input type="text"class="form-control" id="manager_address" name="manager_address"value="${brandInfo.manager_address }" />
                                        </div>
                                    </div>
                                       <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>기업 상세정보 </label>
                                            <input type="text"class="form-control" id="manager_info" name="manager_info"value="${brandInfo.manager_info }"/>
                                        </div>

                                <div class="ps-form__submit text-center	">
                                    <button class="ps-btn success" type="submit"id="submitBtn">수정하기</button>
                                    <button class="ps-btn ps-btn--gray mr-3"onclick="history.back()">취소</button>
                                </div>
                            </form>
                        </div>
                    </section>
                </div>
                <div class="ps-section__right"></div>
            </section>
        </div>
    </main>
    <script src="/Code_Green/resources/plugins_manager/jquery.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/popper.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/bootstrap/js/bootstrap.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/jquery.matchHeight-min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/select2/dist/js/select2.full.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/summernote/summernote-bs4.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/apexcharts-bundle/dist/apexcharts.min.js"></script>
    <!-- custom code-->
    <script src="/Code_Green/resources/js/main_manager.js"></script>
</body>

</html>