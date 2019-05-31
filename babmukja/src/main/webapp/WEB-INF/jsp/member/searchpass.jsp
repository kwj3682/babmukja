<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>babmukja</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/member/style.css"/>" />
<link rel="stylesheet"
	href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous" />
<link
	href="<c:url value="https://fonts.googleapis.com/css?family=Jua"/>"
	rel="stylesheet" />
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
</head>
<body>
	<main>
	<div class="search_pass_container">
		<div class="search_pass_title">
			비밀번호 재설정 인증 <i class="fas fa-utensils"></i>
		</div>

		<div class="search_pass_search">
			<i class="fas fa-hamburger"></i> 이메일로 찾기
		</div>

		<form id="searchPass" method="post" action="resetpass.do">
			<div class="search_pass_input visiable" id="email-form">
				<div class="email_email">
					<input type="text" name="memEmail" id="memEmail" placeholder="이메일" />
					<button id="email_btn" type="button">메일 전송</button>
				</div>

				<div class="email_check">
					<span class="email_result"></span>
				</div>

				<div class="email_certification">
					<input type="text" name="certification" id="certification" placeholder="인증번호" />
					<button id="certification_btn" type="button">인증번호 확인</button>
					<input type="hidden" id="hcertification" value="0" />
				</div>

				<div class="certification_check">
					<span class="certification_result"></span>
				</div>
			</div>

			<div class="search_pass_button">
				<button>비밀번호 재설정</button>
			</div>
		</form>

		<form id="searchPass2" method="post" action="resetpass.do">
		<div class="search_pass_search">
			<i class="fas fa-pizza-slice"></i> 전화번호로 찾기
		</div>

			<div class="search_pass_input">
				<div class="phone_name">
					<input type="text" name="name" id="memName" placeholder="이름" />
				</div>
				
				<div class="phone_email">
					<input type="text" name="phone" id="memPhone" placeholder="전화번호" />
					<input type="hidden" id="hPhone" value="0" />
					<button type="button" id="sms_btn">전송</button>
					
					<div class="phone_check">
					<span class="phone_result"></span>
					</div>
				</div>
				
				<div class="phone_certification">
					<input type="text" name="certification" id="certification" placeholder="인증번호" />
					<button id="certification_btn" type="button">인증번호 확인</button>
					<input type="hidden" id="hcertification" value="0" />
				</div>
				
				<div class="certification_check2">
					<span class="certification_result2"></span>
				</div>
				
				<div class="search_pass_button_one">
					<button>비밀번호 재설정</button>
				</div>
			</div>
		</form>
	</div>
	</main>

	<script>
		$(".search_pass_search i").click(function() {
			$(this).parent().next().fadeToggle("fast");
		})

		// 이메일 찾기 alert
		$(".search_pass_button").click(function() {
			let memEmail = $("#memEmail").val();
			let certification = $("#certification").val();
			let memPhone = $("#memPhone").val();
			if (memEmail.length == 0) {
				alert("이메일을 입력해 주세요.");
				$("#memEmail").focus();
				return false;
			}
			if (checkEmail() == false) {
				alert("이메일 형식에 맞게 입력해 주세요.");
				$("#memEmail").focus();
				return false;
			}
			if (certification.length == 0) {
				alert("인증번호를 입력해 주세요.");
				$("#certification").focus();
				return false;
			}
		});
		
		// 전화번호 정규 표현식	
		function isCellPhone() {
			const phonenum = $("#memPhone").val();
			const regPhone = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
			if(!regPhone.test(phonenum)){
				$("#memPhone").focus();
				return false;    
			}
			return true;
		};
			
		// 이메일 정규표현식
		function checkEmail() {
			const emailVal = $("#memEmail").val();
			$("#memEmail").focus();
			console.log(emailVal);
			const regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			// 검증에 사용할 정규식 변수 regExp에 저장
			console.log(emailVal.match(regExp));
			if (emailVal.match(regExp) == null) {
				return false;
			}
			return true;
		};
		
		// 이메일 전송 alert창
		$("#email_btn").click(function() {
			let memEmail = $("#memEmail").val();
			alert(memEmail + "로 메일을 전송 하였습니다.");
			$.ajax({
				type : 'POST',
				data : "memEmail=" + memEmail,
				url : 'passmail.do'
			});
		});

		// 이메일 확인
		let em = 0;
		$("#memEmail").keyup(
				function() {
					console.log(" keyup 이벤트 실행됨");
					let email = $("#memEmail").val();
					console.log(email);
					$.ajax({
						type : 'POST',
						data : "memEmail=" + email,
						url : 'checkemail.do',
						dataType : "json",
						success : function(data) {
							// alert(data.cnt);
							console.log(data);
							if (data != 0 || (email === null)) {
								$(".email_check .email_result").text("존재하는 이메일 입니다.");
								$(".email_check .email_result").attr("style","color:blue;");
								$("#memEmail").focus();
								$("#hEmail").val(2);
							} else {
								$(".email_check .email_result").text("존재하지 않는 이메일 입니다.");
								$(".email_check .email_result").attr("style","color:red;");
								$("#memEmail").focus();
								$("#hEmail").val(1);
								em = 1;
							}
						}
					});
				});

		// 인증번호 확인
		let number = 0;
		$("#certification_btn").click(
				function() {
					console.log("클릭 이벤트 실행됨");
					let ctf = $("#certification").val();
					console.log(ctf);
					$.ajax({
						type : 'POST',
						data : "certification=" + ctf,
						url : 'checknum.do',
						dataType : "json",
						success : function(data) {
							// alert(data.cnt);
							console.log(data);
							if (data != 0 || (ctf === false)) {
								$(".certification_check .certification_result").text("인증번호가 일치하지 않습니다.");
								$(".certification_check .certification_result").attr("style", "color:red;");
								$("#certification").focus();
								$("#hcertification").val(1);
							} else {
								$(".certification_check .certification_result").text("인증번호가 일치 합니다.");
								$(".certification_check .certification_result").attr("style", "color:blue;");
								$("#certification").focus();
								$("#hcertification").val(2);
								number = 1;
							}
						}
					});
				});

		// 전화번호 찾기 alert창
		$(".search_pass_button_one").click(function() {
			let memName = $("#memName").val();
			let memPhone = $("#memPhone").val();
			let certification = $("#certification").val();
			if (memName.length == 0) {
				alert("이름을 입력해 주세요.");
				$("#memName").focus();
				return false;
			}
			 if(memPhone.length == 0){
		        alert("전화번호를 입력해 주세요."); 
		        $("#memPhone").focus();
		        return false;
		   }
		    if(isCellPhone() == false){
		        alert("전화번호 형식에 맞게 입력해 주세요."); 
		        $("#memPhone").focus();
		        return false;
		   }
		    if (certification.length == 0) {
				alert("인증번호를 입력해 주세요.");
				$("#certification").focus();
				return false;
		  }
		});
		
		// 인증번호 sms 전송 alert창
		$("#sms_btn").click(function() {
			let memPhone = $("#memPhone").val();
			alert(memPhone + "로 문자를 전송 하였습니다.");
			$.ajax({
				type : 'POST',
				data : "memPhone=" + memPhone,
				url : 'smssend.do'
			});
		});
		
		// 전화번호 중복체크
		let ph = 0;
		$("#memPhone").keyup(
				function() {
					console.log(" keyup 이벤트 실행됨");
					let phone = $("#memPhone").val();
					console.log(phone);
					$.ajax({
						type : 'POST',
						data : "memPhone=" + phone,
						url : 'checkphone.do',
						dataType : "json",
						success : function(data) {
							// alert(data.cnt);
							console.log(data);
							if (data != 0 || (phone === null)) {
								$(".phone_check .phone_result").text("존재하는 전화번호 입니다.");
								$(".phone_check .phone_result").attr("style","color:blue;");
								$("#memPhone").focus();
								$("#hPhone").val(2);
							} else {
								$(".phone_check .phone_result").text("존재하지 않는 전화번호 입니다.");
								$(".phone_check .phone_result").attr("style","color:red;");
								$("#memPhone").focus();
								$("#hPhone").val(1);
								ph = 1;
							}
						}
					});
				});
		
		// 인증번호 중복체크
		let number2 = 0;
		$("#certification_btn2").click(
				function() {
					console.log("클릭 이벤트 실행됨");
					let ctf = $("#certification").val();
					console.log(ctf);
					$.ajax({
						type : 'POST',
						data : "certification=" + ctf,
						url : 'checknum.do',
						dataType : "json",
						success : function(data) {
							// alert(data.cnt);
							console.log(data);
							if (data != 0 || (ctf === false)) {
								$(".certification_check2 .certification_result2").text("인증번호가 일치하지 않습니다.");
								$(".certification_check2 .certification_result2").attr("style", "color:red;");
								$("#certification").focus();
								$("#hcertification").val(1);
							} else {
								$(".certification_check2 .certification_result2").text("인증번호가 일치 합니다.");
								$(".certification_check2 .certification_result2").attr("style", "color:blue;");
								$("#certification").focus();
								$("#hcertification").val(2);
								number2 = 1;
							}
						}
					});
				});
	</script>
</body>
</html>