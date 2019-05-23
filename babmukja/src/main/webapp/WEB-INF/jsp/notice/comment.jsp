<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style>
       .container {
        display:flex;
        background-color:#eee;
        border:1px solid #222;
        margin-bottom:20px;
      }
      
      .opt3{
        justify-content: center;       
      }
    </style>
</head>
<body>
<div class="container opt3">
    <form id="commentForm" name="commentForm" method="post">
    <br><br>
        <div class="box">
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div class="box">
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 1100px" rows="3" cols="30" id="comment" name="comment" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div class="box">
                                <a href='detail.do?commentNo=${comment.commentNo}' onClick="fn_comment('${result.code }')" class="btn pull-right btn-success"><button style="float:right">등록</button></a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="noticeNo" name="noticeNo" value="${result.code }" />        
    </form>
</div>
<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</div>
 
 
<script>
/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(code){
    
    $.ajax({
        type:'POST',
        url : "<c:url value='/notice/addComment.do'/>",
        data:$("#commentForm").serialize(),
        success : function(data){
            if(data=="success")
            {
                getCommentList();
                $("#comment").val("");
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    
    getCommentList();
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
    
    $.ajax({
        type:'GET',
        url : "<c:url value='/notice/commentList.do'/>",
        dataType : "json",
        data:$("#commentForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong></h6>";
                    html += data[i].comment + "<tr><td></td></tr>";
                    html += "</table></div>";
                    html += "</div>";
                }
                
            } else {
                
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
            
        },
        error:function(request,status,error){
            
       }
        
    });
}
 
</script>
 
</body>
</html>





















<%-- //  var noticeNo = ${notice.noticeNo};    //`${detail.noticeNo}`; //게시글 번호 --%>
<!-- // console.log("noticeNo" + noticeNo); -->
<!-- // $('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시  -->
<!-- //     var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴 -->
<!-- //     commentInsert(insertData); //Insert 함수호출(아래) -->
<!-- // }); -->
 
 
<!-- // //댓글 목록  -->
<!-- //  function commentList(){ -->
<!-- //     let data ={}; -->
<!-- //     data.commentNo = commentNo; -->
<!-- // 	$.ajax({ -->
<!-- //         url : '/babmukja/notice/comment-list.do', -->
<!-- //         type : 'GET', -->
<!-- //         data : data, -->
<!-- //         enctype: 'multipart/form-data', -->
<!-- //         success : function(data){ -->
<!-- //             alert("ajax data 성공" + data); -->
<!-- //         	var a ='';  -->
<!-- //             $.each(data, function(key, value){  -->
<!-- //                 a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">'; -->
<!-- //                 a += '<div class="commentInfo'+value.commentNo+'">'+'댓글번호 : '+value.commentNo+' / 작성자 : '+value.writer; -->
<!-- //                 a += '<a onclick="commentUpdate('+value.commentNo+',\''+value.content+'\');"> 수정 </a>'; -->
<!-- //                 a += '<a onclick="commentDelete('+value.commentNo+');"> 삭제 </a> </div>'; -->
<!-- //                 a += '<div class="commentContent'+value.commentNo+'"> <p> 내용 : '+value.content +'</p>'; -->
<!-- //                 a += '</div></div>'; -->
<!-- //             });  -->
            
<!-- //             $(".commentList").html(a); -->
<!-- //         } -->
<!-- //     }); -->
<!-- // }  -->
 
<!-- //  //정래 예시 -->
<!-- // /* $(document).on("click", "#introDelete", function () { -->
<!-- //     data = {}; -->
<!-- //     data.fileDirectory = fileDirectory; -->
<!-- //     alert(fileDirectory); -->
<!-- //     $.ajax({ -->
<!-- //        url: '/babmukja/meetup/deleteIntro.do', -->
<!-- //        data: data, -->
<!-- //        type: "POST", -->
<!-- //        enctype: 'multipart/form-data', -->
<!-- //        success: function (data) { -->

<!-- //           $("#tabPanel1").html(`<span class="writeIntro"> <i class="fas fa-plus-circle fa-3x"></i></span>`); -->
<!-- //           dataProcess(); -->
<!-- //        } -->
<!-- //     }); -->

<!-- //  }); */ -->
<!-- // //댓글 등록 -->
<!-- // function commentInsert(insertData){ -->
<!-- //     $.ajax({ -->
<!-- //         url : '/babmukja/notice/comment-insert', -->
<!-- //         type : 'post', -->
<!-- //         data : insertData, -->
<!-- //         success : function(data){ -->
<!-- //             if(data == 1) { -->
<!-- //                 commentList(); //댓글 작성 후 댓글 목록 reload -->
<!-- //                 $('[name=content]').val(''); -->
<!-- //             } -->
<!-- //         } -->
<!-- //     }); -->
<!-- // } -->
 
<!-- // //댓글 수정 - 댓글 내용 출력을 input 폼으로 변경  -->
<!-- // function commentUpdate(commentNo, content){ -->
<!-- //     var a =''; -->
    
<!-- //     a += '<div class="input-group">'; -->
<!-- //     a += '<input type="text" class="form-control" name="content_'+commentNo+'" value="'+content+'"/>'; -->
<!-- //     a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>'; -->
<!-- //     a += '</div>'; -->
    
<!-- //     $('.commentContent'+commentNo).html(a); -->
    
<!-- // } -->
 
<!-- // //댓글 수정 -->
<!-- // function commentUpdateProc(commentNo){ -->
<!-- //     var updateContent = $('[name=content_'+commentNo+']').val(); -->
    
<!-- //     $.ajax({ -->
<!-- //         url : '/notice/comment-update', -->
<!-- //         type : 'post', -->
<!-- //         data : {'content' : updateContent, 'commentNo' : commentNo}, -->
<!-- //         success : function(data){ -->
<!-- //             if(data == 1) commentList(noticeNo); //댓글 수정후 목록 출력  -->
<!-- //         } -->
<!-- //     }); -->
<!-- // } -->
 
<!-- // //댓글 삭제  -->
<!-- // function commentDelete(commentNo){ -->
<!-- //     $.ajax({ -->
<!-- //         url : '/babmukja/notice/comment-delete/'+commentNo, -->
<!-- //         type : 'post', -->
<!-- //         success : function(data){ -->
<!-- //             if(data == 1) commentList(noticeNo); //댓글 삭제후 목록 출력  -->
<!-- //         } -->
<!-- //     }); -->
<!-- // } -->
 
<!-- // $(document).ready(function(){ -->
<!-- //     commentList(); //페이지 로딩시 댓글 목록 출력  -->
<!-- // }); </script>-->
