<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이메일 인증이 완료 되었습니다~♬ 밥먹자 회원이 되신 걸 축하드립니다!♬ </h2>
	<a href="<c:url value="/admin/main.do"/>">메인으로 이동</a>
	<a href="<c:url value="/member/loginform.do"/>">로그인하기</a>
</body>
</html>