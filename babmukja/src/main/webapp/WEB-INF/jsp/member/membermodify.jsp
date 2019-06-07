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
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
</head>
<body>
	<!-- memberMenubar -->
	 <div id="member_menu_container" class="member_opacity">
        <div class="member_menu_content">
          <ul>
            <li>
              <a id="member_menu_0" class="member_menu" href="#">프로필</a>
            </li>
            <li>
              <a id="member_menu_1" class="member_menu" href="#">나의쇼핑</a>
            </li>
            <li>
              <a id="member_menu_2" class="member_menu" href="#">나의설정</a>
            </li>
          </ul>
        </div>

        <div id="optional_member_menu1" class="member_menu_optional">
          <ul>
            <li><a href="">스크랩북</a></li>
            <li><a href="">좋아요</a></li>
            <li><a href="">나의글</a></li>
            <li><a href="">친구목록</a></li>
          </ul>
        </div>

        <div id="optional_member_menu2" class="member_menu_optional">
          <ul>
            <li><a href="">배송조회</a></li>
            <li><a href="#">구매목록</a></li>
            <li><a href="#">장바구니</a></li>
          </ul>
        </div>

        <div id="optional_member_menu3" class="member_menu_optional">
          <ul>
            <li><a href="#">회원정보수정</a></li>
            <li><a href="#">비밀번호 변경</a></li>
            <li><a href="#">회원탈퇴</a></li>
          </ul>
        </div>
      </div>
      
    <!-- memberModify -->
	<main>
	<div class="member_modify_container">

		<div class="member_modify_title">회원정보수정</div>

		<div class="member_modify_content">
			<div class="modify_phone">
				전화번호
				<div class="modify_phone_input">
					<input type="text" placeholder="ex) 010-1111-1111" name="memPhone"
						id="memPhone" />
				</div>
			</div>

			<div class="modify_nickName">
				닉네임
				<div class="modify_nickname_input">
					<input type="text" name="memNickname" id="memNickname" />
				</div>
			</div>

			<div class="modify_profile_div">
				프로필 사진 <input type="file" name="modify_profile" id="modify_profile">
				<div class="modify_profile_plus">
					<img src="" id="modify_profile_img">
				</div>
			</div>

			<div class="modify_post">
				우편번호
				<div class="modify_post_input">
					<input type="text" name="postNo" id="postNo" readonly="readonly" /><button>우편번호 검색</button>
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

	<script>
		// + 눌렀을 때 파일 선택할 수 있게
				$(".modify_profile_plus").click(function() {
					$("#modify_profile").click()
				});

		// 이미지 썸네일
		let file = document.querySelector('#modify_profile');

		file.onchange = function() {
			let fileList = file.files;

			// 읽기
			let reader = new FileReader();
			reader.readAsDataURL(fileList[0]);

			//로드 한 후
			reader.onload = function() {
				//로컬 이미지를 보여주기
				document.querySelector('#modify_profile_img').src = reader.result;

				//썸네일 이미지 생성
				let tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
				tempImage.src = reader.result; //data-uri를 이미지 객체에 주입
				tempImage.onload = function() {
					//리사이즈를 위해 캔버스 객체 생성
					let canvas = document.createElement('canvas');
					let canvasContext = canvas.getContext("2d");

					//캔버스 크기 설정
					canvas.width = 150; //가로 
					canvas.height = 150; //세로

					//이미지를 캔버스에 그리기
					canvasContext.drawImage(this, 0, 0, 150, 150);
					//캔버스에 그린 이미지를 다시 data-uri 형태로 변환
					let dataURI = canvas.toDataURL("image/jpeg");

					//썸네일 이미지 보여주기
					document.querySelector('#modify_profile_img').src = dataURI;
				};
			};
		};
		
		  let menu = [$("#member_menu_0"),$("#member_menu_1"),$("#member_menu_2")];
	        let opMenu = [$("#optional_member_menu1"),$("#optional_member_menu2"),$("#optional_member_menu3")];

	        for(let i=0;i<=2;i++){
	            menu[i].mouseenter(function(){
	                opMenu[i].css({top:"60px"});
	                for(let j=0; j<=2;j++){
	                    if(j == i) continue;
	                    opMenu[j].css({top:"-300px"});
	                }
	            });
	        }
	        $("#member_menu_container").mouseleave(function(){
	            $(".member_menu_optional").css({top:"-300px"});
	            }
	        );
	</script>
</body>
</html>