<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
    <script src="/babmukja/WEB-INF/js/jquery-3.2.1.min.js"></script>
</head>
<body>
    <div id="container">
        <div>
            제목 : <input type="text" name="pb_write_title">
        </div>
        <div>
            내용 : <textarea name="pb_write_content" rows="10" cols="50" placeholder="내용을 입력해주세요." ></textarea>
        </div>
        <div>
            파일첨부 : <input type="file" name="attach" multiple="multiple">
        </div>
    </div>
</body>
</html>