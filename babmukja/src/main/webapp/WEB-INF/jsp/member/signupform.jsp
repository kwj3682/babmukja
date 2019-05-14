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
						<input type="text" placeholder="ex) babmukja@gmail.com" name="memEmail" id="memEmail"><button type="button" class="eamil-check-button">이메일 인증</button>
					</div>
				</div>

				<div class="signUp-phone">
					전화번호
					<div class="phone-input">
						<input type="text" placeholder="ex) 010-1111-1111" name="memPhone" id="memPhone">
					</div>
				</div>

				<div class="signUp-nickName">
					닉네임
					<div class="nickname-input">
						<input type="text" name="memNickname" id="memNickname"><button type="button" class="Nickname-check-button">중복체크</button> 
					</div>
					
					<div class="nickName-result">
						<span class="nickName-check"></span>
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
						<input type="text" name="postNo"  id="postNo" readonly="readonly"><button type="button" onclick="goPopup();">우편번호 검색</button>
					</div>
				</div>

				<div class="default-addr">
					기본주소<input type="text" name="addrDefault" readonly="readonly">
				</div>

				<div class="detaile-addr">
					상세주소<input type="text"  id="addrDetail" name="addrDetail">
				</div>
			</div>

			<div class="signUp__button">
				<button id="signUp-button">회원가입 하기</button>
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

		// 닉네임 중복체크 
		// 닉네임 중복일 경우 = 0, 중복이 아닌 경우 = 1
		var nick = 0;
		$(".Nickname-check-button").click(function() {
			console.log("클릭 이벤트 실행됨");
			let nickName = $("#memNickname").val();
			console.log(nickName);
			$.ajax({
				type:'POST',
				data: "memNickname="+nickName,
				url: 'checknickname.do',
				dataType: "json",
				success: function(data) {
					// alert(data.cnt);
					console.log(data);
					if(data != 0) {
						$(".nickName-result .nickName-check").text("사용이 불가능한 닉네임 입니다.");
						$(".nickName-result .nickName-check").attr("style", "color:red;");
						$("#memNickname").focus();
					} else {
						$(".nickName-result .nickName-check").text("사용 가능한 닉네임 입니다.");
						$(".nickName-result .nickName-check").attr("style", "color:blue;");
						$("#memNickname").focus();
						nick = 1;
					}
				}
			});
		});
		
		// 각 항목 조건에 맞는지 확인 
		function doSignUp() {
		    var memName = $("#memName").val();
		    var memEmail = $("#memEmail").val();
		    var memPhone = $("#memPhone").val();
		    var memNickname = $("#memNickname").val();
		    var memPass = $("#memPass").val();
		    var checkePass = $("#checkePass").val();
		    var postNo = $("#postNo").val();
		    var addrDetail = $("#addrDetail").val();
		    
		    if(memName.length == 0){
		        alert("이름을 입력해 주세요."); 
		        $("#memName").focus();
		        return false;
		    }
		    if(memEmail.length == 0){
		        alert("이메일을 입력해 주세요."); 
		        $("#memEmail").focus();
		        return false;
		    }
		    if(checkEmail() == false){
		        alert("이메일 형식에 맞게 입력해 주세요."); 
		        $("#memEmail").focus();
		        return false; 
		    }
		    if(memPhone.length == 0){
		        alert("전화번호를 입력해 주세요."); 
		        $("#memPhone").focus();
		        return false;
		    }
		    if(isCellPhone() == false){
		        alert("'-'을 사용해서 전화번호를 입력해주세요."); 
		        $("#memPhone").focus();
		        return false;
		    }
		    if(memNickname.length == 0){
		        alert("닉네임을 입력해 주세요."); 
		        $("#memNickname").focus();
		        return false;
		    }
		    if(memPass.length == 0){
		        alert("비밀번호를 입력해 주세요."); 
		        $("#memPass").focus();
		        return false;
		    }
		    if(checkPassword(memPass) == false){
		    	alert("숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.");
		        $("#memPass").focus();
		        return false; 
		    }
		    if(checkePass.length == 0){
		        alert("비밀번호를 확인해 주세요."); 
		        $("#checkePass").focus();
		        return false;
		    }
		    if(memPass != checkePass){
		        alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
		        $("#checkePass").focus();
		        return false; 
		    }
		    if(postNo.length == 0){
		        alert("우편번호를 입력해 주세요."); 
		        $("#postNo").focus();
		        return false; 
		    }
		    if(addrDetail.length == 0){
		        alert("상세주소를 입력해 주세요."); 
		        $("#addrDetail").focus();
		        return false; 
		    }
		    if(hintNo.length == 0){
		        alert("힌트를 선택해 주세요."); 
		        $("#hintNo").focus();
		        return false; 
		    }
		    if(hintAnswer.length == 0){
		        alert("힌트 답변을 입력해 주세요."); 
		        $("#hintAnswer").focus();
		        return false; 
		    }
		}
		
		// passWord 정규 표현식
		function checkPassword(password){
		    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)){            
		        $('#pass').val('').focus();
		        return false;
		    }    
		    var checkNumber = password.search(/[0-9]/g);
		    var checkEnglish = password.search(/[a-z]/ig);
		    if(checkNumber <0 || checkEnglish <0){
		        alert("숫자와 영문자를 혼용하여야 합니다.");
		        $('#pass').val('').focus();
		        return false;
		    }
		    if(/(\w)\1\1\1/.test(password)){
		        alert("같은 문자를 4번 이상 사용하실 수 없습니다.");
		        $('#pass').val('').focus();
		        return false;
		    }
		    return true;
		}
		
		//2가지 휴대전화 표현중에 하나만 택하기 
		function isCellPhone() {
			const phonenum = $("#memPhone").val();
			const regPhone = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
			if(!regPhone.test(phonenum)){
				$("#memPhone").focus();
				return false;    
			}
			return true;
		}
		
		// email 정규 표현식
		function checkEmail(){
			  const emailVal = $("#memEmail").val();
			  $("#memEmail").focus();
			  console.log(emailVal);
			  const regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			  // 검증에 사용할 정규식 변수 regExp에 저장
			  console.log(emailVal.match(regExp));
			  if (emailVal.match(regExp) == null) {
			    return false;
			  }
			  return true;
		};
	</script>
</body>
</html>