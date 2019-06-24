<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>


<head>
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"> </script> <!-- include libraries(jQuery,
		bootstrap) -->

<link href="<c:url value="/resources/css/meetup/meetup-detail.css"/>"
	rel="stylesheet" type="text/css">

<!-- lightbox -->
<link rel="stylesheet"
	href="<c:url value="/resources/js/dist/css/lightbox.css"/>">
<script src="<c:url value="/resources/js/dist/js/lightbox.js"/>"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

	<!-- include summernote css/js -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
		integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

	<title>Document</title>

</head>

<body>

	<div class="header">
		<div class="headerLeft">
			<div class=title>${meetup.title}</div>
			<div class="subInfo">
				<div class="infoTagContainer">
					<span class="infoTag">요일</span>
				</div>
				<div class="infoTagContainer">
					<span class="infoTag">지역</span>
				</div>
				<div class="infoTagContainer">
					<span class="infoTag">월회비</span>
				</div>
				<div class="infoTagContainer">
					<span class="infoTag">회원수</span>
				</div>
				<div class="subInfoPic">
					<i class="fas fa-user-shield fa-3x"></i>
				</div>
				<div class="subInfoPic">
					<i class="fas fa-map-marker-alt fa-3x"></i>
				</div>
				<div class="subInfoPic">
					<i class="fas fa-won-sign fa-3x"></i>
				</div>
				<div class="subInfoPic">
					<i class="fas fa-users fa-3x"></i>
				</div>
				    
				<c:set var = "string1" value = "${meetup.day}"/>
				<c:set var="wordLength"  value="${fn:length(string1)}"/>  
				 <c:choose>  
				 <c:when test = "${wordLength == 1}"> 
				<div class="tagBottom">${meetup.day}요일</div>
				</c:when>
				<c:otherwise>
				<div class="tagBottom">${meetup.day}</div>
				</c:otherwise>
				</c:choose>
				<div class="tagBottom">${meetup.location}</div>
				<div class="tagBottom">${meetup.fee}</div>
				<div class="tagBottom">1</div>

			</div>
			<div class="tag">
			<c:forEach var ="meetupTag" items="${meetupTags}">
				${meetupTag} &nbsp;

			</c:forEach>
			</div>
			
		</div>
		<div class="headerRight">
			<div class="area">
				<img src='<c:url value ="/resources/images/meetup_cooking1.jpg"/>' /><img src='<c:url value="/resources/images/meetup_cooking2.jpeg"/>' /> 
				<img src='<c:url value="/resources/images/meetup_cooking3.jpeg"/>' /> 
			</div>
		</div>
	</div>

	<div class="tabContainer">
		<table class="selectTab">
			<tr>
				<td>모임소개</td>
				<td id="noticeTap">모임공지</td>
				<td id="freeTap">자유게시판</td>
				<td>사진첩</td>
				<td>회원</td>
		</table>

		<div class="tabPanel" id="tabPanel1">
			<span class="writeIntro"> <i class="fas fa-plus-circle fa-3x"></i></span>

		</div>
		<div class="tabPanel" >
		<c:set var="status"  value="${memberStatus.status}"/>  
		<c:choose>
		<c:when test = "${status == 0}"> 
		<div class="requestPermissionContainer">
		<br>
		내용을 확인하시려면 모임을 먼저 가입해 주세요^^
		<span class="requestPermission">모임 가입 신청</span>
		</div>
		</c:when>
		<c:when test = "${status == 1}"> 
		<div class="requestPermissionContainer">
		<br>
			가입 승인요청을 기다리는 중입니다.		
		</div>
		</c:when>
		<c:when test = "${status == 3}"> 
		<div class="requestPermissionContainer">
		<br>
		 	당신은 방장에 의해 강퇴되어 더이상  활동하실 수 없습니다.
		<span class="requestPermission">재가입 신청</span>
		 			
		</div>
		</c:when>
		<c:when test = "${status == 4}"> 
		<div class="requestPermissionContainer">
		<br>
		 	승인이 거절되어 모임에서 활동하실 수 없습니다.
		<span class="requestPermission">재가입 신청</span>
		 			
		</div>
		</c:when>
		 <c:otherwise>
		<!-- noticeList 부분 -->
	<div class="board_list_container">
		<div class="board_list_wrapper">
			<div class="board_list_title">
				모임 공지게시판
			</div>

			<div class="list_insert_button">
				모임 공지를 작성하고 싶다면 <a href="<c:url value="/meetup/detailNoticeWriteform.do?meetNo=${meetup.meetNo}&memNo=${sessionScope.user.memNo}"/>">글등록 하러가기</a>
			</div>

			<div class="board_list_count_insert">
				<div class="board_list_count">
					전체 게시물<span class="board_count"> ${noticePageResult.count}</span>개
				</div>
			</div>


			<div class="board_list">
				<table id="board_list_heard">
					<thead>
						<tr class="board_list_tr_title">
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>

						<c:forEach var="board" items="${noticeList}">
							<tr>
								<td>${board.boardNo}</td>
								<td><a href="<c:url value='/meetup/detailNoticeDetail.do?boardNo=${board.boardNo}&memName=${sessionScope.user.memName}&meetNo=${meetup.meetNo}&memNo=${sessionScope.user.memNo}'/>">${board.title}</a></td>
								<td>${board.writer}</td>
								<td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" /></td>
								<td>${board.viewcnt}</td>
							</tr>
						</c:forEach>
					</thead>
				</table>
			</div>

			<div class="board_list_page">
				<c:if test="${noticePageResult.count != 0}">
					<jsp:include page="/WEB-INF/jsp/include/meetupDetailNoticePage.jsp">
						<jsp:param name="link" value="detail.do" />
					</jsp:include>
				</c:if>
			</div>
		</div>
	</div>
		
	    
	   
  		</c:otherwise>
		
		
		</c:choose>
		
	
	
			
		</div><!--tab panel 끝  -->
		<!--자유게시판시작 -->
		<div class="tabPanel">
		<c:set var="status"  value="${memberStatus.status}"/>  
		<c:choose>
		<c:when test = "${status == 0}"> 
		<div class="requestPermissionContainer">
		<br>
		내용을 확인하시려면 모임을 먼저 가입해 주세요^^
		<span class="requestPermission">모임 가입 신청</span>
		</div>
		</c:when>
		<c:when test = "${status == 1}"> 
		<div class="requestPermissionContainer">
		<br>
			가입 승인요청을 기다리는 중입니다.		
		</div>
		</c:when>
		<c:when test = "${status == 3}"> 
		<div class="requestPermissionContainer">
		<br>
		 	당신은 방장에 의해 강퇴되어 더이상  활동하실 수 없습니다.
		<span class="requestPermission">재가입 신청</span>
		 			
		</div>
		</c:when>
		<c:when test = "${status == 4}"> 
		<div class="requestPermissionContainer">
		<br>
		 	승인이 거절되어 모임에서 활동하실 수 없습니다.
		<span class="requestPermission">재가입 신청</span>
		 			
		</div>
		</c:when>
		 <c:otherwise>
		<!-- noticeList 부분 -->
	<div class="board_list_container">
		<div class="board_list_wrapper">
			<div class="board_list_title" id="free_board_list_title">
				모임 자유게시판
			</div>

			<div class="list_insert_button">
				글을 작성하고 싶으시면  <a href="<c:url value="/meetup/detailFreeWriteform.do?meetNo=${meetup.meetNo}&memNo=${sessionScope.user.memNo}"/>">글등록 하러가기</a>
			</div>

			<div class="board_list_count_insert">
				<div class="board_list_count">
					전체 게시물<span class="board_count"> ${freePageResult.count}</span>개
				</div>
			</div>


			<div class="board_list">
				<table id="board_list_heard">
					<thead>
						<tr class="board_list_tr_title">
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>

						<c:forEach var="board" items="${freeList}">
							<tr>
								<td>${board.boardNo}</td>
								<td><a href="<c:url value='/meetup/detailFreeDetail.do?boardNo=${board.boardNo}&meetNo=${meetup.meetNo}&memNo=${sessionScope.user.memNo}'/>">${board.title}</a></td>
								<td>${board.writer}</td>
								<td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" /></td>
								<td>${board.viewcnt}</td>
							</tr>
						</c:forEach>
					</thead>
				</table>
			</div>

			<div class="board_list_page">
				<c:if test="${freePageResult.count != 0}">
					<jsp:include page="/WEB-INF/jsp/include/meetupDetailFreePage.jsp">
						<jsp:param name="link" value="detail.do" />
					</jsp:include>
				</c:if>
			</div>
		</div>
	</div>
		
	    
	   
  		</c:otherwise>
		
		</c:choose>
		
	
	
			
		</div><!--tab panel 끝  -->
		
	
		<!--자유게시판끝  -->
		<div class="tabPanel">
		
		  <div class="album_container">
		  			<c:forEach var="filePath" items="${filesPath}">
   		  	<div>
   		  		<a href="<c:url value='/meetup/download.do' />?path=${filePath}" data-lightbox="gallery">
   		  			<img src="<c:url value='/meetup/download.do' />?path=${filePath}" width="287.5px" height="285px">
				</a>
				</div>
					</c:forEach>
               
                
            </div>	
		</div>
		<div class="tabPanel">
		  <c:forEach var ="meetupMember" items="${meetupMemberList}">
		
			<div class="detail_member_container">
                <div class="detail_member_info">
                    <div class="profile_picture_container">
                    <c:choose>
                    <c:when test="${meetupMember.memImgSysname == null}">
                        <img id="profile_picture" src="<c:url value="/resources/images/default/userdefault.png"/>">
                     </c:when>
                     
                     <c:otherwise>
                        <img src="${pageContext.request.contextPath}/meetup/download.do?path=${meetupMember.memImgSysname}">
                     </c:otherwise>
                     </c:choose>    
                    </div>
             			<div class="detail_member_name">${meetupMember.memName}</div>
                    	<div class="detail_member_regDate_container">
                        	<div>가입일</div>
                        
                        	<div><fmt:formatDate value="${meetupMember.joinDate}" pattern="yyyy년 MM월  dd일" /></div>
                    	</div>
                    <div class="detail_member_message_container" ><i class="far fa-envelope"></i>

                    </div>
                </div>
                
                
            </div>
		</c:forEach>
		</div><!--회원테이블  -->
	</div>

	<script>
	
	

	
 	// timestamp 날짜형식 바꾸는 함수
	function dateFormat(date){
	    function pad(num) {
	        num = num + '';
	        return num.length < 2 ? '0' + num : num;
	    }
	    return date.getFullYear() + '년' + pad(date.getMonth()+1) + '월' + pad(date.getDate() +'일');
	}
	
	$(".area").click(function () {
		$(".area").animate({ left: -60 }, 1000);
	});



	
	for (let i = 0; i <= 4; i++) {
		let number = i;

		$("td:eq(" + number + ")").click(function () {

			$(`td`).css("background-color", "white");
			$(`td`).css("color", "black");
			$(".tabPanel").css("display", "none");
			$("td:eq(" + number + ")").css("background-color", "#7db341");
			$("td:eq(" + number + ")").css("color", "white");
			$(".tabPanel:eq(" + number + ")").css("display", "block");

		});

	}//for


	for (let k = 0; k < 4; k++) {
		
		console.log("k 시작 :" + k);
		$(".subInfo > .subInfoPic > i:eq(" + k + ")").mouseover(function () {

			console.log("aaa : " + k);
			$(".infoTag:eq(" + k + ")").addClass("pseudo");
			console.log(k);

		});
		$(".subInfo > .subInfoPic > i:eq(" + k + ")").mouseleave(function () {

			$(".infoTag:eq(" + k + ")").removeClass("pseudo");



		});

	}//for
	//intro 를 넘겨 받아서...             
	var intro = `${meetup.intro}`;

	dataProcess();

	//java에서 array를 받을 수 있게 바꾸어 세팅주기         
	jQuery.ajaxSettings.traditional = true;
	var fileDirectory = [];// delete 부분에 해당 파일을 지우기 위해서
	var dbPath;//delete 부분에 depath 를 적용해 주기 위해서
	var tempFileDirectory = new Array();//후에 세이브 버튼을 누를때 array로 파일경로를 보내주기 위해서    


	//save 눌렀을 때 데이터 처리// 나중에 위로 올리기
	/*  contentType: "text/xml;charset=utf-8", */


	$(document).on("click", "#introSave", function () {


		var deleteDirectory = [];//후에 이경로에 있는 파일들은 지우기
		let data = {};
		data.fileDirectory = fileDirectory;
		data.deleteDirectory = deleteDirectory;
		let meetNo = ${meetup.meetNo};
		data.meetNo = meetNo;
		console.log("meetNo" + meetNo)
		dbPath = $('#summernote').val();
		data.dbPath = dbPath;
		for (let i = 0; i < tempFileDirectory.length; i++) {
			if ($('#summernote').val().includes(tempFileDirectory[i]) == false) {
				deleteDirectory.push(tempFileDirectory[i]);

				continue;
			}

			fileDirectory.push(tempFileDirectory[i]);

		}  //for





		/*    var text =$('#summernote').val();
		   var encoded = encodeURIComponent(text) */
		 

		   
		$.ajax({
			data: data,
			type: "POST",
			url: '/babmukja/meetup/updateIntro.do',
			enctype: 'multipart/form-data',
			success: function (data) {

				$("#tabPanel1").html(`<div class="editDelete"><div id="introEdit">수정</div><div id="introDelete">삭제</div></div>` + data);
			}
		});

	}); //save 끝

	//수정을 눌렀을 때
	$(document).on("click", "#introEdit", function () {
		data={};
		let meetNo = ${meetup.meetNo};
		data.meetNo = meetNo;
		$.ajax({
			url: '/babmukja/meetup/editIntro.do',
			data:data,
			enctype: 'multipart/form-data',
			success: function (data) {
				$("#tabPanel1").html(`
                                 	<div class="saveReturn"><div id="introReturn">돌아가기</div><div id="introSave">저장</div><div id="introHeader" >모임을 소개해 주세요~^^</div><div>
                                     <textarea id="summernote" name="editordata">`+ data + `</textarea>`);
			}
		});
		});


	$(document).on("mouseover", document, function () {
		$('#summernote').summernote({
			height: 500,                 // set editor height
			minHeight: null,             // set minimum height of editor
			maxHeight: null,             // set maximum height of editor
			focus: true,                  // set focus to editable area after initializing summernote
			callbacks: { // 콜백을 사용
				// 이미지를 업로드할 경우 이벤트를 발생
				onImageUpload: function (files, editor, welEditable) {
					console.log(files[0]);
					sendFile(files[0], editor, welEditable);

				}
			}//call back
		});


	});
	//수정 끝 

	//return 을 눌렀을때

	$(document).on("click", "#introReturn", function () {

		dataProcess();

	});

	//삭제를 눌렀을때
	$(document).on("click", "#introDelete", function () {
		data = {};
		data.fileDirectory = fileDirectory;
		$.ajax({
			url: '/babmukja/meetup/deleteIntro.do',
			data: data,
			type: "POST",
			enctype: 'multipart/form-data',
			success: function (data) {

				$("#tabPanel1").html(`<span class="writeIntro"> <i class="fas fa-plus-circle fa-3x"></i></span>`);
				dataProcess();
			}
		});

	});




	function dataProcess() {

		if (intro == "") { // intro가 null 이면 등록 폼 버튼 을 불러준다.


			console.log("intro가 null 입니다.");


			$(document).on("click", ".writeIntro", function () {
				$("#tabPanel1").html(`
            	<div class="saveReturn"><div id="introReturn">돌아가기</div><div id="introSave">저장</div><div id="introHeader" >모임을 소개해 주세요~^^</div><div>
                <textarea id="summernote" name="editordata"></textarea>
                 `);
			});


			$(document).on("mouseover", document, function () {
				$('#summernote').summernote({

					height: 500,                 // set editor height
					minHeight: null,             // set minimum height of editor
					maxHeight: null,             // set maximum height of editor
					focus: true,                  // set focus to editable area after initializing summernote
					callbacks: { // 콜백을 사용
						// 이미지를 업로드할 경우 이벤트를 발생
						onImageUpload: function (files, editor, welEditable) {
							console.log(files[0]);
							sendFile(files[0], editor, welEditable);

						}
					}//call back
				});


			});



		} else { //null 이 아니면 원래 자료를 뿌려준다.
			console.log("intro 는 :" + intro + "정래");
			console.log("intro가 null 이 아닙니다.");
			$("#tabPanel1").html(`<div class="editDelete"><div id="introEdit">수정</div><div id="introDelete">삭제</div></div>` + intro);




		}//else


	}//data process








	//파일 생성 폼
	function sendFile(file, editor, welEditable) {
		// 파일 전송을 위한 폼생성
		console.log("전달가나 확인");
		data = new FormData();
		data.append("meetNo", ${meetup.meetNo});
		data.append("file", file);
		console.log("file" + file);
		console.log(data);


		$.ajax({ // ajax를 통해 파일 업로드 처리
			data: data,
			type: 'POST',
			url: "<c:url value='/meetup/uploadImage.do' />",
			cache: false,
			contentType: false,
			processData: false,
			enctype: 'multipart/form-data',
			success: function (url) { // 처리가 성공할 경우
				//                                    alert("sendFile함수 들어옴")
				// 에디터에 이미지 출력

				let path = url.filePath;
				let sysFileName = url.sysFileName;

				tempFileDirectory.push(url.filePath + url.sysFileName);
				$("#summernote").summernote('editor.insertImage', "<c:url value='/meetup/download.do' />" + "?path=" + 
						path + sysFileName);

			}
		});
	}
	
	

	
	$(".requestPermission").click(function(){
		
		
		
		meetupMember={};
		meetupMember.memName = '${sessionScope.user.memName}';
		meetupMember.memEmail = '${sessionScope.user.memEmail}';
		meetupMember.memNo = ${sessionScope.user.memNo};
		meetupMember.meetNo = ${meetup.meetNo};
		meetupMember.status = 1;
		
		$.ajax({ // ajax를 통해 파일 업로드 처리
			data: meetupMember,
			type: 'POST',
			url: "<c:url value='/meetup/requestAdmission.do' />",
			cache: false,
			success: function (data) { // 처리가 성공할 경우
				$(".requestPermissionContainer").html(`
						<br>
						가입신청이 완료되었습니다. 방장이 승인하면 모임 가입이 완료됩니다.
						`);
			}
		});
		
		
	});

	
	//페이지 처리
	$(document).ready(function(){
		if(${noticeClicked}==1){
			
			$("#noticeTap").trigger("click");
			$(window).scrollTop($('.board_list_title').offset().top);

			 
		}
	});
	
	//페이지 처리
	$(document).ready(function(){
		if(${freeClicked}==1){
			
			$("#freeTap").trigger("click");
			$(window).scrollTop($('#free_board_list_title').offset().top);

			 
		}
	});

	</script>


   

</body>
 

</html>