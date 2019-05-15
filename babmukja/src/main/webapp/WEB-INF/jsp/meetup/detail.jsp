<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value="/resources/css/meetup/meetup-detail.css"/>">
<title>Document</title>
</head>

</head>
<body>
	<div class="header">
		<div class="headerLeft">
			<div class=title>오늘은 내가 짜파게티 요리사</div>
			<div class="subInfo">
				<div class="infoTagContainer">
					<span class="infoTag">요일</span>
				</div>
				<div class="infoTagContainer">
					<span class="infoTag">지역</span>
				</div>
				<div class="infoTagContainer">
					<span class="infoTag">월회비</span>
				</div>
				<div class="infoTagContainer">
					<span class="infoTag">회원수</span>
				</div>
				<div class="subInfoPic">
					<i class="fas fa-user-shield fa-3x"></i>
				</div>
				<div class="subInfoPic">
					<i class="fas fa-map-marker-alt fa-3x"></i>
				</div>
				<div class="subInfoPic">
					<i class="fas fa-won-sign fa-3x"></i>
				</div>
				<div class="subInfoPic">
					<i class="fas fa-users fa-3x"></i>
				</div>
				<div class="tagBottom">월요일</div>
				<div class="tagBottom">부천,인천</div>
				<div class="tagBottom">10,000원</div>
				<div class="tagBottom">50명</div>

			</div>
			<div class="tag">#짜파게티 #치즈 짜파게티 #불닭 짜파게티</div>

		</div>
		<div class="headerRight">
			<div class="area">
				<img src="/image/cooking1.jpg" /> <img src="/image/cooking2.jpg" />
				<img src="/image/cooking3.jpg" />
			</div>
		</div>
	</div>

	<div class="tabContainer">
		<table class="selectTab">
			<tr>
				<td>모임소개</td>
				<td>모임공지</td>
				<td>자유게시판</td>
				<td>사진첩</td>
				<td>회원</td>
			</tr>
		</table>

		<div class="tabPanel" id="tabPanel1">
			<span class="writeIntro"> <i class="fas fa-plus-circle fa-3x"></i></span>

		</div>
		<div class="tabPanel">모임공지</div>
		<div class="tabPanel">자유게시판</div>
		<div class="tabPanel">사진첩</div>
		<div class="tabPanel">회원</div>
	</div>


	<script>

   
    
        $(".area").click(function () {
            $(".area").animate({ left: -600 }, 1000);
        });



        for (let i = 0; i <= 4; i++) {
        	let number = i;

            $("td:eq(" + number +")").click(function () {
            	
                $(`td`).css("background-color", "white");
                $(`td`).css("color", "black");
                $(".tabPanel").css("display", "none");
                $("td:eq(" + number +")").css("background-color", "#7db341");
                $("td:eq(" + number +")").css("color", "white");
                $(".tabPanel:eq(" + number +")").css("display", "block");

            });

        }//for


        for (let k = 0; k < 4; k++) {
				
        	console.log("k 시작 :" +k);
            $(".subInfo > .subInfoPic > i:eq(" + k + ")").mouseover(function () {

            	console.log("aaa : " + k);
            	$(".infoTag:eq(" + k + ")").addClass("pseudo");
            	console.log(k);

            });
            $(".subInfo > .subInfoPic > i:eq(" + k + ")").mouseleave(function () {

                $(".infoTag:eq(" + k + ")").removeClass("pseudo");



            });

        }//for
      //intro 를 넘겨 받아서...             
        var intro = `${intro}`;
        
        dataProcess();
      //save 눌렀을 때 데이터 처리
        /*  contentType: "text/xml;charset=utf-8", */
           $(document).on("click", "#introSave", function () {
                    alert($('#summernote').val() );
                   
                    var text =$('#summernote').val();
                    var encoded = encodeURIComponent(text)
                    $.ajax({
                  	  data: "data=" + encoded,
                  	  type: "POST",
                  	  url: '/babmukja/meetup/updateIntro.do',
                  	  enctype: 'multipart/form-data',
                  	  success: function(data) {
                  		  
                  		  $("#tabPanel1").html(`<div class="editDelete"><div id="introEdit">수정</div><div id="introDelete">삭제</div>` + data);
                  	  }
                  	  });
                 
                     }); //save 끝
        
                 	//수정을 눌렀을 때
                   	 $(document).on("click", "#introEdit", function () {	
                  	
                   		 $.ajax({ 
                         	  url: '/babmukja/meetup/editIntro.do',
                         	  enctype: 'multipart/form-data',
                         	  success: function(data) {
                         		 $("#tabPanel1").html(`
                                     	<div class="saveReturn"><div id="introReturn">돌아가기</div><div id="introSave">저장</div><div id="introHeader" >모임을 소개해 주세요~^^</div><div>
                                         <textarea id="summernote" name="editordata">`+data+`</textarea>`
                                         );
                         	  }
                         	  });
                   		 
                   	
                       
                          });

                     
                            $(document).on("mouseover", document, function () {
                              $('#summernote').summernote({
                                  height: 500,                 // set editor height
                              	minHeight: null,             // set minimum height of editor
                                  maxHeight: null,             // set maximum height of editor
                                  focus: true                  // set focus to editable area after initializing summernote
                    
                              }); 
                              
                   		 
                   	 });
                   		  //수정 끝 
                   		  
                     //return 을 눌렀을때
             	  
                     $(document).on("click", "#introReturn", function () {
             	  
                    	  dataProcess();
                     
                     });
        	
                   		  //삭제를 눌렀을때
                     $(document).on("click", "#introDelete", function () {
                    	   $.ajax({
                           	
                           	  url: '/babmukja/meetup/deleteIntro.do',
                           	  enctype: 'multipart/form-data',
                           	  success: function(data) {
                           		  
                           		  $("#tabPanel1").html(`<span class="writeIntro"> </span>`);
                           	  }
                           	  });  
                    	 
                     });
        
                   		  
                   		  
             function dataProcess(){      		  
                   		  
             if(intro ==""){ // intro가 null 이 아니면 등록 폼 버튼 을 불러준다
    
        	
        	console.log("intro가 null 입니다.");
        	  
        	
        	   $(document).on("click", ".writeIntro", function () {
                  $("#tabPanel1").html(`
                	<div class="saveReturn"><div id="introReturn">돌아가기</div><div id="introSave">저장</div><div id="introHeader" >모임을 소개해 주세요~^^</div><div>
                    <textarea id="summernote" name="editordata"></textarea>
                     `);
              });
	

                $(document).on("mouseover", document, function () {
                  $('#summernote').summernote({

                      height: 500,                 // set editor height
                  	minHeight: null,             // set minimum height of editor
                      maxHeight: null,             // set maximum height of editor
                      focus: true                  // set focus to editable area after initializing summernote
        
                  }); 
               
              
              });
              
           	 
        }else{ //null 이 아니면 원래 자료를 뿌려준다.
        	console.log("intro 는 :" +intro +"정래");
        	console.log("intro가 null 이 아닙니다.");
        	 $("#tabPanel1").html(`<div class="editDelete"><div id="introEdit">수정</div><div id="introDelete">삭제</div>` + `${intro}`);
  	  
              
        
        
        }//else
        
       
             }
             
          
      
        

    
 
       
    </script>



</body>
</html>