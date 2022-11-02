<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/Code_Green/resources/js/jquery-3.6.1.js"></script>
	
 <style type="text/css">
   	#companyDiv{
   		display: none;
   	}
 </style>	
	
<script type="text/javascript">

	function setDisplay(){    
		if($('input:radio[id=memberJoin]').is(':checked')){
			$('#companyDiv').hide(); 
	     	$('#memberDiv').show();
		} else {
			$('#memberDiv').hide(); 
	     	$('#companyDiv').show();
		}
}
</script>
<title>일반 회원가입</title>
<style type="text/css">
* {
	box-sizing: border-box;
	outline: none;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 14px;
	background-color: #f5f6f7;
	line-height: 1.5em;
	color: #222;
	margin: 0;
}

a {
	text-decoration: none;
	color: #222;
}

.member {
	width: 400px;
	margin: 50px auto;
	padding: 0 10px;
	margin-bottom: 10px;
}

.member .logo {
	display: block;
	margin: 50px auto;
}

.member .field {
	margin: 5px 0;
}

.member b {
	display: block;
	margin-bottom: 5px;
}

.member input:not(input[type=radio]), .member select {
	border: 1px solid #dadada;
	padding: 10px;
	width: 100%;
	margin-bottom: 5px;
}

.member input[type=button], .member input[type=submit] {
	background-color: #5fa30f;
	color: #fff
}

.member input:focus, .member select:focus {
	border: 1px solid #2db400;
}

.field.birth div {
	display: flex;
	gap: 10px;
}

.field.tel-number div {
	display: flex;
}

.field.tel-number div input:nth-child(1) {
	flex: 2;
}

.field.tel-number div input:nth-child(2) {
	flex: 1;
}

.field.post-code div {
	display: flex;
}

.field.post-code div input:nth-child(1) {
	flex: 2;
}

.field.post-code div input:nth-child(2) {
	flex: 1;
}

memberType div {
	background: none;
	border: none;
}

.placehold-text {
	display: block;
	position: relative;
}

.placehold-text:before {
	position: absolute;
	right: 20px;
	top: 13px;
	pointer-events: none;
}

.userpw {
	background: url(./images/images2/icon-01.png) no-repeat center right
		15px;
	background-size: 20px;
	background-color: #fff;
}

.userpw-confirm {
	background: url(./images/images2/icon-02.png) no-repeat center right
		15px;
	background-size: 20px;
	background-color: #fff;
}

.member-footer {
	text-align: center;
	font-size: 12px;
	margin-top: 20px;
}

.member-footer div a:hover {
	text-decoration: underline;
	color: #2db400
}

.member-footer div a:after {
	content: '|';
	font-size: 10px;
	color: #bbb;
	margin-right: 5px;
	margin-left: 7px;
	display: inline-block;
	transform: translateY(-1px);
}

.member-footer div a:last-child:after {
	display: none;
}

@media ( max-width :768px) {
	.member {
		width: 100%;
	}
}

button {
	background-color: #5fa30f;
	color: #fff;
}

.ps-vendor-dashboard .container .ps-section__header{
	padding: 100px 0 10px 0;
}

.ps-footer {
	background-color: white;
}
</style>
</head>
<body>
	<!-- 헤더 삽입 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 헤더 삽입 -->


	<div class="ps-vendor-dashboard">
			 <div class="container">
				<div class="ps-section__header">
			       <h3>회원가입</h3>
			    </div>
			</div>
		</div>

	<!-- ----------------------------------바디 시작------------------------------------  -->
	<form action="join_result" method="get" name="joinForm" id="signup"
		onsubmit="return checkForm()">
<!--------------------------------개인----------------------------------->		
		<div class="member">
			<div class="field memberType">
				<b>구분</b>
				<div>
					<label><input type="radio" name="memberType" id="memberJoin" checked onchange="setDisplay()">개인</label>
					<label><input type="radio" name="memberType" id="companyJoin" onchange="setDisplay()">기업</label> 
				</div>
			</div>
			
		<div id="memberDiv">
			<div class="field">
				<b>아이디</b> <span class="placehold-text"><input type="text"></span>
			</div>
			<div class="field">
				<b>비밀번호</b> <input class="userpw" type="password">
			</div>
			<div class="field">
				<b>비밀번호 재확인</b> <input class="userpw-confirm" type="password">
			</div>
			<div class="field">
				<b>이름</b> <input type="text">
			</div>
			<div class="field">
				<b>닉네임</b> <span class="placehold-text"><input type="text"></span>
			</div>
			<div class="field">
				<b>본인 확인 이메일<small>(선택)</small></b> <input type="email" placeholder="선택입력">
			</div>
			<div class="field post-code">
				<b>주소</b>
				<div>
					<input type="text" name="post_code" id="post_code" placeholder="우편번호"> <input type="button" value="주소검색">
				</div>
				<input type="text" name="address1" id="address1" placeholder="주소">
				<input type="text" name="address2" id="address2" placeholder="상세주소">
			</div>
			<div class="field tel-number">
				<b>전화</b>
				<div>
					<input type="tel" placeholder="전화번호 입력">
				</div>
			</div>
			<input type="submit" value="가입하기">
		</div>
		
<!--------------------------------개인----------------------------------->	

	
<!--------------------------------기업----------------------------------->		
		<div id="companyDiv">
			<div class="field">
				<b>아이디</b> <span class="placehold-text"><input type="text"></span>
			</div>
			<div class="field">
				<b>비밀번호</b> <input class="userpw" type="password">
			</div>

			<div class="field">
				<b>비밀번호 재확인</b> <input class="userpw-confirm" type="password">
			</div>

			<div class="field">
				<div>
					<b>브랜드이름</b> <span class="placehold-text"><input type="text"></span>
					<b>로고</b> <input type="file" style="background-color: white; padding: 0px">
				</div>
			</div>
			<div class="field">
				<b>상호명</b> <input type="text">
			</div>

			<div class="field">
				<b>본인 확인 이메일<small>(선택)</small></b> <input type="email"
					placeholder="선택입력">
			</div>
			<div class="field post-code">
				<b>주소</b>
				<div>
					<input type="text" name="post_code" id="post_code" placeholder="우편번호"> <input type="button" value="주소검색">
				</div>
				<input type="text" name="address1" id="address1" placeholder="주소">
				<input type="text" name="address2" id="address2" placeholder="상세주소">
			</div>
			<div class="field tel-number">
				<b>전화</b>
				<div>
					<input type="tel" placeholder="전화번호 입력">
				</div>
			</div>
			<input type="submit" value="가입하기">
		</div>
	</div>
<!--------------------------------기업----------------------------------->		
	</form>


	<!------------------------------------바디 끝--------------------------------------  -->


	<!-- 푸터 삽입 -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- 푸터 삽입 -->

</body>
</html>