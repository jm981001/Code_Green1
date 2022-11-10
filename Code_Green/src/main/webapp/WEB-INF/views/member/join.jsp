<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext"rel="stylesheet">
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
<script type="text/javascript">
function setDisplay() {
	if ($('input:radio[id=memberJoin]').is(':checked')) {
		$('#companyDiv').hide();
		$('#memberDiv').show();
	} else {
		$('#memberDiv').hide();
		$('#companyDiv').show();
	}
}

var checkNameResult = false, checkIdResult = false, checkPasswdResult = false;

function checkId(id) {
	let regex = /^[\w-.]{4,16}$/;
	if(!regex.exec(id)) {
		$("#checkIdResult").html("4 ~ 16자리 영문자, 숫자, 특수문자(-_.) 필수!");
		$("#checkIdResult").css("color", "red");
		checkIdResult = false;
	} else {
		$("#checkIdResult").html("사용 가능한 아이디!");
		$("#checkIdResult").css("color", "green");
		checkIdResult = true;
	}
}

function checkName(name) {
	let regex = /^[가-힣]{1,10}$/; //2,10
	if(!regex.exec(name)) {
		$("#checkNameResult").html("이름이 올바르지 않습니다!");
		$("#checkIdResult").css("color", "red");
		$("#name").select();
		checkNameResult = false;
	} else {
		$("#checkNameResult").html("사용가능");
		$("#checkNameResult").css("color", "green");
		checkNameResult = true;
	}
}
function checkPasswd(pass) {
	let regex = /^[A-Za-z0-9!@#$%^&*]{8,20}$/;
	if(!regex.exec(pass)) {
		$("#checkPasswdResult").html("8 ~ 20자리 영문자, 숫자, 특수문자(!@#$%^&*) 필수!");
		$("#checkPasswdResult").css("color", "red");
		checkPasswdResult = false;
	} else {

		// 패스워드 복잡도 검사 추가 => 패스워드 부분 검사
		// 영문 대문자, 소문자, 숫자, 특수문자 조합에 대한 점수 계산 후 
		// 안전, 보통, 위험, 사용불가의 4등급으로 분류하여 결과 출력
		// => 각각의 검사 패턴을 별도로 생성해야함
		let upperCaseRegex = /[A-Z]/; // 대문자
		let lowerCaseRegex = /[a-z]/; // 소문자
		let numRegex = /[0-9]/; // 숫자
		let specialCharRegex = /[!@#$%^&*]/; // 특수문자
		
		let count = 0; // 부분 검사 항목에 대한 점수를 계산하기 위한 변수
		// => 각 검사 항목이 포함되어 있으면 count 값을 1 증가시키기
		// => 주의! 각 항목에 대한 검사는 if 문을 각각 적용해야함! (else if 사용 금지!)
		if(upperCaseRegex.exec(pass)) {
			count++;
		} 

		if(lowerCaseRegex.exec(pass)) {
			count++;
		} 
		
		if(numRegex.exec(pass)) {
			count++;
		} 
		
		if(specialCharRegex.exec(pass)) {
			count++;
		} 
		
		// 부분 검사 결과에 대한 출력
		// => 4점 : "안전" 출력(blue)
		// => 3점 : "보통" 출력(green)
		// => 2점 : "위험" 출력(orange)
		// => 1점 이하 : "사용 불가능한 패스워드" 출력(red)
		switch(count) {
			case 4 : 
				$("#checkPasswdResult").html("안전");
				$("#checkPasswdResult").css("color", "blue");
				checkPasswdResult = true;
				break;
			case 3 : 
				$("#checkPasswdResult").html("보통");
				$("#checkPasswdResult").css("color", "green");
				checkPasswdResult = true;
				break;
			case 2 : 
				$("#checkPasswdResult").html("위험");
				$("#checkPasswdResult").css("color", "orange");
				checkPasswdResult = true;
				break;
			default :
				$("#checkPasswdResult").html("사용 불가능한 패스워드");
				$("#checkPasswdResult").css("color", "red");
				checkPasswdResult = false;
		}
	}
}
</script>

<style type="text/css">
#companyDiv {
	display: none;
}
</style>

<script type="text/javascript">
	function setDisplay() {
		if ($('input:radio[id=memberJoin]').is(':checked')) {
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
/* 	background: url(./images/images2/icon-01.png) no-repeat center right */
		15px;
	background-size: 20px;
	background-color: #fff;
}

.userpw-confirm {
/* 	background: url(./images/images2/icon-02.png) no-repeat center right */
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

.ps-vendor-dashboard .container .ps-section__header {
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
	<form action="MemberJoinPro" method="post" name="joinForm" id="signup"
		onsubmit="return checkForm()">
		<!--------------------------------개인----------------------------------->
		<div class="member">
			<div class="field memberType">
				<b>구분</b>
				<div>
					<label><input type="radio" name="memberType"
						id="memberJoin" checked onchange="setDisplay()">개인</label> <label><input
						type="radio" name="memberType" id="companyJoin"
						onchange="setDisplay()">기업</label>
				</div>
			</div>

			<div id="memberDiv">
				
				<div class="field">
					<b>아이디</b>
					<span class="placehold-text">
					<input type="text" name="member_id" id="member_id" onchange="checkId(this.value)" maxlength='16'>
					<span id="checkIdResult"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
					</span>
				</div>
				
				<div class="field">
					<b>비밀번호</b>
					<input type="password" name="member_pass" class="userpw" id="member_pass" onchange="checkPasswd(this.value)" required="required" size="20" placeholder="8-20자리 영문자,숫자,특수문자 조합" maxlength='20'>
					<span id="checkPasswdResult"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
				</div>
				
				<div class="field">
					<b>이름</b>
					<input type="text" name="member_name" onchange="checkName(this.value)" id="member_name" maxlength='10'>
					<span id="checkNameResult"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
				</div>
				
				<div class="field">
					<b>본인 확인 이메일</b> 
					<input type="email" placeholder="선택입력" name="member_email" required="required" id="member_email" maxlength='30'>
				</div>
				
				<div class="field post-code">
					<b>주소</b>
					<div>
						<input type="text" name="member_postcode" id="member_postcode" placeholder="우편번호"  maxlength='6'>
						<input type="button" value="주소검색" name="">
					</div>
					<input type="text" name="member_address" id="member_address" placeholder="주소"  maxlength='100'>
				</div>
				
				<div class="field tel-number">
					<b>전화</b>
					<div>
						<input type="tel" placeholder="전화번호 입력" name="member_phone"  id="member_phone"  maxlength='11'>
					</div>
				</div>
				<input type="submit" value="가입하기">
			</div>
		</div>
	</form>
	<!--------------------------------개인----------------------------------->


	<!--------------------------------기업----------------------------------->

	<form action="ManagerJoinPro" method="post" name="joinForm" id="signup" onsubmit="return checkForm()" enctype="multipart/form-data">
		<div class="member">
			<div id="companyDiv">
				<div class="field">
					<b>아이디</b> <span class="placehold-text">
					<input type="text" id="manager_id" name="manager_id" maxlength='16' onchange="checkId(this.value)"></span>
					<span id="checkIdResult"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
				</div>
				<div class="field">
					<b>비밀번호</b> 
					<input type="password" name="manager_pass" class="userpw" id="manager_pass" onchange="checkPasswd(this.value)" required="required" size="20" placeholder="8-20자리 영문자,숫자,특수문자 조합" maxlength='19'>
					<span id="checkPasswdResult"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
				</div>
				
				<div class="field">
					<b>기업관리자 이름</b> 
					<input type="text" id="name" name="manager_name" maxlength="10" onchange="checkName(this.value)">
				</div>

				<div class="field">
					<div>
						<b>브랜드이름</b>
						<input type="text" id="manager_brandname" name="manager_brandname" maxlength="20">
						<b>로고</b>
						<input type="file" name="file" required="required" style="background-color: white; padding: 0px" /> 
					</div>
				</div>
				<div class="field">
					<b>사업자번호</b>
					<input type="text" name="manager_storecode" id="manager_storecode" maxlength="20">
				</div>

				<div class="field">
					<b>본인 확인 이메일</b>
					<input type="email" placeholder="선택입력" name="manager_email" id="manager_email" maxlength="30">
				</div>
				<div class="field post-code">
					<b>주소</b>
					<div>
						<input type="text" name="manager_postcode" id="manager_postcode" placeholder="우편번호" maxlength="6"> <input type="button" value="주소검색">
					</div>
						<input type="text" name="manager_address" id="manager_address" placeholder="주소" maxlength="100">
				</div>
				<div class="field tel-number">
					<b>전화</b>
					<div>
						<input type="tel" placeholder="전화번호 입력" id="manager_phone" name="manager_phone" maxlength="11">
					</div>
				</div>
				<input type="submit" value="가입하기">
			</div>
		</div>
	</form>
	<!--------------------------------기업----------------------------------->


	<!------------------------------------바디 끝--------------------------------------  -->


	<!-- 푸터 삽입 -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- 푸터 삽입 -->

</body>
</html>