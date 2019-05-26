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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
</head>
<body style="background: white;">
	<div class="babcontainer">
		<div class="babnotices">공지사항 상세조회</div>
	</div>
	<hr>
	<br>
	<br>
<!-- 	<div class="col-xs-12"> -->
<!--         <form action="/insertProc" method="post"> -->
<!--             <dl class="dl-horizontal"> -->
<!--               <dt>번호</dt> -->
<%--               <dd>${notice.noticeNo}</dd> --%>
              
<!--               <dt>작성자</dt> -->
<%--               <dd>${notice.writer}</dd> --%>
              
<!--               <dt>작성날짜</dt> -->
<!--               <dd> -->
<%--                   <fmt:formatDate value="${notice.regDate}" pattern="yyyy.MM.dd HH:mm:ss"/> --%>
<!--               </dd> -->
              
<!--               <dt>첨부파일</dt> -->
<%--               <dd><a href="/fileDown/${files.noticeNo}">${files.fileOriName}</a></dd> --%>
              
<!--               <dt>내용</dt> -->
<%--               <dd>${notice.content}</dd> --%>
<!--             </dl> -->
<!--         </form> -->
<!--         <div class="btn-group btn-group-sm" role="group" style="float:right;"> -->
<%--           <button type="button" class="btn btn-default" onclick="location.href='delete.do?noticeNo=${notice.noticeNo}'">삭제</button> --%>
<%--           <button type="button" class="btn btn-default" onclick="location.href='updateForm.do?noticeNo=${notice.noticeNo}'">수정</button> --%>
<!--           <button type="button" class="btn btn-default" onclick="location.href='list.do'"> 목록 </button> -->
<!--         </div> -->
<!--   </div> -->

	<form action="/insertProc" method="post">
	<table class="babtable">
		<tr class="bab_tr">
			<td class="babtd5" style="float: left">
				<div>
					번호 : <c:out value="${notice.noticeNo}" />
				</div>
				<br>
				<div>
					글쓴이 : <c:out value="${notice.writer}" />
				</div>
				<br>
				<div>
					제목 : <c:out value="${notice.title}" />
				</div>
				<br>
				<div>
					내용 : <c:out value="${notice.content}" />
				</div>
				<br>
			<br>
			<br>
			<br>
			<br>
				<div>
					등록일 : <fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /> 
				</div>
				<br>
			<br>
				<div>조회수 : ${notice.viewCnt}</div>
				<br>
			</td>
		</tr>
	<div class="btnView2" style="float:center;">
        <td class="btnView">
        <button input type="button" style="font-size: 1.2em;"><a href='updateForm.do?noticeNo=${notice.noticeNo}'>수정</a></button>
		<button input type="button" style="font-size: 1.2em;"><a href='delete.do?noticeNo=${notice.noticeNo}'>삭제</a></button>
		<button input type="button" style="font-size: 1.2em;"><a href='list.do'>목록</a></button>
		</td> 
	</div>
	</table><br><br>
	</form><hr>
	
<!-- 			</button></td> -->
<!-- 			<td class="btnView"><button input type="button" 
<!-- 				style="font-size: 1.2em;"> 
<%-- 				<a href='comment.do?noticeNo=${notice.commentNo}'> 댓글등록</a> 
<!-- <!-- 			</button></td> -->

	<br>
	<hr>
<!-- 	  <div id="commentInsertForm"> -->
<!-- 			<form method="post" action="commentInsert.do"> -->
<%-- 				<input type="hidden" name="no" value="${notice.noticeNo}" />	 --%>
<!-- 				<table width="70%"> -->
<!-- 				<tr> -->
<!-- 					<td><input type="text" name="writer" /></td> -->
<!-- 					<td><textarea name="content" rows="2" cols="60"></textarea></td> -->
<!-- 					<td><input type="submit" value="등록" /></td> -->
<!-- 				</tr>	 -->
<!-- 				</table> -->
<!-- 			</form> -->
<!-- 		</div> -->
<!-- <div id="commentInsertForm"> -->
<!-- 			<form method="post" action="insertComment.do"> -->
<%-- 				<input type="hidden" name="no" value="${board.no}" />	 --%>
<!-- 				<table width="70%"> -->
<!-- 				<tr> -->
<!-- 					<td><input type="text" name="writer" /></td> -->
<!-- 					<td><textarea name="content" rows="2" cols="60"></textarea></td> -->
<!-- 					<td><input type="submit" value="등록" /></td> -->
<!-- 				</tr>	 -->
<!-- 				</table> -->
<!-- 			</form> -->
<!-- 		</div> -->

		
		
<!-- 	<div class="container"> -->
<!-- 		<label for="content">comment</label> -->
<!-- 		<form name="commentInsertForm"> -->
<!-- 			<div class="input-group"> -->
<%-- 				<input type="hidden" name="noticeNo" value="${detail.noticeNo}" />  --%>
<!-- 				<input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">  -->
<!-- 				<span class="input-group-btn"> -->
<!-- 					<button class="btn btn-default" type="button" name="commentInsertBtn">등록</button> -->
<!-- 				</span> -->
<!-- 			</div> -->
<!-- 		</form> -->
<!-- 	</div> -->
	
	
	
