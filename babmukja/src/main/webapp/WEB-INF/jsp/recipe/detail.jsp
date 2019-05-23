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
                <div>#야식만보고삽니다</div>
                <div id="post-date">방금 전</div>
            </div><!-- post-info end -->
            <h2>${recipe.title}</h2>

            <div id="hiddenValue" style="display:none">${recipe.content}</div>
            <!-- post-body start -->
	        <div id="post-body"></div>
            <a href="<c:url value="/recipe/updateform.do?no=${recipe.recipeNo }"/>">수정하기</a>
            <a id="delete-button" href="<c:url value="/recipe/delete.do?no=${recipe.recipeNo }"/>">삭제하기</a>
            <!-- post-body end -->
             <!------------------------------------------------------------------------------------------------>
            <form name="commentForm" >
            <div id="comment-body"><!-- comment-body start -->
                <div id="comment-header">댓글 <b id="comment-count">3</b></div>                
                <div id="comment-container"><!-- comment-container start -->
                    <div id="comment-mine"><!-- comment-mine start -->
                        <img src="/babmukja/WEB-INF/images/profile2.jpg">
                        <div id="comment-input-wrapper">
                               <div id="reviewStars-input">
	                                <input id="star-4" type="radio" name="reviewStars" value="5"/>
	                                <label title="gorgeous" for="star-4"></label>
	                            
	                                <input id="star-3" type="radio" name="reviewStars" value="4"/>
	                                <label title="good" for="star-3"></label>
	                            
	                                <input id="star-2" type="radio" name="reviewStars" value="3"/>
	                                <label title="regular" for="star-2"></label>
	                            
	                                <input id="star-1" type="radio" name="reviewStars" value="2"/>
	                                <label title="poor" for="star-1"></label>
	                            
	                                <input id="star-0" type="radio" name="reviewStars" value="1"/>
	                                <label title="bad" for="star-0"></label>
		                       </div>
		                        
                            <textarea id="comment-input"></textarea>
                        </div>
                        <button id="comment-submit"><i class="fas fa-pen-square fa-3x"></i></button>
                    </div><!-- comment-mine end -->

                    <div id="comment-other"><!-- comment-other start -->
                        
                        <div class="comment-other-wrapper">
                            <img class="other-profile" src="/babmukja/WEB-INF/images/profile19.jpg">
                            <div class="other-content-wrapper">
                                <div>
                                    <div class="other-id">박보검이다</div>
                                    <div class="other-date">7분 전</div>
                                </div>
                                <div class="other-content">야식은 역시 치킨이죠</div>
                            </div>
                        </div>
                    </div><!-- comment-other end -->
                </div><!-- comment-container end -->
            </div><!-- comment-body end -->
        </form>
     </div><!-- left-body end -->
        

        <!------------------------------------------------------------------------------------------------>
        <div id="right-body"><!-- right-body start -->
            
            <div id="content-wrapper"><!-- content-wrapper start -->

                <div id="content-info"><!-- content-info start -->
                    <div id="content-button-wrapper"><!-- content-button-wrapper start -->
                        <button><i class="fas fa-hand-holding-heart"></i> <b>30</b></button>
                        <button><i class="fas fa-scroll"></i> <b>12</b></button>
                    </div><!-- content-button-wrapper end -->
                </div><!-- content-info end -->

                <div id="writer-info"><!-- writer-info start -->

                    <div id="profile-wrapper"> <!-- profile-wrapper start -->
                        <img id="profile-img" src="/babmukja/WEB-INF/images/profile20.jpg">
                        <div id="profile-id">
                            <div>bitchanmom</div>
                            <div>#level9</div>
                        </div>
                        <button id="follow">팔로우</button>
                    </div><!-- profile-wrapper end -->

                    <div id="writer-post"><!-- writer-post start -->
                        <a href="#"><img id="post-img1" src="/babmukja/WEB-INF/images/f8.jpg"></a>
                        <a href="#"><img id="post-img2" src="/babmukja/WEB-INF/images/f2.jpg"></a>
                        <a href="#"><img id="post-img3" src="/babmukja/WEB-INF/images/f3.jpg"></a>
                        <a href="#"><img id="post-img4" src="/babmukja/WEB-INF/images/f4.jpg"></a>
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
    
     $("#comment-submit").click(function () {
    	$.ajax({
	    		type: "post",
	    		url : "recipeComment.do" ,
	    		data : {score : $("input[name='reviewStars']").val(),
	    				content : $("#comment-input").val()}
	    		success : function(data) {
	    			alert(data);
    			}
    		}
    	});
    	
    }); 
    	
    	
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
            $("#comment-input").keyup(function (e){
            $(this).css('height', 'auto' ).height( this.scrollHeight );
            });
        });
        const editor = new EditorJS({
            holderId: 'post-body',

            autofocus: true,
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
	   
    	   	console.log($("#post-body").width() + " " + $("#post-body").height());
    	   	$("#post-body").append($("<div></div>").css({zIndex:"50","position":"absolute","width":"100%","height":"100%",top:"0px",left:"0px",background:"rgba(0,0,0,0)"}));	    
       }
        
    </script>
    
</body>
</html>