<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>babmukja</title>
  <link rel="stylesheet" href="<c:url value="/resources/css/member/style.css"/>" />
  <link rel="stylesheet" href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" />
  <link href="<c:url value="https://fonts.googleapis.com/css?family=Jua"/>" rel="stylesheet" />
  <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
</head>
<body>
  <main>
    <div class="passform_container">
      <div class="passform_title">
        비밀번호 찾기 <i class="fas fa-utensils"></i>
      </div>

      <div class="passform_search">
        <i class="fas fa-check-circle" id="email-check"></i>이메일로 찾기
      </div>

      <div class="passform_input visiable" id="email-form">
        <div class="email_name">
          <input type="text" name="name" id="memName" placeholder="이름">
        </div>
        <div class="email_email">
          <input type="text" name="email" id="memEmail" placeholder="이메일"><button>이메일체크</button>
        </div>
        <div class="email_certification">
          <input type="text" name="certification" id="certification" placeholder="인증번호"><button>전송</button>
        </div>
      </div>

      <div class="passform_search">
        <i class="fas fa-check-circle"></i> 전화번호로 찾기
      </div>

      <div class="passform_input">
        <div class="phone_name">
          <input type="text" name="name" id="memName" placeholder="이름">
        </div>
        <div class="phone_email">
          <input type="text" name="email" id="memEmail" placeholder="전화번호"><button>전화번호체크</button>
        </div>
        <div class="phone_certification">
          <input type="text" name="certification" id="certification" placeholder="인증번호"><button>전송</button>
        </div>
      </div>

      <div class="pass_form_button">
        <button>비밀번호 찾기</button>
        <!-- form태그 추가하기 -->
      </div>

    </div>
  </main>
<!--   <script -->
<!--   src="https://code.jquery.com/jquery-3.4.1.min.js" -->
<!--   integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" -->
<!--   crossorigin="anonymous"></script> -->
  <script>
    $(".passform_search i").click(function(){
      $(this).parent().next().fadeToggle("fast");
    })
  </script>
</body>
</html>