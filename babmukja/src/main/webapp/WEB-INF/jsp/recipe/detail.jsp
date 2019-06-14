<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">    
    <link rel="stylesheet" href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/css/recipe/recipe-detail.css"/>">
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
    <title>Document</title>
</head>
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
                <div id="post-date">방금 전</div>
            </div><!-- post-info end -->
            <h2>${recipe.title}</h2>

            <div id="hiddenValue" style="display:none">${recipe.content}</div>
            <!-- post-body start -->
	        <div id="post-body"></div>	        
	        <c:choose>
            	<c:when test="${sessionScope.user.memNo eq recipe.memNo}">
	            	<div id="a-button">
	            		<a href="<c:url value="/recipe/updateform.do?no=${recipe.recipeNo }"/>">수정</a>
	            		<a id="delete-button" href="<c:url value="/recipe/delete.do?no=${recipe.recipeNo }"/>">삭제</a>	            	
	            	</div>
            	</c:when>
            </c:choose>
            <!-- post-body end -->
             <!------------------------------------------------------------------------------------------------>
           
            <div id="comment-body"><!-- comment-body start -->
                <div id="comment-header">댓글</div>                
                <div id="comment-container"><!-- comment-container start -->
                    <div id="comment-mine"><!-- comment-mine start -->
                        <img src="<c:url value='/resources/images/ma.jpg'/>">
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
	                        	<button id="comment-submit"><i class="fas fa-pen-square fa-3x"></i></button>                        	
                        	</c:when>
                        	<c:otherwise>
                        		<button id="comment-nope"><i class="fas fa-pen-square fa-3x"></i></button>
                        	</c:otherwise>
                        </c:choose>                       
                        </div>
                        
                    </div><!-- comment-mine end -->

                    <div id="comment-other"><!-- comment-other start -->
                       
                    </div><!-- comment-other end -->
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
                    
                        <button class="recipeScrap"><i class="fas fa-scroll"></i> <b>12</b></button>
                    </div><!-- content-button-wrapper end -->
                </div><!-- content-info end -->

                <div id="writer-info"><!-- writer-info start -->

                    <div id="profile-wrapper"> <!-- profile-wrapper start -->
                        <img id="profile-img" src="<c:url value="/resources/images/ma.jpg"/>">
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
                    <c:forEach var="mrecipe" items="${memRecipe}">
                        <a href="detail.do?no=${mrecipe.recipeNo }">
                        	<img id="post-img1" src="${mrecipe.imgPath }">
                        </a>
                    </c:forEach>
                    </div><!-- writer-post end -->
                    <button id="more-post">더 보기 <i class="fas fa-caret-down fa-1x"></i> </button>
                </div><!-- writer-info end -->
                
                <div id="share-button">
                    <i class="fab fa-facebook-f fa-3x"></i>
                    <i class="fab fa-instagram fa-3x"></i>
                </div>
            
            </div><!-- content-wrapper end -->            
        </div><!-- right;body end -->
    </div> <!-- 전체 body end -->
    
    
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
	    				alert("좋아요가 되었습니다.");
	    				$(".recipeLike").css({
	    					background : "#7db341",
		    				color : "white"		    				    
	    				});	    				
	    				$(".likeCnt").html(result.cnt);
	    			} else if(result.status == 'N') {
	    				alert("좋아요가 해제되었습니다.");
	    				$(".recipeLike").css({	    					
	    				    background: "#eee",
	    			    	color: "#bbb"
	    				});
	    				
	    				$(".likeCnt").html(result.cnt);
	    			} else {
	    				alert("좋아요가 되었습니다.");
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
			    			alert("팔로우가 되었습니다.");	
			    			$(".follow").css({
			    				background : "#7db341",
			    				color : "white"	
			    			});
		    			} else {
		    				alert("팔로우가 해제되었습니다.");
		    				$(".follow").css({
		    					background : "#eee",
		    			    	color: "#777"
			    			});
		    			}
		    		}
		    	});
			} 
		if('${sessionScope.user.memNo}' == '${recipe.memNo}') {
			alert("같은 회원은 팔로우 할 수 없습니다.");
		}
		else alert("로그인 후 이용가능합니다.");
    	});
   	 	
    
    $("#comment-nope").click(function () {
    	alert("로그인 후 이용가능합니다.");
    	$(".comment-input").html("");
    });
    
    // 댓글 등록하기
     $("#comment-submit").click(function () {   
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
	    	 					+'<img class="other-profile" src="">'
	    	 					+'<div class="other-content-wrapper">'
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
		    	 	 $("#h3").html("");
		    	 	 $("#comment-other").prepend(html);	

    			}
    		})
    	});
     
     // 댓글 목록 불러오기
     $.ajax({    	 
	 		url: "recipeCommentList.do"	,
	 		data : {
	 			recipeNo : $("input[name='no']").val()	 			
	 		}
	 	})
	 	.done(function (result) {
	 		let loginMemNo = '${sessionScope.user.memNo}';
	 		if(result.comment.length == 0) {	 			
	 			$("#comment-other").html("<h3 id='h3'>댓글을 작성해주세요.</h3>");
	 		}
	 		let html = "";	
	 		for(let i = 0; i < result.comment.length; i++) {

	 			let date = new Date(result.comment[i].regdate);
	 			html += '<div class="comment-other-wrapper" id=' + result.comment[i].recipeReviewNo + '>' 
	 					+'<img class="other-profile" src="">'
	 					+'<div class="other-content-wrapper">'
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
	 	     			html += '</div></div>';	 
	 			}	
	 	 		$("#comment-other").append(html);
	 	});
	
     // 댓글 수정 버튼 이벤트
     $(document).on("click",".updateComment",function () {
    	 let no = $(this).parent().parent().find(".reviewNo").val();
    	 console.log("수정 no : " + no);
    	 let html = "";
  		$.ajax({
 			url : "commentUpdateForm.do",
 			data : "no=" + no
 		}).done (function (data) {
 			 $("#c" + no).html(` <input type="hidden" name="reviewNo" class="reviewNo" value= `+ data.recipeReviewNo + `>
	                    	    <input type="hidden" name="no" value="${recipe.recipeNo }"/>     
	                    		<textarea class="comment-updateform">`+data.content+`</textarea>                			  
	                  			 <button class="comment-update">
	                  			 	<i class="fas fa-pen-square fa-3x"></i>
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
 			if($(".other-content").length == 1 ) {
 				$("#"+ num).html("");
 				$("#comment-other").html("<h3 id='h3'>댓글을 작성해주세요.</h3>");
 			}
 		
	    	$("#"+ num).html("");   
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
//     	   	console.log($("#post-body").width() + " " + $("#post-body").height());
    	   	$("#post-body").append($("<div></div>").css({zIndex:"50","position":"absolute","width":"100%","height":"100%",top:"0px",left:"0px",background:"rgba(0,0,0,0)"}));	    
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
    </script>
    
</body>
</html>