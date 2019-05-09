<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
</head>

<body>

 	<div id="container">
	 	<form method="post" enctype="multipart/form-data" action="<c:url value="/store/insertpb.do"/>">
		        <div>
		            제목 : <input type="text" name="name">
		        </div>
		        <div>
		            내용 : <textarea name="content" rows="10" cols="50" placeholder="내용을 입력해주세요." ></textarea>
		        </div>
		        <div>
		            가격 : <input type="text" name="price" />   
		        </div>
		        <div>
		            파일첨부 : <input type="file" name="imageList" multiple="multiple">
		        </div>
		        <button>등록</button>
	 	</form>
    </div>
</body>
</html>