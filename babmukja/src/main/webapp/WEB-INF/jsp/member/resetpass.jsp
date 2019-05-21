<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet" href="<c:url value="/resources/css/member/style.css"/>">
<link rel="stylesheet" href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link href="<c:url value="https://fonts.googleapis.com/css?family=Jua"/>" rel="stylesheet" />
</head>
<body>
	<main>
	<div class="reset_pass_container">
		<div class="reset_pass_title">
			비밀번호 재설정 <i class="fas fa-utensils"></i>
		</div>
		<div class="reset_pass_input">
			<div class="pass_reset">
				<input type="password" name="password" placeholder="새로운 비밀번호">
			</div>
			<div class="pass_reset">
				<input type="password" name="password" placeholder="비밀번호 확인">
			</div>
		</div>
		<div class="reset_pass_button">
			<button>확인</button>
		</div>

	</div>
	</main>
</body>
</html>