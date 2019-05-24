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

<!-- 		<div class="search_pass_search"> -->
<!-- 			<i class="fas fa-hamburger"></i> 이메일로 찾기 -->
<!-- 		</div> -->

		<form id="searchPass" method="post" action="resetpass.do">
			<div class="search_pass_input visiable" id="email-form">
				<div class="email_email">
					<input type="text" name="memEmail" id="memEmail" placeholder="이메일">
					<button id="email_btn" type="button">메일 전송</button>
				</div>

				<div class="email_check">
					<span class="email_result"></span>
				</div>
					
					<div class="email-result">
						<span class="email-check"></span>
					</div>

				<div class="email_certification">
					<input type="text" name="certification" id="certification" placeholder="인증번호">
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

<!-- 		<div class="search_pass_search"> -->
<!-- 			<i class="fas fa-check-circle"></i> 전화번호로 찾기 -->
<!-- 		</div> -->

<!-- 		<div class="search_pass_input"> -->
<!-- 			<div class="phone_name"> -->
<!-- 				<input type="text" name="name" id="memName" placeholder="이름"> -->
<!-- 			</div> -->
<!-- 			<div class="phone_email"> -->
<!-- 				<input type="text" name="email" id="memEmail" placeholder="전화번호 ex)010-1111-2222"> -->
<!-- 				<button>전화번호체크</button> -->
<!-- 			</div> -->
<!-- 			<div class="phone_certification"> -->
<!-- 				<input type="text" name="certification" id="certification" placeholder="인증번호"> -->
<!-- 				<button>전송</button> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
<!-- 		<div class="search_pass_button"> -->
<!-- 				<button>비밀번호 재설정</button> -->
<!-- 			</div> -->


	</div>
	</main>

	<script>
		// 		$(".passform_search i").click(function() {
		// 			$(this).parent().next().fadeToggle("fast");
		// 		})

		// 이메일 전송
		$("#email_btn").click(function() {
			let memEmail = $("#memEmail").val();
			alert(memEmail + "로 메일을 전송 하였습니다.");
			$.ajax({
				type : 'POST',
				data : "memEmail=" + memEmail,
				url : 'passmail.do'
			});
		});

		// alert
		$(".search_pass_button").click(function() {
			let memEmail = $("#memEmail").val();
			let certification = $("#certification").val();
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
								$(".certification_check .certification_result")
										.text("인증번호가 일치하지 않습니다.");
								$(".certification_check .certification_result")
										.attr("style", "color:red;");
								$("#certification").focus();
								$("#hcertification").val(1);
							} else {
								$(".certification_check .certification_result")
										.text("인증번호가 일치 합니다.");
								$(".certification_check .certification_result")
										.attr("style", "color:blue;");
								$("#certification").focus();
								$("#hcertification").val(2);
								number = 1;
							}
						}
					});
				});
	</script>
</body>
</html>