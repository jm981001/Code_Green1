<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>로그인 | Login</title>
    <!-- Css Styles -->
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
	<link rel="stylesheet" href="/Code_Green/resources/plugins/nouislider/nouislider.min.css">
	<link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
	<link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
	
	<style type="text/css">
	h5{
		text-align: center;
	}
	
	.ps-btn, button.ps-btn {
		  background-color: #5fa30f;
		  color: #ffffff;
		  margin: 5px;
	}
	</style>
</head>
<body>
	<!-- 헤더 삽입 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 삽입 -->
    
    <!-- ----------------------------------바디 시작------------------------------------  -->
    
     <div class="ps-page--my-account">
        <div class="ps-my-account">
            <div class="container">
                <form class="ps-form--account ps-tab-root" action="MemberLoginPro.me" method="post">
                    <ul class="ps-tab-list">
                        <li class="active"><a href="login">로그인</a></li>
                        <li><a href="join">회원가입</a></li>
                    </ul>
                    <div class="ps-tabs">
                        <div class="ps-tab active" id="sign-in">
                            <div class="ps-form__content">
                                <h5>회원계정으로 로그인하세요</h5>
                                <div class="form-group">
                                    <input class="form-control" type="text" name="member_id"   placeholder="아이디를 입력하세요">
                                </div>
                                <div class="form-group form-forgot">
                                    <input class="form-control" type="text" name="member_pass"  placeholder="비밀번호를 입력하세요">
                                </div>
                                <div class="form-group submtit">
                                    <button class="ps-btn ps-btn--fullwidth">로그인</button>
                                </div>
                            </div>
                            <h5><a href="">아이디 / 비밀번호 찾기</a> </h5>
                            <div class="ps-form__footer">
                                <div class="form-group submtit">
                                    <button class="ps-btn ps-btn--fullwidth" style="background-color: #19ce60">네이버 로그인</button>
                                    <button class="ps-btn ps-btn--fullwidth" style="background-color: #fae100">카카오 로그인</button>
                                </div>
                            </div>
                        </div>
                       </div>
                </form>
            </div>
        </div>
    </div>
    
    
    
    
    <!-- ----------------------------------바디 끝--------------------------------------  -->
    
	<!-- 푸터 삽입 -->    
 	<jsp:include page="../inc/footer.jsp"></jsp:include>
 	<!-- 푸터 삽입 -->
 	
</body>
</html>