<!-- 	<div id="commentList"> -->
<!-- 		<form action="comment-update.do" method="post"> -->
<%-- 			<input type="hidden" name="no" value="${notice.noticeNo}" /> --%>
<%-- 			<input type="hidden" name="commentNo" value="${param.commentNo}" /> --%>
			
<!-- 		  <table width='80%' border='1'> -->
<%-- 			<c:forEach var="comment" items="${commentList}"> --%>
<%-- 			<c:choose> --%>
<%-- 		  		<c:when test="${param.commentNo eq comment.commentNo}">	 --%>
<!-- 					<tr> -->
<!-- 					  <td> -->
<%-- 					  	<textarea name="content" rows="2" cols="60"><c:out value="${comment.content}" /></textarea> --%>
<!-- 					  </td> -->
<!-- 					  <td colspan="2"> -->
<!-- 					  	  <input type="submit" value="수정" /> -->
<%-- 					  	  <a href="detail.do?noticeNo=${comment.no}">취소</a> --%>
<!-- 					  </td> -->
<!-- 					 </tr> -->
<%-- 			 	</c:when> --%>
<%-- 			 	<c:otherwise> --%>
<!-- 					<tr> -->
<%-- 					  <td><c:out value="${comment.content}" /></td> --%>
<%-- 					  <td><fmt:formatDate value="${comment.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td> --%>
<!-- 					  <td> -->
<%-- 					  	  <a href="comment-delete.do?commentNo=${comment.commentNo}&no=${comment.no}">삭제</a>	 --%>
<%-- 					  	  <a href="detail.do?commentNo=${comment.commentNo}&no=${comment.no}">수정</a>	 --%>
<!-- 					  </td> -->
<!-- 					 </tr> -->
<%-- 			 	</c:otherwise> --%>
<%-- 			 </c:choose>	 --%>
<%-- 			 </c:forEach> --%>
<%-- 			 <c:if test="${empty commentList}"> --%>
<!-- 			 <tr> -->
<!-- 			    <td colspan='4'>댓글이 존재하지 않습니다.</td> -->
<!-- 			 </tr> -->
<%-- 		 	</c:if> --%>
<!-- 		 </table> -->
<!-- 		</form> -->
<!-- 	</div>  -->
<%-- 	<c:forEach var="comment" items="${list}"> --%>
<!--          <tr> -->
<%--             <td class="noticeNo">${comment.commentNo}</td> --%>
<%--             <td class="inquirelist2"><fmt:formatDate pattern="yyyy/MM/dd" value="${comment.regDate}"/></td> --%>
<!--          </tr> -->
<%--       </c:forEach> --%>



<!-- 	<div class="container"> -->
<!-- 		<div class="commentList"></div> -->
<!-- 	</div> -->
<!-- </div>	 -->
<!--                     추가                         -->
<%-- 	<%@ include file="comment.jsp"%> --%>



<!-- 	<div id="commentlist" style="font-size: 1.3em;"> -->
<!-- 		<tr> -->
<!-- 			<th class="notice_wr2">댓글1:</th> -->
<!-- 			<td class="notice_comm2"><input type="text" name="title" -->
<!-- 				style="width: 1200px; margin: 5px;" /></td> -->
<%-- 			<button><a href='detail.do?commentNo=${comment.commentNo}'>등록</a></button> --%>
<%-- 			<button><a href='updateForm.do?commentNo=${comment.commentNo}'>수정</a></button> --%>
<%-- 			<button><a href='delete.do?commentNo=${comment.commentNo}'>삭제</a></button> --%>
<!-- 		</tr> -->
<!-- 		<br> -->
<!-- 		<hr> -->
<!-- 		<tr> -->
<!-- 			<th class="notice_wr2">댓글2:</th> -->
<!-- 			<td class="notice_comm2"><input type="text" name="title" -->
<!-- 				style="width: 1200px; margin: 5px;" /></td> -->
<%-- 			<button><a href='detail.do?commentNo=${comment.commentNo}'>등록</a></button> --%>
<%-- 			<button><a href='updateForm.do?commentNo=${comment.commentNo}'>수정</a></button> --%>
<%-- 			<button><a href='delete.do?commentNo=${comment.commentNo}'>삭제</a></button> --%>
<!-- 		</tr> -->
<!-- 		<br> -->
<!-- 	</div> -->
	


	

	

<!-- 	<script> -->
<!-- // 		$.ajax({  -->
<%-- // 		url : "<c:url value="/notice/comment-list.json" />", --%>
<%-- // 		data : "noticeNo=${comment.commentNo}" --%>
<!-- // 		}).done(function(result) {  -->
<!-- //  			console.log(result);  -->
<!-- // 		}); -->
<!-- 	</script>  -->
</body>
</html>