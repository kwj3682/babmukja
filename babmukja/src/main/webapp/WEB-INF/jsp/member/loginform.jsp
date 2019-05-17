<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Babmukja</title>
<link rel="stylesheet" href="<c:url value="/resources/css/member/style.css"/>" />
<link rel="stylesheet" href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" />
<link href="<c:url value="https://fonts.googleapis.com/css?family=Jua"/>" rel="stylesheet" />
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
</head>
<body>
	<main>
	<div class="login__container">
		<div class="login__logo">
			<p>
				<a href="<c:url value="/admin/main.do" />">밥먹자 ~ <i class="fas fa-utensils"></i></a>
			</p>
		</div>

		<form id="doLogin" action="login.do" method="post">
			<div class="login__input">
				<input placeholder="이메일" type="text" name="memEmail" id="email" />
			</div>

			<div class="login__input">
				<input placeholder="비밀번호" type="password" name="memPass" id="pass" />
			</div>

			<div class="login__button">
				<button type="button">로그인</button>
			</div>
		</form>

		<div class="id__pass_search">
			<div class="search__id">
				<a href="#">이메일 찾기</a>
			</div>
			<div class="search__pass">
				<a href="#">비밀번호 찾기</a>
			</div>
		</div>

		<div class="social__content">
			sns를 이용하여 로그인 하세요 ! <i class="fas fa-arrow-down"></i>
		</div>

		<div class="social__login-button">
			<div class="facebook__icon">
				<a href="#"><img id="facebook"
					src="<c:url value="/resources/images/facebook.jpg"/>"></a>
			</div>

			<div class="kakao__icon">
				<a href="#"><img id="facebook"
					src="<c:url value="/resources/images/kakao.jpg"/>"></a>
			</div>

			<div class="naver__icon">
				<a href="#"><img id="facebook"
					src="<c:url value="/resources/images/naver.jpg"/>"></a>
			</div>
		</div>

		<div class="social__simple-login">
			<div class="sign__up">
				밥먹자~ <i class="fas fa-utensils"></i> <a
					href="<c:url value="/member/signupform.do"/>">회원가입</a>
			</div>
		</div>
	</div>
	</main>

	<script>
	
	 	// 아이디, 비밀번호 공백일 때
		$(".login__button").click(function() {
			let email = $("#email").val();
			let pass = $("#pass").val();

			if (email == "") {
				alert("이메일을 입력하세요.");
				return;
			}
			if (pass == "") {
				alert("비밀번호를 입력하세요.");
				return;
			}
		 	const fail = <%= request.getParameter("fail") %>
		 	console.log(fail);
		 	console.log(fail === 1);
			console.log(fail === null);
			$(".login__button").click(function() {
			 	if(fail === null) {
			 		alert("이메일과 패스워드가 일치하지 않습니다.");
			 		return;
			 	}
			});
			$("#doLogin").submit();
		});
	 	
	 	
	</script>

</body>
</html>
