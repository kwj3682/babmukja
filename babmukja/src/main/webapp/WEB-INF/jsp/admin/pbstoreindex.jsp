<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="<c:url value="/resources/css/admin/pbstoreindex.css"/>">
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<title>PB Store Index</title>
</head>
<body>
    <div class="admin_pb_container">
        <div class="admin_pb_detaildo">
            <button class="admin_pb_detaildo_btn">상품 조회</button>
        </div>
        <div class="admin_pb_insertdo">
            <button class="admin_pb_insertdo_btn">상품 등록</button>
        </div>
    </div>
    
    <script>
    	$(".admin_pb_detaildo_btn").click(function () {
    		location.href="<c:url value=''/>";
    	});
    	
    	$(".admin_pb_insertdo_btn").click(function () {
    		location.href="<c:url value='/store/insertformpb.do'/>";
    	});
    </script>
</body>
</html>