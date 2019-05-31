<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/member/style.css"/>" />
<link rel="stylesheet"
	href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous" />
</head>
<body>
	  <main>
      <div class="member_modify_container">

        <div class="member_modify_title">회원정보수정</div>

        <div class="member_modify_content">
          <div class="modify_phone">
            전화번호
            <div class="modify_phone_input">
              <input type="text" placeholder="ex) 010-1111-1111" name="memPhone" id="memPhone"/>
            </div>
          </div>

          <div class="modify_nickName">
            닉네임
            <div class="modify_nickname_input">
              <input type="text" name="memNickname" id="memNickname" />
            </div>
          </div>

          <div class="modify_profile">
              프로필 사진
              <div class="modify_profile_input">
              <input type="file" name="modify_profile" id="modify_profile">
              </div>
              <div id="modify_profile_div">
                <div class="modify_profile_plus">+</div>
              </div>
            </div>

          <div class="modify_post">
            우편번호
            <div class="modify_post_input">
              <input type="text" name="postNo" id="postNo" readonly="readonly"/><button>우편번호 검색</button>
            </div>
          </div>

          <div class="modify_default_addr">
            기본주소<input type="text" name="addrDefault" readonly="readonly" />
          </div>

          <div class="modify_detaile_addr">
            상세주소<input type="text" id="addrDetail" name="addrDetail" />
          </div>
        </div>

        <div class="member_modify_button">
          <button id="modify-button">회원정보 수정하기</button>
        </div>

      </div>
    </main>
</body>
</html>