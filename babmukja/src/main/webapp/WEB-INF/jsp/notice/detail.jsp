<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/notice/notice detail.css"/>">
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"> </script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
</head>
<body style="background: white;">
	<div class="babcontainer">
		<div class="babnotices">공지사항 상세조회</div>
	</div>
	
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
				<%-- <div id="notice_select_img"> 
         	                사진: <c:forEach var="file" items="${noticeFilelist}"> 
           		       <div> 
       	    	          <img src="downloadnotice.do?path=${file.path}&sysname=${file.sysname}"> 
       	    	           </div> 
 	    	          </c:forEach> 
		        </div>  --%>
				<br>
			<br>
			<br>
			<br>
			<br>
				<div>
					등록일 : <fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /> 
				</div>
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
	</form>
    <hr>
 <!--  댓글  -->
    <div class="container">
        <label for="content" style="font-size:1.3em;">comment</label>
        <input type="checkbox" id="secretAt">비밀댓글
        <form id= "commentInsert" name="commentInsertForm" method="post">
  			<input type="hidden" name="noticeNo" value="${notice.noticeNo}">			
  			
              <div class="input-group">
               <input type="text" style="width:95%;" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
    
                    <button class="btn btn-default" id="submitComment" type="button" name="commentInsertBtn">등록</button>
<!--                     <button class="btn btn-default2" id="submitComment2" type="button" name="commentUpdateBtn">수정</button> -->
<!--                     <button class="btn btn-default3" id="submitComment3" type="button" name="commentDeletetBtn">삭제</button> -->
               </span>
              </div>
        </form>
    </div>
   
    <div class="container">
        <div class="commentList"></div>
    </div>
 
</div>

<script>
var noticeNo = ${notice.noticeNo};
alert("noticeNo: " + noticeNo );//`${detail.noticeNo}`; //게시글 번호
var noticeCommentNo = ${comment.noticeCommentNo} + 1;
console.log("noticeCommentNo" + noticeCommentNo);
var data ={};
var content = $("#content").val();
data.noticeNo = noticeNo;
data.content = content;

/* var xhr = new XMLHttpRequest();
xhr.onreadystatechange = function(){
	if(xhr.readyState == 4){
		if(xhr.status == 200){
			var data = xhr.responseText;
			console.log(data);
		}
	}
};
xhr.open("GET", "/babmukja/comment/comment-list.do", true);
xhr.send(); */

/* var xhttp = new XMLHttpRequest();
xhttp.open("GET", "/babmukja/comment/comment-list.do", true);
xhttp.onreadystatechange = function() {
  if (xhttp.readyState == 4 && xhttp.status == 200) {
    document.getElementById("Context").innerHTML = xhttp.responseText;
  }
}; */


//댓글 목록 
function commentList(){
	$.ajax({
	   url: '/babmukja/comment/comment-list.do',
	   type: 'GET',
	   data: data,
	   enctype: 'multipart/form-data',
	   success: function(data){
		   $('[name=content]').val('');
		   console.dir(data)
/* 	       alert("ajax data 성공" + data);; */
	       /* alert(data["content"]); */
	      // if(data.length > 0){
	       for(let i=0; i < data.length; i++){	   
	    	 $(".commentList").append(
	   			      '<div class="commentArea" id="commentArea'+i+'" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">'
	    			 +'<div class="commentContent"> <p> 댓글 : ' + data[i].content + '  <a style="float:right;"></a>'
	    			 +'<a href="'+ data[i].noticeCommentNo +'" style="float:right;"><button id="commentUpdate">수정</button></a>'
	    			 +'<a onclick="commentDelete('+ data[i].noticeCommentNo +');" style="float:right;"><button id="commentDelete">삭제</button></a></p></div></div>'
	    		        );  /* return false; */ 
	            } 
	       /* } else {
	    	   $(".commentList").append( 
	    			   '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">'
		    			 +'<div class="commentContent"> <p> 댓글 : ' + "등록된 댓글이 없습니다." + '</p></div></div>');
	       } */
					             
	   }
	});
}	 


////정래 예시
///* $(document).on("click", "#introDelete", function () {
//data = {};
//data.fileDirectory = fileDirectory;
//alert(fileDirectory);
//$.ajax({
//   url: '/babmukja/meetup/deleteIntro.do',
//   data: data,
//   type: "POST",
//   enctype: 'multipart/form-data',
//   success: function (data) {

//      $("#tabPanel1").html(`<span class="writeIntro"> <i class="fas fa-plus-circle fa-3x"></i></span>`);
//      dataProcess();
//   }
//});

//}); */

