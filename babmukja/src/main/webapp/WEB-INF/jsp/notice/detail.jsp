<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/notice/notice detail.css"/>">
<script src="/babmukja/WEB-INF/js/jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function() {

		//공지사항 신규 등록
		$("enroll").on("click", function() {
			var formData = $("enrollform").serialize();
			$.ajax({
				type : "post",
				url : "/notice/noticeInsert",
				data : formData,
				success : function(data) {
					if (data == 1)
						alert("등록 완료");
					else
						alert('등록 실패');

				},
				error : function(error) {
					alert("등록 실패");
					console.log("notice insert fail : " + error);
				}
			});
		});

		//공지사항 수정
		$("update").on("click", function() {
			var formData = $("updateform").serialize();
			$.ajax({
				type : "post",
				url : "/notice/noticeUpdate",
				data : formData,
				success : function(data) {
					if (data == 1)
						alert("수정 완료");
					else
						alert('수정 실패');
				},
				error : function(error) {
					alert("수정 실패");
					console.log("notice update fail : " + error);
				}
			});
		});

		//공지사항 삭제
		$("delete").on("click", function() {
			var formData = $("list").serialize();
			alert(formData);
			$.ajax({
				type : "post",
				url : "/notice/noticeDelete",
				data : formData,
				success : function(data) {
					if (data == 1) {
						alert("삭제 완료");
						location.href = "/push/noticeList";
					} else
						alert('삭제 실패');
				},
				error : function(error) {
					alert("삭제 실패");
					console.log("notice delete fail : " + error);
				}
			});
		});

		$("backPage").on("click", function() {
			location.href = "/notice/noticeList";
		});
	})
</script>
</head>
<body>
	<div class="babcontainer">
		<div class="babnotices">공지사항 상세조회</div>
	</div>
	<hr>
	<br>
	<br>
	<table class="babtable">
		<tr class="bab_tr">
			<td class="babtd5" style="float:left">
			<div>번호 :<c:out value="${notice.notice_no}"/></div><br> 	
			<div>글쓴이 :<c:out value="${notice.writer}" /></div><br> 
			<div>제목 :<c:out value="${notice.title}" /></div><br> 
			<div>내용 :<c:out value="${notice.content}" /></div><br><br><br><br><br> 
			<div>등록일 :<fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></div><br>
		    </td>
		</tr>
	</table>
		<div class="btnView2" style="text-align:center">		
	<td class="btnView"><button input type="button" style="font-size:1.2em;"><a href='updateForm.do?no=${notice.notice_no}'>수정</a></button></td>
	<td class="btnView"><button input type="button" style="font-size:1.2em;"><a href='delete.do?no=${notice.notice_no}'>삭제</a></button></td>
	<td class="btnView"><button input type="button" style="font-size:1.2em;"><a href='enrollform.do?no=${notice.notice_no}'>등록</a></button></td>
	<td class="btnView"><button input type="button" style="font-size:1.2em;"><a href='list.do'>목록</a></button></td>
	</div>
		<br>
	<hr>
	<div id="commentres" style="font-size:1.3em;">
	      <tr>
            <th class="notice_wr2">댓글1: </th>
            <td class="notice_comm2"><input type="text" name="title" style="width:98%;
   margin: 5px;"/></td>
          </tr><br><hr>
          <tr>
            <th class="notice_wr2">댓글2: </th>
            <td class="notice_comm2"><input type="text" name="title" style="width:98%;
   margin: 5px;"/></td>
          </tr>
	</div>
</body>
</html>