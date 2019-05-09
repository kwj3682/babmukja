<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Babmukja</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/member/style.css"/>">
    <link rel="stylesheet" href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" >
    <link href="<c:url value="https://fonts.googleapis.com/css?family=Jua"/>" rel="stylesheet" />
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
  </head>
  <body>
    <main>
      <div class="singUp__container">
        <div class="signUp__logo">밥먹자 ~ <i class="fas fa-utensils"></i></div>

        <div class="signUp__title">
          회원가입
        </div>

        <div class="signUp__content">
          <p>간편하게 SNS를 이용하여 로그인 하세요!</p>
        

        <div class="signUp__social-login">
            <div class="facebook__icon">
                <a href="#"><img id="facebook" src="<c:url value="/resources/images/facebook.jpg"/>"></a>
            </div>
            
            <div class="kakao__icon">
                <a href="#"><img id="facebook" src="<c:url value="/resources/images/kakao.jpg"/>"></a>
            </div>
            
            <div class="naver__icon">
                <a href="#"><img id="facebook" src="<c:url value="/resources/images/naver.jpg"/>"></a>
            </div>
          </div>
        </div>

		<form id="signupform" action="signup.do" method="post">
        <div class="signUp__content">
            <div class="signUp-name">
              이름 <div class="name-input"><input type="text" name="memName" ></div>
            </div>

            <div class="signUp-email">
            <span>이메일</span> <div class="email-input"><input type="text" name="memEmail"> @ <input type="text" name="memEmail"></div>
            </div>

            <div class="signUp-phone">
              전화번호 <div class="phone-input"><input type="text" name="memPhone"></div>
            </div>

            <div class="signUp-id">
              아이디 <div class="id-input"><div class="id-content">영어, 숫자만 4자리 이상 입력해주세요.</div>
              <input type="text" name="memId"><button>중복체크</button></div>
              
            </div>

            <div class="signUp-nickName">
              별명 <div class="nickname-input"><input type="text" name="memNickname"></div> 
            </div>
            
            <div class="signUp-passWord">
              비밀번호 <div class="password-input"><div class="pass-content">영어, 숫자 특수문자 합쳐서 8자리 이상 입력해주세요.</div>
              <input type="password" name="memPass"></div> 
              
            </div>
            
            <div class="signUp-checkePass">
              비밀번호 확인<div class="checkePass"><input type="password" name="checkePass"></div>
            </div>

			
            <div class="signUp-post">
             우편번호 <div class="post-input"><input type="text" name="postNo"><button type="button" onclick="goPopup();">우편번호 검색</button></div>
            </div>

            <div class="default-addr">
               기본주소<input type="text" name="addrDefault">
            </div>

            <div class="detaile-addr">
                상세주소<input type="text" name="addrDetail">
            </div>

            <div class="pass-hint">
              <div class="hint-input">비밀번호 힌트</div> 
              <select name="hint-contetnt">
                <option value="hint1">나의 별명은?</option>
                <option value="hint2">내가 가장 좋아하는 색상은?</option>
                <option value="hint3">우리집 강아지 이름은?</option>
              </select>
            </div>

            <div class="pass-answer">
              <input type="text" name="hintAnswer">
            </div>
        </div>

        <div class="signUp__button">
          <button type="submit">회원가입 하기</button>
        </div>
        </form>

        <div class="member__login">
          이미 밥먹자~ <i class="fas fa-utensils"></i> 회원이신가요? <a href="<c:url value="/member/loginform.do"/>">로그인</a>
        </div>
      </div>
    </main>
    
   	<script>
  //팝업주소띄우기!
  //opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
  //document.domain = "abc.go.kr";
  function goPopup(){
  	// 주소검색을 수행할 팝업 페이지를 호출합니다.
  	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
  	var pop = window.open("/babmukja/member/jusopopup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
  	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
  	//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
  }


  function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
  	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
//  	document.insertForm.roadAddrPart1.value = roadAddrPart1 + roadAddrPart2;
//  	document.insertForm.addrDetail.value = addrDetail;
//  	$("#insertForm input[name='']").val(roadAddrPart1);

		$("#signupform input[name='postNo']").val(zipNo);
		$("#signupform input[name='addrDefault']").val(roadAddrPart1 + roadAddrPart2);
		$("#signupform input[name='addrDetail']").val(addrDetail);

		
//   		jusoform.find("#roadAddrPart1").val(roadAddrPart1 + roadAddrPart2);
//   		jusoform.find("#addrDetail").val(addrDetail);
  }
   	</script>
  </body>
</html>