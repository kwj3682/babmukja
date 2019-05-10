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
	href="<c:url value="/resources/css/member/style.css"/>">
<link rel="stylesheet"
	href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link
	href="<c:url value="https://fonts.googleapis.com/css?family=Jua"/>"
	rel="stylesheet" />
<%-- <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script> --%>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
</head>
<body>
	<main>
	<div class="singUp__container">
		<div class="signUp__logo">
			밥먹자 ~ <i class="fas fa-utensils"></i>
		</div>

		<div class="signUp__title">회원가입</div>

		<div class="signUp__content">
			<p>간편하게 SNS를 이용하여 로그인 하세요!</p>


			<div class="signUp__social-login">
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
		</div>

		<form id="signupform" action="signup.do" method="post" onsubmit="return doSignUp();">
			<div class="signUp__content">
				<div class="signUp-name">
					이름
					<div class="name-input">
						<input type="text" name="memName" id="memName">
					</div>
				</div>

				<div class="signUp-email">
					<span>이메일</span>
					<div class="email-input">
						<input type="text" name="memEmail" id="memEmail">
					</div>
				</div>

				<div class="signUp-phone">
					전화번호
					<div class="phone-input">
						<input type="text" name="memPhone" id="memPhone">
					</div>
				</div>

				<div class="signUp-id">
					아이디
					<div class="id-input">
						<div class="id-content">영어, 숫자만 4자리 이상 입력해주세요.</div>
						<input type="text" name="memId" id="memId"><button type="button" class="id-check-button">중복체크</button>
						<div class="id-result">
							<span class="id-check">아이디</span>
						</div>
					</div>

				</div>

				<div class="signUp-nickName">
					별명
					<div class="nickname-input">
						<input type="text" name="memNickname" id="memNickname"> 
					</div>
				</div>

				<div class="signUp-passWord">
					비밀번호
					<div class="password-input">
						<div class="pass-content">영어, 숫자 특수문자 합쳐서 8자리 이상 입력해주세요.</div>
						<input type="password" name="memPass" id="memPass">
					</div>

				</div>

				<div class="signUp-checkePass">
					비밀번호 확인
					<div class="checkePass">
						<input type="password" name="checkePass" id="checkePass">
					</div>
				</div>

				<div class="signUp-post">
					우편번호
					<div class="post-input">
						<input type="text" name="postNo" readonly="readonly"><button type="button" onclick="goPopup();">우편번호 검색</button>
					</div>
				</div>

				<div class="default-addr">
					기본주소<input type="text" name="addrDefault" readonly="readonly">
				</div>

				<div class="detaile-addr">
					상세주소<input type="text" name="addrDetail">
				</div>

				<div class="pass-hint">
					<div class="hint-input">비밀번호 힌트</div>
					<select name="hint-contetnt">
						<c:forEach var="hint" items="${hintlist}">
							<option value="hint1" name="hintNo">${hint.hintContent}</option>
						</c:forEach>
					</select>
				</div>

				<div class="pass-answer">
					<input type="text" name="hintAnswer">
				</div>
			</div>

			<div class="signUp__button">
				<button>회원가입 하기</button>
			</div>
		</form>

		<div class="member__login">
			이미 밥먹자~ <i class="fas fa-utensils"></i> 회원이신가요? <a
				href="<c:url value="/member/loginform.do"/>">로그인</a>
		</div>
	</div>
	</main>

	<script>
		// 우편번호 api
		function goPopup() {
			var pop = window.open("/babmukja/member/jusopopup.do", "pop",
					"width=570,height=420, scrollbars=yes, resizable=yes");
		}

		function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
				roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn,
				bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm,
				rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
			$("#signupform input[name='postNo']").val(zipNo);
			$("#signupform input[name='addrDefault']").val(
					roadAddrPart1 + roadAddrPart2);
			$("#signupform input[name='addrDetail']").val(addrDetail);
		}

		// 아이디 중복체크 
		// 아이디 중복일 경우 = 0, 중복이 아닌 경우 = 1
		$(".id-check-button").click(function() {
			console.log("클릭 이벤트 실행됨");
			let memId = $("#memId").val();
			console.log(memId);
			$.ajax({
				type:'POST',
				data: "memId",
				url: 'checkid.do',
				dataType: "json",
				success: function(data) {
					alert(data.cnt);
					if(data.cnt == 0) {
						$(".id-result .id-check").text("사용이 불가능한 아이디 입니다.");
						$(".id-result .id-check").attr("style", "color:red;");
						$("#memId").focus();
					} else {
						$(".id-result .id-check").text("사용 가능한 아이디 입니다.");
						$(".id-result .id-check").attr("style", "color:blue;");
						$("#memId").focus();
						idck = 1;// 아이디가 중복하지 않을 경우  
					}
				}
			});
		});
		
		// 각 항목 조건에 맞는지 확인 
		function doSignUp() {
			var memName = $("#memName").val();
		    var memEmail = $("#memEmail").val();
		    var memPhone = $("#memPhone").val();
		    var memId = $("#memId").val();
		    var memNickname = $("#memNickname").val();
		    var memPass = $("#memPass").val();
		    var checkePass = $("#checkePass").val();
		    
		    if(memName.length == 0){
		        alert("아이디를 입력해 주세요."); 
		        $("#userid").focus();
		        return false;
		    }
		    if(memEmail.length == 0){
		        alert("이메일을 입력해 주세요."); 
		        $("#memEmail").focus();
		        return false;
		    }
		    if(memPhone.length == 0){
		        alert("전화번호를 입력해 주세요."); 
		        $("#memPhone").focus();
		        return false;
		    }
		    if(memId.length == 0){
		        alert("아이디를 입력해 주세요."); 
		        $("#memId").focus();
		        return false;
		    }
		    if(memNickname.length == 0){
		        alert("별명을 입력해 주세요."); 
		        $("#memNickname").focus();
		        return false;
		    }
		    if(memPass.length == 0){
		        alert("비밀번호를 입력해 주세요."); 
		        $("#memPass").focus();
		        return false;
		    }
		    if(memPass != checkePass){
		        alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
		        $("#checkePass").focus();
		        return false; 
		    }
		    
		   
		}
		
	</script>
</body>
</html>