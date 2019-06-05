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
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <title>Document</title>
</head>
<body>
        <div id="menubarContainer" class="opacity">
        <span id="home">BABMUKJA</span>
        <div id="menuContent">
            <ul>
                <li><a id="menu0" class="menu" href="#">About us</a></li>
                <li><a id="menu1" class="menu" href="<c:url value="/recipe/main.do"/>">레시피</a></li>
                <li><a id="menu2" class="menu" href="<c:url value="/store/mainpb.do"/>">스토어</a></li>
                <li><a id="menu3" class="menu" href="<c:url value="/meetup/main.do"/>">쿠킹 미팅</a></li>
            </ul>
        </div>
        <span id="sign">
            <i class="fas fa-user-circle fa-3x"></i>
            <c:if test="${sessionScope.user ne null}">
        <a id="nickName" href="#">${user.memNickname}</a>
        </c:if>
        <c:if test="${sessionScope.user ne null}">
         <a id="logout" href="<c:url value="/member/logout.do"/>">로그아웃</a>
        </c:if>
        <c:if test="${sessionScope.user eq null}">
         <a id="login" href="<c:url value="/member/loginform.do"/>">로그인</a>
         </c:if>
         <c:if test="${sessionScope.user eq null}">
        <a id="signup" href="<c:url value="/member/signupform.do"/>">회원가입</a>
        </c:if>
            <a href="#">마이홈</a>
        </span>
        <div id="optionalMenu1" class="optionalMenubar opacity">
            <ul>
                <li><a href="<c:url value="/recipe/cadetailall.do"/>">전체</a></li>
                <li><a href="<c:url value="/recipe/cadetail.do?country=1"/>">한식</a></li>
                <li><a href="<c:url value="/recipe/cadetail.do?country=2"/>">중식</a></li>
                <li><a href="<c:url value="/recipe/cadetail.do?country=3"/>">일식</a></li>
                <li><a href="<c:url value="/recipe/cadetail.do?country=4"/>">양식</a></li>
                <li><a href="<c:url value="/recipe/cadetail.do?country=5"/>">동남아</a></li>
                <li><a href="<c:url value="/recipe/cadetail.do?country=6"/>">기타국가</a></li>
            </ul>
        </div>
        <div id="optionalMenu2" class="optionalMenubar opacity">
            <ul>
                <li><a href="<c:url value="/admin/pbstoreindex.do"/>">스토어메뉴1</a></li>
                <li><a href="#">스토어메뉴2</a></li>
                <li><a href="#">스토어메뉴3</a></li>
                <li><a href="#">스토어메뉴4</a></li>
            </ul>
        </div>
        <div id="optionalMenu3" class="optionalMenubar opacity">
            <ul>
                <li><a href="#">쿠킹미팅1</a></li>
                <li><a href="#">쿠킹미팅2</a></li>
                <li><a href="#">쿠킹미팅3</a></li>
                <li><a href="#">쿠킹미팅4</a></li>
            </ul>
        </div>
    </div>
    <script>
        let menu = [$("#menu1"),$("#menu2"),$("#menu3")];
        let opMenu = [$("#optionalMenu1"),$("#optionalMenu2"),$("#optionalMenu3")];

        for(let i=0;i<=2;i++){
            menu[i].mouseenter(function(){
                opMenu[i].css({top:"60px"});
                for(let j=0; j<=2;j++){
                    if(j == i) continue;
                    opMenu[j].css({top:"-300px"});
                }
            });
        }
        $("#menubarContainer").mouseleave(function(){
            $(".optionalMenubar").css({top:"-300px"});
            }
        );
		$("#home").click(function(){
			location.href="<c:url value="/recipe/main.do"/>";
		});
		$("#logout").click(function() {
			alert("로그아웃 하시겠습니까 ?");
		});
		
	    let menubarCon = $("#menubarContainer");
	    let optCon = $(".optionalMenubar"); 
	    $(window).scroll(function() {

	      if($(this).scrollTop() < $(".swiper-container").height()){

	         menubarCon.addClass("opacity");
	         menubarCon.removeClass("non-opacity");        

	      }else{

	    	 menubarCon.removeClass("opacity");         
	         menubarCon.addClass("non-opacity");         
	      }
	      if($(this).scrollTop() < $(".swiper-container").height()-59){

	    	 optCon.addClass("opacity");
	    	 optCon.removeClass("non-opacity");        

	      }else{

	    	 optCon.removeClass("opacity");         
	    	 optCon.addClass("non-opacity");         
	      }
	         
	      
// 	      console.log($(this).scrollTop()+" , " + $(".swiper-container").height());
	    });
    </script> 
</body>
</html>