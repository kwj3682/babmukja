<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Babmukja<title>
    <link rel="stylesheet" href="<c:url value="/resources/css/member/style.css"/>">
    <link rel="stylesheet" href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" />
    <link href="<c:url value="https://fonts.googleapis.com/css?family=Jua"/>" rel="stylesheet">
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
                <a href="#"><img id="facebook" src="../img/facebook.jpg"></a>
            </div>
            
            <div class="kakao__icon">
                <a href="#"><img id="facebook" src="../img/kakao.jpg"></a>
            </div>
            
            <div class="naver__icon">
                <a href="#"><img id="facebook" src="../img/naver.jpg"></a>
            </div>
          </div>
        </div>


        <div class="signUp__content">
            <div class="signUp-name">
              이름 <div class="name-input"><input type="text" name="name" ></div>
            </div>

            <div class="signUp-email">
            <span>이메일</span> <div class="email-input"><input type="text" name="email1"> @ <input type="text" name="eamil2"></div>
            </div>

            <div class="signUp-phone">
              전화번호 <div class="phone-input"><input type="text" name="phone"></div>
            </div>

            <div class="signUp-id">
              아이디 <div class="id-input"><div class="id-content">영어, 숫자만 4자리 이상 입력해주세요.</div>
              <input type="text" name="id"><button>중복체크</button></div>
              
            </div>

            <div class="signUp-nickName">
              별명 <div class="nickname-input"><input type="text" name="nickName"></div> 
            </div>
            
            <div class="signUp-passWord">
              비밀번호 <div class="password-input"><div class="pass-content">영어, 숫자 특수문자 합쳐서 8자리 이상 입력해주세요.</div>
              <input type="text" name="pass"></div> 
              
            </div>
            
            <div class="signUp-checkePass">
              비밀번호 확인<div class="checkePass"><input type="text" name="checkePass"></div>
            </div>

            <div class="signUp-post">
             우편번호 <div class="post-input"><input type="text" name="signUp-post"><button>우편번호 검색</button></div>
            </div>

            <div class="default-addr">
               <input type="text" name="default-addr">
            </div>

            <div class="detaile-addr">
                <input type="text" name="detaile-addr">
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
              <input type="text" name="pass-answer">
            </div>
        </div>

        <div class="signUp__button">
          <a href="#">회원가입 하기</a>
        </div>

        <div class="member__login">
          이미 밥먹자~ <i class="fas fa-utensils"></i> 회원이신가요? <a href="login.html">로그인</a>
        </div>
      </div>
    </main>
  </body>
</html>
