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
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
	<main>
	<div class="login__container">
		<div class="login__logo">
			<p>
				<a href="<c:url value="/recipe/main.do" />">밥먹자 ~ <i class="fas fa-utensils"></i></a>
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
				<a href="<c:url value="/member/searchid.do"/>">아이디 찾기</a>
			</div>
			<div class="search__pass">
				<a href="<c:url value="/member/searchpass.do"/>">비밀번호 재설정</a>
			</div>
		</div>

		<div class="social__content">
			sns를 이용하여 로그인 하세요 ! <i class="fas fa-arrow-down"></i>
		</div>

		<div class="social__login-button">
			<div class="facebook__icon">
				<a href="#"><img id="facebook" src="<c:url value="/resources/images/facebook.jpg"/>"></a>
			</div>

			<div class="kakao__icon">
				<a href="javascript:loginKakao()"><img id="kakao" src="<c:url value="/resources/images/kakao.jpg"/>"></a>
				<a href="http://developers.kakao.com/logout"></a>
			</div>

			<div class="naver__icon">
				<a href="#"><img id="naver"  src="<c:url value="/resources/images/naver.jpg"/>"></a>
			</div>
		</div>

		<div class="social__simple-login">
			<div class="sign__up">
				밥먹자~ <i class="fas fa-utensils"></i> <a href="<c:url value="/member/signupform.do"/>">회원가입</a>
				<a href="<c:url value="/member/membermodify.do"/>">회원수정</a>
				<a href="<c:url value="/member/changepass.do"/>">비밀번호 변경</a>
			</div>
		</div>
	</div>
	
	<form id="socialsigupform" method="POST" action="socialsignupform.do">
    	<input type="hidden"  id="memEmail" name="memEmail"  value=""/>
    	<input type="hidden"  id="memName" name="memName" value=""/>
    	<input type="hidden"  id="socialAt" name="socialAt" value=""/>
    </form>
    
   <form id="sociallogin" method="POST" action="sociallogin.do">
    	<input type="hidden"  id="memEmail" name="memEmail"  value=""/>
    	<input type="hidden"  id="memNickname" name="memNickname" value=""/>
    	<input type="hidden"  id="accessToken" name="accessToken" value=""/>
    </form> 
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
			const fail =
	<%=request.getParameter("fail")%>
		console.log(fail);
			console.log(fail === 1);
			console.log(fail === null);
			$(".login__button").click(function() {
				if (fail === null) {
					alert("이메일과 패스워드가 일치하지 않습니다.");
					return;
				}
			});
			$("#doLogin").submit();
		});
		
		// 카카오톡 로그인
		Kakao.init('kakao app_key');
        function loginKakao() {
          // 로그인 창을 띄웁니다.
          Kakao.Auth.loginForm({
            success: function(authObj) {
            	 Kakao.API.request({
    		      	 url: '/v1/user/me',
     			     success: function(res) { 
    					 let meminfo = {id:res.id,nickName:res.properties['nickname'],
    					 accessToken:authObj.access_token,refreshToken:authObj.refresh_token}
    					 $.ajax({
    						type:"POST",
    						data: "memEmail="+res.id,
    						url:"checksocialemail.do",
    					 }).done(function(result){
    						if(result == 0){
    							 $("#socialsigupform #memEmail").val(res.id);
    		    			     $("#socialsigupform #memName").val(res.properties['nickname']);
    		    			     $("#socialsigupform #socialAt").val("1");
    							 $("#socialsigupform").submit();
    						}else{
    							$("#sociallogin #memEmail").val(res.id);
    	    					$("#sociallogin #memNickname").val(res.properties['nickname']);
    	    					$("#sociallogin #accessToken").val(authObj.access_token);
    							$("#sociallogin").submit();
    						}
    					}).fail(function(xhr){
    						alert("서버 처리중 에러발생")
    						console.dir(xhr);
    					})
              	 	}
             	})
            },
            fail: function(err) {
            	alert(JSON.stringify(err));
            }
          });
        };
		
	</script>

</body>
</html>
