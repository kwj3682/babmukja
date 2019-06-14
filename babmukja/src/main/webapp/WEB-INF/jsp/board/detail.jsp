<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/board/style.css"/>" />
<link rel="stylesheet"
	href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous" />
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
</head>
<body>
	<main>
	<div class="board_detail_container">
		<div class="board_detail_wrapper">
			<div class="board_detail">
				<div class="board_detail_writer">
					<input type='hidden' name='boardNo' value='${board.boardNo}' />
					${board.writer}님 <i class="fas fa-user"></i>
				</div>
				<div class="board_detail_title">${board.title}</div>
				<div class="board_detail_info_button">
					<div class="board_detail_info">
						<span class="board_regDate"> <i class="far fa-calendar-alt"></i>&nbsp;
							<fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" /></span>
						<span class="board_viewCnt"><i class="far fa-eye"></i>&nbsp;${board.viewcnt}</span>
					</div>
					<div class="board_detail_button">
						<span class="board_update_button">
						<i class="far fa-edit"></i><a href="<c:url value='/board/updateform.do?boardNo=${board.boardNo}'/>">수정</a></span>&nbsp; 
						<span class="board_delete_button">
						<i class="far fa-trash-alt"></i><a href="<c:url value='/board/delete.do?boardNo=${board.boardNo}'/>">삭제</a></span>
					</div>
				</div>
				
				<div class="board_img_content"> 	
				<div class="board_detail_img">
					<img src="<c:url value='imgdownload.do?boardNo=${board.boardNo}'/>">
				</div>
				<div class="board_detail_content">${board.content}</div>
				</div>
				
				<div class="heart"></div>
			</div>

			<!--댓글 부분-->
			<div class="board_detail_comment">
				<div class="board_comment_title">
					<p class="comment_msg">답글</p>
				</div>
				<div class="board_comment_input">
					<i class="fas fa-comments"></i> <input type="text"
						placeholder="댓글을 입력해주세요." />
					<button class="detail_comment_button">
						<i class="fas fa-pencil-alt"></i>
					</button>
				</div>
				<div class="board_comment_content">
					<div class="board_detail_profile">
						<img src="<c:url value="/resources/images/짱구사진.jpg"/>">

						<div class="detail_name_content">
							<span class="detail_comment_nickname">주부9단빛찬맘</span> <span
								class="detail_comment_content">좋은 의견이네요!</span>
							<div class="board_detail_info">
								<span class="comment_regDate">2019-06-10</span> <span
									class="comment_update_button"><i class="far fa-edit"></i>수정</span>
								<span class="comment_delete_button"><i
									class="far fa-trash-alt"></i>삭제</span>
							</div>
						</div>
					</div>
					<div class="board_detail_profile">
						<img src="<c:url value="/resources/images/짱구우산.jpg"/>">
						<div class="detail_name_content">
							<span class="detail_comment_nickname">렁래쓰</span> <span
								class="detail_comment_content">좋은 정보 완벽!</span>
							<div class="board_detail_info">
								<span class="comment_regDate">2019-06-11</span> <span
									class="comment_update_button"><i class="far fa-edit"></i>수정</span>
								<span class="comment_delete_button"><i
									class="far fa-trash-alt"></i>삭제</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>

	<script>
		// 하트 기능
		$(".heart").on("click", function() {
			$(this).toggleClass("is_animating");
		});
	</script>
</body>
</html>