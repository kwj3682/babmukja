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
<script
	  src="https://code.jquery.com/jquery-3.3.1.min.js"
	  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	  crossorigin="anonymous"></script>  
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
			<div>번호 : <c:out value="${notice.no}" /></div><br>
			<div>글쓴이 : <c:out value="${notice.writer}" /></div><br> 
			<div>제목 : <c:out value="${notice.title}" /></div><br> 
			<div>내용 : <c:out value="${notice.content}" /></div><br><br><br><br><br> 
			<div>등록일 : <fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></div><br><br>  
	        <div> 조회수 : ${board.viewCnt}</div><br>
		    </td>
		</tr>
	</table>
		<div class="btnView2" style="text-align:center">		
	<td class="btnView"><button input type="button" style="font-size:1.2em;"><a href='updateForm.do?no=${notice.no}'>수정</a></button></td>
	<td class="btnView"><button input type="button" style="font-size:1.2em;"><a href='delete.do?no=${notice.no}'>삭제</a></button></td>
	<td class="btnView"><button input type="button" style="font-size:1.2em;"><a href='writeForm.do?no=${notice.no}'>등록</a></button></td>
	<td class="btnView"><button input type="button" style="font-size:1.2em;"><a href='list.do'>목록</a></button></td>
	</div>
		<br>
	<hr>
	<div id="commentlist" style="font-size:1.3em;">
	      <tr>
            <th class="notice_wr2">댓글1: </th>
            <td class="notice_comm2"><input type="text" name="title" style="width:1200px;
   margin: 5px;"/></td> <button>전송</button>
          </tr><br><hr>
          <tr>
            <th class="notice_wr2">댓글2: </th>
            <td class="notice_comm2"><input type="text" name="title" style="width:1200px;
   margin: 5px;"/></td> <button>전송</button>
          </tr><br>
	</div>
	<script>
	 	$.ajax({
	 		url: "<c:url value="/notice/comment-list.json" />",
	 		data: "no=${notice.no}"
	 	})
	 	.done(function (result) {
	 		console.log(result);
	 	});
	 </script>	 
</body>
</html>