//댓글 등록
$("#submitComment").click(function() {  
	alert("ajax");
	var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
	console.log(" ajax데이터 들어감");
	/* $(document).on("click", "button[id='submitComment']", function(){
	alert($(this).parent());});  */
	
	/* $("#secretAt").click(function(){
		var content = $("#content").val();
		var noticeCommentNo = "${comment.noticeCommentNo}"
		var secretAt ="n";
		if($("#secretAt").is(":checked")){
			secretAt = "y";
		}
		var param = "content=" +content+"&noticeCommentNo="+noticeCommentNo+"&secretAt="+secretAt;
	    $.ajax({
	             type: "post",
	             url:'/babmukja/comment/comment-insert.do',
	             data: param,
	             success: function(){
	            	 alert("댓글이 등록되었습니다.");
	        }
	    }); 
	}); */
   
	$.ajax({
	   url : '/babmukja/comment/comment-insert.do',
	   type : 'post',
	   data : insertData,
	   success : function(data){
	       if(data == 1) {
	           $('[name=content]').val('');
	    	   alert("등록되었습니다.");
	           commentList("1"); //댓글 작성 후 댓글 목록 reload  
	     }
	   }
	});
}); 


/*     function commentUpdate(noticeCommentNo, content){	
	 var a =''; 
	 a+='<div class="input-group">'
   	 a+= '<input type="text" class="form-control" name="content_'+noticeCommentNo+'" value="'+noticeCommentNo.content+'"/>'
   	 a+= '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdate('+noticeCommentNo+');">수정</button></span>'
   	 a+= '</div>'; 
   	 $('.commentContent'+noticeCommentNo).html(a); 
     }	 */   
   	 
	/*  alert("noticeCommentNo" + noticeCommentNo)
	 var data ={};
	 data.noticeCommentNo =noticeCommentNo;
	 var updateContent = $('[name=content_'+noticeCommentNo+']').val();
	 data.updateContent = updateContent;
	   if(confirm("수정하시겠습니까?")){	  	   */
        /*    '<div class="input-group">'
    	 + '<input type="text" class="form-control" name="content_'+data.noticeCommentNo+'" value="'+content+'"/>'
    	 + '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdate('+noticeCommentNo+');">수정</button></span>'
    	 + '</div>'; 
    	 $('.commentContent'+noticeCommentNo); */
     /*   console.log(" ajax 수정데이터 들어감");
       $.ajax({
  	   url : '/babmukja/comment/comment-update.do',
  	   type : 'post',
  	   data :{'content' : updateContent, 'noticeCommentNo' : noticeCommentNo},
  	   success : function(data){
  	       if(data == 1) 
  	       alert("수정되었습니다.");	   
  	       commentList(noticeCommentNo); //댓글 수정후 목록 출력 
  	    }
     }); 
  }  */

//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
	 $(document).on("click", "button[id='commentUpdate']", function(){
         let noticeCommentNo = $(this).parent().attr("href");
		 
         $(this).parent().parent().parent().html('<div class="input-group">'
	   		   	 + '<input type="text" class="form-control" style="width:95%;" name="content_'+noticeCommentNo+'" value="'+content+'"/>'
	   		   	 + '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdate('+noticeCommentNo+');">수정</button></span>'
	   		   	 + '</div>');
		 return false; 
	     }); 
  
  
//댓글 수정
    function commentUpdate(noticeCommentNo){
	var updateContent = $('[name=content_'+noticeCommentNo+']').val(); 
	var data ={};
	  data.noticeCommentNo = noticeCommentNo; 
	  data.content = content;
	  
	if(confirm("수정하시겠습니까?")){		
	 console.log("ajax 수정데이터 들어감");	
	 $.ajax({
	    url : '/babmukja/comment/comment-update.do',
	  // async: 'false', 
	    type : 'post',
	    data :{'content' : updateContent, 'noticeCommentNo' : noticeCommentNo},
	    success : function(data){
	    if(data == 1) 
	    /* $(".btn.btn-default").on("click", function(){
	     $("#commentArea").html(data);	
	    }); */
	    // $(this).show();
	    alert("수정되었습니다.");
	    

	   }
   });
  } 
}

//댓글 삭제 
 function commentDelete(noticeCommentNo){
	 alert("noticeCommentNo" + noticeCommentNo)
	 var data ={};
	 data.noticeCommentNo =noticeCommentNo; 
		$(document).on("click", "button[id='commentDelete']", function(){
		$(this).parent().parent().parent().parent().remove(); });
	if(confirm("삭제하시겠습니까?")){
	$.ajax({
	   url : '/babmukja/comment/comment-delete.do',
	   type : 'POST',
	   data:data,
	   success : function(data){
	       if(data == 1) {
    	   alert("삭제되었습니다.");
           //commentList(); //댓글 삭제후 목록 출력 
	    }
	   }     
	 });
   }
 }	

$(document).ready(function(){
commentList(); //페이지 로딩시 댓글 목록 출력 
});  
  
</script> 





</body>
</html>