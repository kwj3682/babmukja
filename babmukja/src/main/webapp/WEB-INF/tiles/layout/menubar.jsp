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
    <link rel="stylesheet" href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/css/menubar.css"/>">
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
    <title>Document</title>
</head>
<body>
    <div id="menubarContainer">
        <span id="home">BABMUKJA</span>
        <div id="menuContent">
            <ul>
                <li><a href="">About us</a></li>
                <li><a href="<c:url value="/recipe/main.do"/>">레시피</a></li>
                <li><a href="<c:url value="/store/detailpb.do"/>">스토어</a></li>
                <li><a href="">쿠킹 미팅</a></li>
            </ul>
        </div>
        <span id="search">
            <input type="text" placeholder="검색">
            <i class="fas fa-search fa-2x"></i>


        </span>
        <span id="sign">
            <i class="fas fa-user-circle fa-3x"></i>
            <a href="<c:url value="/member/login.do"/>">로그인</a>
            <a href="">회원가입</a>
        </span>
    </div>
    <script>
        $("a:eq(1)").click();
    </script> 

</body>
</html>