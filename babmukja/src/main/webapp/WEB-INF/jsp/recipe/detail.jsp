<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">    
    <link rel="stylesheet" href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/css/recipe/recipe-detail.css"/>">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="<c:url value="/resources/js/editor.min.js"/>"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/header@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/link@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/list@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/embed@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/raw@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/simple-image@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/checklist@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/quote@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/image@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/simple-image@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/marker@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/table@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/warning@latest"></script>
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> 
    <script src="<c:url value="/resources/js/html2canvas/html2canvas.js"/>"></script>
    <script src="<c:url value="/resources/js/html2canvas/jquery.plugin.html2canvas.js"/>"></script>
    
    <title>Document</title>
</head>
<input type="hidden" value="${sessionScope.user.memNo}" name="memNo">
<body onload="myTimeWait()">
<%--     <input id="hiddenValue" type="text" value="${inputData}"/> --%>
	
    <div id="body"><!-- 전체 body start -->
        <!---------------------------------------------------------------------------------------->
        <div id="left-body"><!-- left-body start -->

            
            <div id="post-info"><!-- post-info start -->
            	
                <div id="keyword-container">
	                	<div class="keyword-wrapper">#${keyword.country}</div>
	                	<div class="keyword-wrapper">#${keyword.situation}</div>
	                	<c:forEach var="caution" items="${cautions}">
	                		<div class="keyword-wrapper">#${caution}</div>
	                	</c:forEach>
	                	<div class="keyword-wrapper">#${keyword.level}</div>
	                	<div class="keyword-wrapper">#${keyword.time}</div>
	                	<div class="keyword-wrapper">#${keyword.type}</div>
	                	
                </div>
                <div id="post-date"><fmt:formatDate value="${recipe.regDate}" pattern="yyyy.MM.dd"/></div>
            </div><!-- post-info end -->
            <h2>${recipe.title}</h2>

            <div id="hiddenValue" style="display:none">${recipe.content}</div>
            <!-- post-body start -->
	        <div id="post-body"></div>	        
	        <c:choose>
            	<c:when test="${sessionScope.user.memNo eq recipe.memNo}">
	            	<div id="a-button">
	            		<a href="<c:url value="/recipe/updateform.do?no=${recipe.recipeNo }"/>"><i class="far fa-edit"></i>수정</a>
	            		<a id="delete-button" href="<c:url value="/recipe/delete.do?no=${recipe.recipeNo }"/>"><i class="far fa-trash-alt"></i>삭제</a>	            	
	            	</div>
            	</c:when>
            </c:choose>
            <!-- post-body end -->
             <!------------------------------------------------------------------------------------------------>
           
            <div id="comment-body"><!-- comment-body start -->
                <div id="comment-header">댓글&nbsp;<i class="far fa-comments"></i></div>                
                <div id="comment-container"><!-- comment-container start -->
                    <div id="comment-mine"><!-- comment-mine start -->
                    <c:choose>
                    	<c:when test="${sessionScope.user != null }">
	                        <c:choose>
			                	<c:when test="${sessionScope.user.memImgPath == null}">
			                    	<img id="profile-picture" src="<c:url value="/resources/images/default/userdefault.png"/>">					                	
			                	</c:when>
			                	<c:otherwise>					                	
			                    	<img id="profile-picture" src="${pageContext.request.contextPath}/member/download.do?path=${sessionScope.user.memImgPath}&sysname=${sessionScope.user.memImgSysname}">
			                	</c:otherwise>
		                	</c:choose>
							<div id="comment-nick">
								${sessionScope.user.memNickname }
							</div>                    
                    	</c:when>
                    	<c:otherwise>
                    		<img src="<c:url value='/resources/images/default/userdefault.png'/>">
                    		<div id="comment-login">
								로그인 후 이용해주세요.
							</div>
                    	</c:otherwise>
                    </c:choose>        
                        <div id="comment-input-wrapper">
	     					<div class="check-stars">
								<div class="check-backStar"></div>
								<div class="check-frontStar-wrapper">
									<div class="check-frontStar"></div>
								</div>
							</div>
							
		                    <input type="hidden" name="no" value="${recipe.recipeNo }"/>     
                            <textarea class="comment-input"></textarea>
                        <c:choose>
                        	<c:when test="${sessionScope.user ne null}">
	                        	<button id="comment-submit"><img src="<c:url value='/resources/images/comments.png'/>"></button>                        	
                        	</c:when>
                        	<c:otherwise>
                        		<button id="comment-nope"><img src="<c:url value='/resources/images/comments.png'/>"></button>
                        	</c:otherwise>
                        </c:choose>                       
                        </div>
                        
                    </div><!-- comment-mine end -->

                    <div id="comment-other"><!-- comment-other start -->
                       
                    </div><!-- comment-other end -->
                    <div id="comment-page"></div>
                </div><!-- comment-container end -->
            </div><!-- comment-body end -->   
    	</div><!-- left-body end -->
        

        <!------------------------------------------------------------------------------------------------>
        <div id="right-body"><!-- right-body start -->            
            <div id="content-wrapper"><!-- content-wrapper start -->
                <div id="content-info"><!-- content-info start -->
                    <div id="content-button-wrapper"><!-- content-button-wrapper start -->
                    
                     <c:choose>
                        	<c:when test="${likeStatus eq 'Y' }">
                        		  <button id="likeNo" class="recipeLike">
	                        		  <i class="fas fa-hand-holding-heart"></i> 
	                        		  <b class="likeCnt">${recipe.likeCnt}</b>
                        		  </button>
                        	</c:when>
                        	<c:when test="${likeStatus eq 'N' }">
                        		  <button id="likeYes" class="recipeLike">
	                        		  <i class="fas fa-hand-holding-heart"></i> 
	                        		  <b class="likeCnt">${recipe.likeCnt}</b>
                        		  </button>
                        	</c:when>
                        	<c:otherwise>
                        		  <button id="likeLogin" class="recipeLike">
	                        		  <i class="fas fa-hand-holding-heart"></i> 
	                        		  <b class="likeCnt">${recipe.likeCnt}</b>
                        		  </button>
                        	</c:otherwise>
                        </c:choose>
                        <input type="hidden" name="scrap-status" value="${scrapStatus}">      
                    	<c:choose>
                    		<c:when test="${scrapStatus eq 'Y'}">
		                        <button class="recipeScrap" style="color:white;background-color:#7db341;"><i class="fas fa-scroll"></i> <b>${recipe.scrapCnt}</b></button>                    		                    			
                    		</c:when>
                    		<c:when test="${scrapStatus eq 'N'}">
		                        <button class="recipeScrap"><i class="fas fa-scroll"></i> <b>${recipe.scrapCnt}</b></button>                    		
                    		</c:when>
                    		<c:otherwise>
		                        <button class="recipeScrap"><i class="fas fa-scroll"></i> <b>${recipe.scrapCnt}</b></button>                    		
                    		</c:otherwise>
                    	</c:choose>
                    </div><!-- content-button-wrapper end -->
                </div><!-- content-info end -->

                <div id="writer-info"><!-- writer-info start -->

                    <div id="profile-wrapper"> <!-- profile-wrapper start -->
                        <c:choose>
		                	<c:when test="${recipe.memImgPath == null}">
		                    	<img id="profile-img" src="<c:url value="/resources/images/default/userdefault.png"/>">					                	
		                	</c:when>
		                	<c:otherwise>					                	
		                    	<img id="profile-img" src="${pageContext.request.contextPath}/member/download.do?path=${recipe.memImgPath}&sysname=${recipe.memImgSysname}">
		                	</c:otherwise>
	                	</c:choose>
                        <div id="profile-id">
                            <div>${recipe.memNickname }</div>
                            <div>#level9</div>
                        </div>                   
                        <c:choose>
                        	<c:when test="${followStatus eq 'Y' }">
                        		 <button id="followNo" class="follow">팔로우</button> 
                        	</c:when>
                        	<c:when test="${followStatus eq 'N' }">
                        		<button id="follow" class="follow">팔로우</button>
                        	</c:when>
                        	<c:otherwise>
                        		<button id="followLogin" class="follow">팔로우</button>   
                        	</c:otherwise>
                        </c:choose>                                
                    </div><!-- profile-wrapper end -->

                    <div id="writer-post"><!-- writer-post start -->
                    <c:forEach var="m" items="${memRecipe}">
                        <a href="detail.do?no=${m.recipeNo }">
	                        <c:choose>
			                	<c:when test="${m.imgPath == null || m.imgPath == ''}">
			                    	<img id="post-img1" src="<c:url value="/resources/images/default.png"/>">					                	
			                	</c:when>
			                	<c:otherwise>					                	
			                    	<img id="post-img1" src="${m.imgPath }">
			                	</c:otherwise>
	                		</c:choose>
                        </a>
                    </c:forEach>
                    </div><!-- writer-post end -->
                    <button id="more-post">더 보기 <i class="fas fa-caret-down fa-1x"></i> </button>
                </div><!-- writer-info end -->
            </div><!-- content-wrapper end -->            
        </div><!-- right;body end -->
    </div> <!-- 전체 body end -->
    
	
	<input type="hidden" name="img_val" id="img_val" value="" /> 
	<!-- scrap modal -->
   	<div class="modal fade" id="modal-scrap" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		<div class="modal-dialog" role="document" style="min-width:1100px;margin:0 auto;margin-top:70px;">
			<div class="modal-content" id="recipe-content" style="width:900px; height: 700px;margin:0 auto;">
				
					<div id="modal-container">
				        <div id="scrapbook-wrapper-sec1">
				            <p>${sessionScope.user.memNickname}'s 스크랩북</p>
				        </div>
				        <div id="scrapbook-wrapper-sec2">
				        </div>
				        <div id="scrapbook-wrapper-sec3">

				        </div>
				        <div id="scrapbook-wrapper-sec4">
				            <button id="scrapbook-wrapper-sec4-button1">등록</button>
				            <button id="scrapbook-wrapper-sec4-button2">취소</button>
				        </div>
				    </div>
				    
			</div>
		</div>
	</div>
	<script src="<c:url value="/resources/js/html2canvas/recipe-capture.js"/>"></script>
    <script>      
    $("#more-post").click(function () {
    	location.href = "<c:url value='/member/mypage.do?memNickname=${recipe.memNickname}'/>";
    });
    // 좋아요 기능
    $(".recipeLike").click(function () {
    	if('${sessionScope.user}' != "") {
	    	$.ajax({
	    		url : "like.do",
	    		data : {
	    			'recipeNo' : '${recipe.recipeNo}',
	    			'memNo' : '${sessionScope.user.memNo}'
	    		},
	    		success : function (result) {  
	    			if(result.status == 'Y') {
// 	    				alert("좋아요가 되었습니다.");
	    				$(".recipeLike").css({
	    					background : "#7db341",
		    				color : "white"		    				    
	    				});	    				
	    				$(".likeCnt").html(result.cnt);
	    			} else if(result.status == 'N') {
// 	    				alert("좋아요가 해제되었습니다.");
	    				$(".recipeLike").css({	    					
	    				    background: "#eee",
	    			    	color: "#bbb"
	    				});
	    				
	    				$(".likeCnt").html(result.cnt);
	    			} else {
// 	    				alert("좋아요가 되었습니다.");
	    				$(".recipeLike").css({
	    					background : "#7db341",
		    				color : "white"		    				    
	    				});	    				
	    				$(".likeCnt").html(result.cnt);
	    			}
	    		}
	    	});
    	} else alert("로그인 후 이용가능합니다.");
    });
    
    // 팔로우 기능
    $(".follow").click(function () {  	
		if('${sessionScope.user.memNo}' != '${recipe.memNo}' && '${sessionScope.user}' != '') {
		    	$.ajax({
		    		url : "follow.do",
		    		data : {
		    			'followMemNo': '${recipe.memNo}',
		    			'followerMemNo':  '${sessionScope.user.memNo}'
		    		},
		    		success : function(result) {		    		
		    			if(result == 1) {
// 			    			alert("팔로우가 되었습니다.");	
			    			$(".follow").css({
			    				background : "#7db341",
			    				color : "white"	
			    			});
		    			} else if(result == 0) {
// 		    				alert("팔로우가 해제되었습니다.");
		    				$(".follow").css({
		    					background : "#eee",
		    			    	color: "#777"
			    			});
		    			} else alert("로그인 후 이용가능합니다.");
		    		}
		    	});
			} 
		if('${sessionScope.user.memNo}' == '${recipe.memNo}') {
			alert("자신은 팔로우 할 수 없습니다.");
		}
		
    	});
   	 	
    
    $("#comment-nope").click(function () {
    	alert("로그인 후 이용가능합니다.");
    	$(".comment-input").html("");
    });
    
    // 댓글 등록하기
     $("#comment-submit").click(function () { 
    	 if($(".comment-input").val() == null || $(".comment-input").val() == '') {
    		 alert("댓글 내용을 입력해주세요.");
    		 return;
    	 }
    	$.ajax({
	    		type: "post",
	    		url : "recipeCommentWrite.do",
	    		data : {
	    				recipeNo : $("input[name='no']").val(),
	    				score : checkedValue,
	    				content : $(".comment-input").val()
	    		},
				success : function(result) {
	    			let html = "";	
	    		
	    	 		html +=  '<div class="comment-other-wrapper" id=' + result.recipeReviewNo + '>'
				    	 		if (result.memImgPath != null) {
			 						html += '<img class="other-profile" src="<c:url value="/resources/images/default/userdefault.png"/>">'
			 					} else {
			 						html += '<img class="other-profile" src="${pageContext.request.contextPath}/member/download.do?path=${sessionScope.user.memImgPath}&sysname=${sessionScope.user.memImgSysname}">'
			 					}
	    	 			html	+='<div class="other-content-wrapper">'
	    	 					+'<input type="hidden" class="reviewNo" value=' + result.recipeReviewNo + '>' 
	    	 					+'<div>'
	    	 					+'<div class="other-id">'+ result.memNickname +'</div>'
	    	 					+'<div class="other-rating">' 
	    	 					+'<div class="stars">'
								+'<div class="backStar"></div>'
								+'<div class="frontStar-wrapper">'
								+'<div class="frontStar" style="width:'+result.score*24+'px;"></div>'
								+'</div>'		
								+'</div>'	
	    	 					+'</div>'
	    	 					+'<div class="other-date">' +  dateFormat(new Date(result.regdate)) + '</div>'
	    	 					+'</div>'
	    	 	     			+'<div class="other-content" id=c' + result.recipeReviewNo + '>' + result.content + '</div>'
	    	 	     			+'<c:if test="${sessionScope.user.memNo ne result.memNo}">'
	    	 	     			+'<div><button class="updateComment" id="updateComment">수정</button><button class="deleteComment">삭제</button></div>'
	    	 	     			+'</c:if>'
	    	 	     			+'</div></div>';
		    	 	     				 	 
		    	 	 $(".comment-input").val("");		
		    	 	 $("#h5").html("");
		    	 	 $("#comment-other").prepend(html);
		    	 	 $("#comment-other").html("");
					commentList(1);
    			}
    		})
    	});
     
     // 댓글 목록 불러오기
     function commentList(pageNo){
    	 pageNo = pageNo - 1;
    	 let index = pageNo * 5;
	     $.ajax({    	 
		 		url: "recipeCommentList.do"	,
		 		data : {
		 			recipeNo : $("input[name='no']").val(),
		 			index : index,
		 			pageNo : pageNo
		 		}
		 	})
		 	.done(function (result) {
		 		let loginMemNo = '${sessionScope.user.memNo}';
		 		if(result.comment.length == 0) {	 			
		 			$("#comment-other").html("<h5 id='h5'>댓글을 작성해주세요.</h5>");
		 		}
		 		let html = "";	
		 		for(let i = 0; i < result.comment.length; i++) {
					console.dir(result.comment[i]);
		 			let date = new Date(result.comment[i].regdate);
		 			html += '<div class="comment-other-wrapper" id=' + result.comment[i].recipeReviewNo + '>'
		 					if (result.comment[i].memImgPath == null) {
		 						html += '<img class="other-profile" src="<c:url value="/resources/images/default/userdefault.png"/>">'
		 					} else {
		 						html += '<img class="other-profile" src="${pageContext.request.contextPath}/member/download.do?path='+ result.comment[i].memImgPath + '&sysname='+ result.comment[i].memImgSysname+ '">'
		 					}
		 			html	+='<div class="other-content-wrapper">'
		 					+'<input type="hidden" class="reviewNo" value=' + result.comment[i].recipeReviewNo + '>' 
		 					+'<div>'
		 					+'<div class="other-id">'+ result.comment[i].memNickname +'</div>'	
		 					+'<div class="stars">'
							+'<div class="backStar"></div>'
							+'<div class="frontStar-wrapper">'
							+'<div class="frontStar" style="width:'+result.comment[i].score*24+'px;"></div>'
							+'</div>'		
							+'</div>'
		 					+'<div class="other-date">' + dateFormat(date)+ '</div>'
		 					+'</div>'
		 	     			+'<div class="other-content" id=c' + result.comment[i].recipeReviewNo + '>' + result.comment[i].content + '</div>';
		 	     			if (loginMemNo == result.comment[i].memNo) {	 	     		
		 	     				html += '<div><button class="updateComment" id="updateComment">수정</button><button class="deleteComment">삭제</button></div>'
		 					}
		 	     			html += `</div></div>`; 	     			
		 	     		
		 			}	
		 	 		$("#comment-other").append(html);
		 	 		printPaging(result.pageResult);
		 	});
     }
     
     $(document).on("click","#comment-page a",function(e){
         e.preventDefault();
         page = $(this).attr("href");         
         $("#comment-other").html("");
         commentList(page);
      });
     

     // 페이징 함수
     function printPaging(page) {
    	 console.log(page);
    	 var str = "";
    	 if(page.prev) {
    		 str += "<div class='comment-prev'><a href='"+ (page.beginPage - 1) +"'><img class='left-arrow' src='<c:url value='/resources/images/icons/left-arrow.png'/>'/></a></div>";
    	 }
		 for(var i = page.beginPage; i <= page.endPage; i++) {
			 if(page.pageNo == (i-1)) {
				 str += "<div class ='current-page'><a href='"+ i +"'>" + i + "</a></div>";
			 } else {
				 str += "<div class='pagination'><a href='"+ i +"'>" + i + "</a></div>";				 
			 }
		 }
		 if(page.next) {
			 str += "<div class='comment-next'><a href='"+ (page.endPage + 1) +"'><img class='right-arrow' src='<c:url value='/resources/images/icons/right-arrow.png'/>'/></a></div>";
		 }
		 $("#comment-page").html(str); 
	}
     
     // 댓글 수정 버튼 이벤트
     $(document).on("click",".updateComment",function () {
    	 let no = $(this).parent().parent().find(".reviewNo").val();
    	 let html = "";
  		$.ajax({
 			url : "commentUpdateForm.do",
 			data : "no=" + no
 		}).done (function (data) {
 			 $("#c" + no).html(` <input type="hidden" name="reviewNo" class="reviewNo" value= `+ data.recipeReviewNo + `>
	                    	    <input type="hidden" name="no" value="${recipe.recipeNo }"/>     
	                    		<textarea class="comment-updateform">`+data.content+`</textarea>                			  
	                  			 <button class="comment-update">
	                  			 	<img src="<c:url value='/resources/images/comments.png'/>">
	                  			 </button>                  			
                  			 	<button class="comment-exit">
                  			 		<i class="far fa-times-circle"></i>
                  			 	</button>
                  			 </div>`); 
 		}).fail(function(xhr) {
 			alert("오류 발생");
 		})	
     });
     
     // 댓글 수정 취소
     $(document).on("click", ".comment-exit", function () {
    	 let no = $(this).parent().find(".reviewNo").val();
    	
    	 $.ajax({
    		 url : "returnReviewData.do",
    		 data : "no=" + no
    	 }).done(function (result) {    		 	    		
 	 		 $("#c" + no).html('<div class="other-content">' + result.content + '</div>');		
    	 })    	 
     });
     
     // 댓글 수정
     $(document).on("click", ".comment-update", function () {
    	 let no = $(this).parent().parent().find(".reviewNo").val();   	 
    	
    	 $.ajax({
    		 url : "updateComment.do",    		 
    		 data : {
    			recipeReviewNo : $("input[name='reviewNo']").val(),
 				score : $("input[name='reviewStars']:checked").val(),
				content : $(".comment-updateform").val()
				}
    		
    	 }).done(function (result) { 	
    		 let html = "";
			 html += '<input type="hidden" class="reviewNo" value=' + result.recipeReviewNo + '>'  					
 	     			+'<div class="other-content" id=' +result.recipeReviewNo + '>' + result.content + '</div>'; 
   		 	$("#c" + no).html(html);
    	 })
     });
     
 	
 	// 댓글 삭제하기
 	$(document).on("click", ".deleteComment", function () {
 		let num = $(this).parent().parent().find(".reviewNo").val();
 		$.ajax({
 			url : "commentDelete.do",
 			data :"no=" + num
 		}).done(function (result) {    		
	    	$("#"+ num).html("");
			commentList(1);
 			if($(".other-content").length == 1 ) {
 				$("#"+ num).html("");
 				$("#comment-other").html("<h5 id='h5'>댓글을 작성해주세요.</h5>");
 			} 		
 		})  
 	});
 		
     
     	// timestamp 날짜형식 바꾸는 함수
     	function dateFormat(date){
    	    function pad(num) {
    	        num = num + '';
    	        return num.length < 2 ? '0' + num : num;
    	    }
    	    return date.getFullYear() + '.' + pad(date.getMonth()+1) + '.' + pad(date.getDate());
    	}
     
     	// 레시피 삭제하기
        const value = $("#hiddenValue").text();
    	$("#delete-button").click(function () {    		
    		if(confirm("삭제하시겠습니까?") == true){
    	        alert("삭제되었습니다");
    	    }
    	    else {
    	        return false;
    	    }
    	});

    	
        $(document).ready(function() {
            $(".comment-input").keyup(function (e){
            $(this).css('height', 'auto' ).height( this.scrollHeight );
            });
        });
        
        const editor = new EditorJS({
            holderId: 'post-body',

            autofocus: false,
            data: JSON.parse(value),
            tools: { 
                warning: {
                    class: Warning,
                    inlineToolbar: true,
                },
     
                table: {
                    class: Table,
                    inlineToolbar: true,
                },                       
                quote: {
                    class: Quote,
                    inlineToolbar: true,
                },
				image: {
                    class: ImageTool,
                },            

                header: {
                    class: Header,
                }, 
                checklist: {
                    class: Checklist,
                },
                linkTool: {
                    class: LinkTool,
                },
                marker: {
                    class: Marker,
                },
                list: {
                    class: List,
                },
                embed: {
                    class: Embed,
                }
            }
        });
		
       function myTimeWait(){	   
    	   	$("#post-body").append($("<div id='recipe-cover'></div>").css({zIndex:"50","position":"absolute","width":"100%","height":"100%",top:"0px",left:"0px",background:"rgba(0,0,0,0)"}));	    
       }
       let mOverValue = 0;
       let checkedValue = 5;
       let $checkStar = $(".check-frontStar");
		 $(".check-stars").mouseover(function(e){
	            let x,y;
	            $(this).mousemove(function(e){
	                let x = e.offsetX;
	                if(x <= 24){
	                	mOverValue = 1;
	                }else if(x <= 48){
	                	mOverValue = 2;
	                }else if(x <= 72){
	                	mOverValue = 3;
	                }else if(x <= 96){
	                	mOverValue = 4;
	                }else if(x <= 120){
	                	mOverValue = 5;
	                	
	                }else{
	                	$checkStar.css({width: "0px"});
	                	mOverValue = 0;
	                }
	            })   
	        }).click(function(){
		       	checkedValue = mOverValue;
	           	let widthVal = checkedValue * 24;
	           	$checkStar.css({width: widthVal + "px"});
           });
		 
		 
		 commentList(1);
    </script>
    
</body>
</html>