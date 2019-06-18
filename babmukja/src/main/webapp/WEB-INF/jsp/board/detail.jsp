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
				
				<!-- 댓글 입력부분 -->
				<div class="board_comment_input">
					<i class="fas fa-comments"></i> <input type="text" class="board_detail_content" name="board_detail_content" id="content" placeholder="댓글을 입력해주세요." />
					<button class="detail_comment_button">
						<i class="fas fa-pencil-alt"></i>
					</button>
				</div>
				
				<!-- 댓글 목록부분 -->
				<div class="board_comment_content">
				</div>
				
				<!-- 댓글이 없을 때 -->
				<div class="board_comment_none">
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
		
		// 댓글 목록
		$.ajax({
			url : "boardreviewList.do",
			data : { boardNo : $("input[name='boardNo']").val()}
		})
		.done(function(result) {
			let html = "";
			for (let i = 0; i < result.comment.length; i++) {
				let date = new Date(result.comment[i].regdate);
				html += '<div class="board_comment__wrapper" id=' + result.comment[i].boardReviewNo + '>' 
				     + '<div class="board_detail_profile">'
				     + '<img src="<c:url value="/resources/images/짱구사진.jpg"/>">' 
				     + '<div class="detail_name_content">' 
				     + '<input type="hidden" class="boardReviewNo" value=' + result.comment[i].boardReviewNo + '>' 
				     + '<span class="detail_comment_nickname">주부9단빛찬맘</span>'
				     + '<span class="detail_comment_content" id=content'+ result.comment[i].boardReviewNo +'>'+ result.comment[i].content + '</span>'
				     + '<div class="board_detail_info">'
				     + '<span class="comment_regDate">'+ dateFormat(date)+ '</span>'
				     + '<span class="comment_update_button"><i class="far fa-edit"></i>수정</span>'
				     + '<span class="comment_delete_button"><i class="far fa-trash-alt"></i>삭제</span>';
				     html += '</div></div></div></div>'
			}
			$(".board_comment_content").append(html);
		});
		
		// timestamp 날짜형식 바꾸는 함수
     	function dateFormat(date){
    	    function pad(num) {
    	        num = num + '';
    	        return num.length < 2 ? '0' + num : num;
    	    }
    	    return date.getFullYear() + '.' + pad(date.getMonth()+1) + '.' + pad(date.getDate());
    	}
		
		// 댓글 등록
		$(".detail_comment_button").click(function() {
			$.ajax({
				type: "post",
				url: "boardreviewWrite.do",
				data: { boardNo : $("input[name='boardNo']").val(),
						content: $("input[name='board_detail_content']").val() },
			    success : function(result) {
			    	let html = "";
			    	
			    	html += '<div class="board_comment_wrapper" id=' + result.boardReviewNo + '>' 
			    	 + '<div class="board_detail_profile">'
				     + '<img src="<c:url value="/resources/images/짱구사진.jpg"/>">' 
				     + '<div class="detail_name_content">' 
				     + '<input type="hidden" class="boardReviewNo" value=' + result.boardReviewNo + '>' 
				     + '<span class="detail_comment_nickname">주부9단빛찬맘</span>'
				     + '<span class="detail_comment_content" id=content'+ result.boardReviewNo +'>'+ result.content + '</span>'
				     + '<div class="board_detail_info">'
				     + '<span class="comment_regDate">'+ dateFormat(new Date(result.regdate))+ '</span>'
				     + '<span class="comment_update_button"><i class="far fa-edit"></i>수정</span>'
				     + '<span class="comment_delete_button"><i class="far fa-trash-alt"></i>삭제</span>';
				     html += '</div></div></div></div>';
				     
				     $(".board_detail_content").val("");
				     $(".board_comment_content").prepend(html);
			    }
			})
		});
		
		// 댓글 삭제
		$(document).on("click", ".comment_delete_button", function() {
			let $detailNameContent = $(this).parent().parent();
			let delNo = $detailNameContent.find(".boardReviewNo").val();
			
			$.ajax({
				url: "boardreviewdelete.do",
				data: "boardReviewNo=" + delNo
			}).done(function(result) {
				$detailNameContent.parent().parent().html("");
			})
		});
		
		// 댓글 수정폼
		$(document).on("click", ".comment_update_button", function() {
			let upfNo = $(this).parent().parent().find(".boardReviewNo").val(); 
			let html = "";
			
			$.ajax({
				url: "boardreviewupdateform.do",
				data: "boardReviewNo=" + upfNo
			}).done(function(data) {
				$("#content" + upfNo).html(` 
						<input type="hidden" name="boardReviewNo" class="boardReviewNo" value= `+ data.boardReviewNo + `>
					    <input type="hidden" name="boardNo" value="${board.boardNo}"/> 
					    <input type="hidden" name="orgContent" value="`+data.content+`"/> 
						<textarea class="board_update_form">`+data.content+`</textarea> 
						<span class="comment_update_plus_button"><i class="far fa-plus-square"></i>수정</span>
						<span class="comment_update_cancel_button"><i class="far fa-minus-square"></i>수정취소</span>
						</div>`);
			}).fail(function() {
				alert("에러");				
			})
		});
		
		// 댓글 수정취소
		$(document).on("click", ".comment_update_cancel_button", function() {
			let $this = $(this);
			let canNo = $this.parent().find(".boardReviewNo").val();
			let orgContent = $this.siblings("input[name='orgContent']").val();
			$this.parent().html('<span class="detail_comment_content">'+ orgContent + '</span>');
		});
		
		// 댓글 수정
		$(document).on("click", ".comment_update_plus_button", function() {
			let $thisParent = $(this).parent();			
			let upNo = $thisParent.parent().find(".boardReviewNo").val();
			$.ajax({
				url: "boardreviewupdate.do",
				data:  {
					boardReviewNo : $("input[name='boardReviewNo']").val(),
					content : $(".board_update_form").val()
				}
			}).done(function(result) {
			     $thisParent.html(result.content);     
			})
		});
		
		// 댓글이 없을 때
		/*
		let none = $(".board_comment_none").val();
		if(none.length == 0) {
			$(".board_comment_none").html("<h3>댓글을 작성해주세요.</h3>");
		} else {
			$(".board_comment_none").html("");
		}
		*/
		
		// 댓글 페이징
	</script>
</body>
</html>