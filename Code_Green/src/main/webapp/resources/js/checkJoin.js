//debugger;
var checkEmailAuth = false
var checkEmailAuthM = false
//	멤버 주소
 	function Me_execDaumPostcode() {
 	    new daum.Postcode({
 	        oncomplete: function(data) {
 	            document.getElementById("member_postcode").value = data.zonecode;
 	            document.getElementById("member_address").value = data.roadAddress;
 	        }
 	    }).open();
 	}
 	//매니저 주소
 	function Ma_execDaumPostcode() {
 	    new daum.Postcode({
 	        oncomplete: function(data) {
 	            document.getElementById("manager_postcode").value = data.zonecode;
 	            document.getElementById("manager_address").value = data.roadAddress;
 	        }
 	    }).open();
 	}
$(document).ready(function(){ 
	//member용 이메일 인증
	$('#mail-Check-Btn').click(function() {
		const eamil = $('#member_email').val(); // 이메일 주소값 얻어오기
		console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
		$.ajax({
			type : 'get',
			url : 'mailCheck?email='+eamil,
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code =data;
				alert('인증번호가 전송되었습니다.')
			}			
		});
	});
	
	//인증번호 비교 
	$('.mail-check-input').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
		 
		if(inputCode === code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#mail-Check-Btn').attr('disabled',true);
			$('#userEamil1').attr('readonly',true);
			$('#userEamil2').attr('readonly',true);
			$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
	        $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
	        checkEmailAuth = true;
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
			checkEmailAuth = false;
		}
	});
	
	
	//manager용 이메일 인증
	$('#mail-Check-BtnM').click(function() {
		const eamil = $('#manager_email').val(); // 이메일 주소값 얻어오기
		console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
		const checkInput = $('.mail-check-inputM') // 인증번호 입력하는곳 
		
		$.ajax({
			type : 'get',
			url : 'mailCheck?email='+eamil,
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code =data;
				alert('인증번호가 전송되었습니다.')
			}			
		});
	});
	
	//인증번호 비교 
	$('.mail-check-inputM').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warnM');
		
		if(inputCode === code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#mail-Check-BtnM').attr('disabled',true);
			$('#userEamil1').attr('readonly',true);
			$('#userEamil2').attr('readonly',true);
			$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
	        $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
	        checkEmailAuthM = true;
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
			checkEmailAuthM = false;
		}
	});
	
	
});



// member 정규식-----------------------------------------------------------------------------------
	var checkNameResult = false, checkIdResult = false, checkPasswdResult = false;
	var checkNameResultM = false, checkIdResultM = false, checkPasswdResultM = false;

	function checkId(id) {
		let regex = /^[a-z]+[a-z0-9]{5,19}$/g;
		if(!regex.exec(id)) {
			$("#checkIdResult").html("6 ~ 20자리 영문자, 숫자");
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
			$("#member_name").select();
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
	
	
	

	function checkForm() {
		if(!checkNameResult) {
			alert("이름 양식에 맞춰주세요");
			$("#member_name").select();
			return false; // 현재 폼의 submit 동작을 중단하기 위해 false 리턴
		} else if(!checkIdResult) {
			alert("아이디 양식에 맞춰주세요");
			$("#member_id").select();
			return false; // 현재 폼의 submit 동작을 중단하기 위해 false 리턴
		} else if(!checkPasswdResult) {
			alert("패스워드 양식에 맞춰주세요");
			$("#member_pass").select();
			return false; // 현재 폼의 submit 동작을 중단하기 위해 false 리턴
		} else if(!checkEmailAuth) {
			alert("이메일 인증번호가 일치하지 않습니다");
			$(".mail-check-box").select();
			return false; // 현재 폼의 submit 동작을 중단하기 위해 false 리턴
		}
		
		return true;
		
	}
	
	
// manager 정규식-----------------------------------------------------------------------------------		
		function checkIdM(id) {
		let regex = /^[a-z]+[a-z0-9]{5,19}$/g;
		if(!regex.exec(id)) {
			$("#checkIdResultM").html("6 ~ 20자리 영문자, 숫자를 이용해 주세요");
			$("#checkIdResultM").css("color", "red");
			checkIdResultM = false;
		} else {
			$("#checkIdResultM").html("사용 가능한 아이디 입니다");
			$("#checkIdResultM").css("color", "green");
			checkIdResultM = true;
		}
	}

	function checkNameM(name) {
		let regex = /^[가-힣]{1,10}$/; //2,10
		if(!regex.exec(name)) {
			$("#checkNameResultM").html("이름이 올바르지 않습니다");
			$("#checkIdResultM").css("color", "red");
			$("#manager_name").select();
			checkNameResultM = false;
		} else {
			$("#checkNameResultM").html("사용가능");
			$("#checkNameResultM").css("color", "green");
			checkNameResultM = true;
		}
	}
	function checkPasswdM(pass) {
		let regex = /^[A-Za-z0-9!@#$%^&*]{8,20}$/;
		if(!regex.exec(pass)) {
			$("#checkPasswdResultM").html("8 ~ 20자리 영문자, 숫자, 특수문자(!@#$%^&*) 필수!");
			$("#checkPasswdResultM").css("color", "red");
			checkPasswdResultM = false;
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
					$("#checkPasswdResultM").html("안전");
					$("#checkPasswdResultM").css("color", "blue");
					checkPasswdResultM = true;
					break;
				case 3 : 
					$("#checkPasswdResultM").html("보통");
					$("#checkPasswdResultM").css("color", "green");
					checkPasswdResultM = true;
					break;
				case 2 : 
					$("#checkPasswdResultM").html("위험");
					$("#checkPasswdResultM").css("color", "oFrange");
					checkPasswdResultM = true;
					break;
				default :
					$("#checkPasswdResultM").html("사용 불가능한 패스워드");
					$("#checkPasswdResultM").css("color", "red");
					checkPasswdResultM = false;
			}
		}
	}
	
	function checkFormM() {
		if(!checkNameResultM) {
			alert("이름 양식에 맞춰주세요");
			$("#manager_name").select();
			return false; // 현재 폼의 submit 동작을 중단하기 위해 false 리턴
		} else if(!checkIdResultM) {
			alert("아이디 양식에 맞춰주세요");
			$("#manager_id").select();
			return false; // 현재 폼의 submit 동작을 중단하기 위해 false 리턴
		} else if(!checkPasswdResultM) {
			alert("패스워드 양식에 맞춰주세요");
			$("#manager_pass").select();
			return false; // 현재 폼의 submit 동작을 중단하기 위해 false 리턴
		} else if(!checkEmailAuthM) {
			$(".mail-check-boxM").select();
			alert("이메일 인증번호가 일치하지 않습니다");
			return false; // 현재 폼의 submit 동작을 중단하기 위해 false 리턴
		}
		
		return true;
		
	}
