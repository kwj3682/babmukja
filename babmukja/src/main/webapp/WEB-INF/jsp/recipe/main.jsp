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
    <title>밥먹자 레시피</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/recipe/recipemain.css"/>">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/js/dist/css/swiper.min.css"/>">
    <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/modernizr.2.5.3.min.js"/>"></script>
   <script type="text/javascript" src="<c:url value="/resources/js/hash.js"/>"></script>
   <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
   <script type="text/javascript" src="<c:url value="/resources/js/turn.min.js"/>"></script>
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
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
            <div></div>
            <p>"BABMUKJA RECIPE"</p>
            <c:choose>
            	<c:when test="${sessionScope.user ne null}">
		          <div id="writeform-button" onclick="location.href='writeform.do'">레시피 작성하러가기</div>	            	
            	</c:when>
            	<c:otherwise>
		          <div class="writeno-button">레시피 작성하러가기</div>	  
            	</c:otherwise>
            </c:choose>
            <img src="<c:url value="/resources/images/f2.jpg"/>"/>
            </div>
            
            <div class="swiper-slide">
                <div></div>
                <p>"자라보고 놀란 가슴 <br> 솥뚜껑 삼겹살로 달랜다."</p>
              <c:choose>
            	<c:when test="${sessionScope.user ne null}">
		          <div id="writeform-button" onclick="location.href='writeform.do'">레시피 작성하러가기</div>	            	
            	</c:when>
            	<c:otherwise>
		          <div class="writeno-button">레시피 작성하러가기</div>	  
            	</c:otherwise>
            </c:choose>                
                <img src="<c:url value="/resources/images/f8.jpg"/>"/>
            </div>
            
            <div class="swiper-slide">
                <div></div>
            <p>"둘이 먹다 하나 죽었으면 좋겠다."</p>
           <c:choose>
            	<c:when test="${sessionScope.user ne null}">
		          <div id="writeform-button" onclick="location.href='writeform.do'">레시피 작성하러가기</div>	            	
            	</c:when>
            	<c:otherwise>
		          <div class="writeno-button">레시피 작성하러가기</div>	  
            	</c:otherwise>
            </c:choose>
            <img src="<c:url value="/resources/images/f7.jpg"/>"/>
            </div>
            
        </div>
        <!-- Add Scrollbar -->
        <div class="swiper-scrollbar"></div>
        
    </div>
    <div id="main-body">
        <div id="sector1">
            <div id="sec1-content1">
                <div id="sec1-content1-wrapper">
                    <div>"이달의 레시피"</div>
                    <div>
                        <div id="sticker"></div>
                        	<a href="detail.do?no=${win.recipeNo }"><img src="${win.imgPath }"></a> 
                        <div id="sticker2"></div>
                    </div>                    
                    <div id="monthrecipe-keyword">#${win.keyword}</div>
                </div>
            </div>
            <div id="sec1-content2">
                <div id="sec1-content2-wrapper">
                    <div>만든 이 
                    	<span id="monthly-profile-wrapper">
                    	<c:choose>
		                	<c:when test="${win.memImgPath == null}">
		                    	<img id="monthly-profile" src="<c:url value="/resources/images/default/userdefault.png"/>">					                	
		                	</c:when>
		                	<c:otherwise>					                	
		                    	<img id="monthly-profile" src="${pageContext.request.contextPath}/member/download.do?path=${win.memImgPath}&sysname=${win.memImgSysname}">
		                	</c:otherwise>
	                	</c:choose>
                    	</span>
                    </div>
                    <div id="paragraph">
                    	<c:forEach var="c" items="${comment }">
	                    	<p>${c.content}</p> - ${c.memNickname} -                    	
                    	</c:forEach>
                    </div>
                    <div>
                <c:forEach var="w" items="${winner }">
                        <div>${w.title }<br><a href="detail.do?no=${w.recipeNo }"><img src="${w.imgPath }"></a></div>    
                 </c:forEach>
                        <div>더 보기 <b>↓</b>
                        	<img id="bottle" src="<c:url value="/resources/images/bottle.png"/>">
                        </div>
                    </div>
                    <div>${win.memNickname }</div>
                </div>
            </div>
        </div>
        
        <div class="boundary"></div>
        <div id="sector2">
            <div id="sector2-header">
                <div></div>
                <div>
                       인기 키워드
                </div>
                <div></div>
               <input type="hidden" name="countryrank" value="${countryrank}">
               <input type="hidden" name="situationrank" value="${situationrank}">
               <input type="hidden" name="levelrank" value="${levelrank}">
               <input type="hidden" name="typerank" value="${typerank}">
            </div>
            <div id="sector2-body">
                   <div id="recipe-book-container">
                    <div id="recipe-book1" class="recipe-book"></div>
                    <div id="recipe-book2" class="recipe-book"></div>
                    <div id="recipe-book3" class="recipe-book"></div>
                    <div id="recipe-book4" class="recipe-book"></div>
                    <p>밥먹자 레시피<br> 키워드로 원하는 레시피를 찾아보세요!</p>
                    
                </div>

            </div>
        </div>
         <!-- modal -->
    <div id="turnModal" class="modal fade" tabindex="-1" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">x</button>       
                    <p>인기 키워드 1</p>       
                </div>
                <div class="modal-body">
                    <div id="turnJsDiv">
                      <div id="turnJs">
                         <div ignore="1" class="next-button"></div>
                         <div class="hard" id="resultImage"></div>
                         
                         <div class="pageX" id="page1">
<%--                             <img src="<c:url value="/resources/images/food1.jpg"/>"> --%>
                         </div>
                         <div class="pageX" id="page2">
<%--                             <img src="<c:url value="/resources/images/food2.jpg"/>"> --%>
                         </div>
                         <div class="pageX" id="page3">
<%--                             <img src="<c:url value="/resources/images/food3.jpg"/>"> --%>
                         </div>
                         <div class="pageX" id="page4">
<%--                             <img src="<c:url value="/resources/images/food4.jpg"/>"> --%>
                         </div>
<!--                          <div> -->
<%--                             <img src=" <c:url value="/resources/images/f1.jpg"/>"> --%>
<!--                          </div> -->
<!--                          <div> -->
<%--                             <img src="<c:url value="/resources/images/f2.jpg"/>">                          --%>
<!--                      </div> -->
<!--                          <div class="hard"> -->
<%--                             <img src="<c:url value="/resources/images/f3.jpg"/>">                          --%>
<!--                      </div> -->
                         <div ignore="1" class="previous-button"></div>
                      </div>
                </div>
                </div>
                <div class="modal-footer">
                    
                </div>
            </div>
        </div>
    </div>    
       
        <div class="boundary"></div>
        <div id="sector3-mid">
        </div>
        <div id="sector3">
            <div id="sector3-body">
            
               <c:forEach var="list" items="${recipe}">
               
                   <div class="profile-container">
                       <div class="profile-pic-box">
                           <div>
	                           <c:choose>
				                	<c:when test="${list.memImgPath == null}">
				                    	<img class="profile-picture" src="<c:url value="/resources/images/default/userdefault.png"/>">					                	
				                	</c:when>
				                	<c:otherwise>					                	
				                    	<img class="profile-picture" src="${pageContext.request.contextPath}/member/download.do?path=${list.memImgPath}&sysname=${list.memImgSysname}">
				                	</c:otherwise>
		                		</c:choose>
                           </div>
                           <div class="profile-name">
                               <p>   
                            <fmt:formatDate value="${list.regDate}" pattern="yyyy.MM.dd" />
                           <br>
                                  ${list.title}
                           <br>
                                  ${list.memNickname}
                               </p>
                           </div>
                       </div>
                       <div class="recipe-pic-box">
                           <a href = "detail.do?no=${list.recipeNo }">
                            <c:choose>
			                	<c:when test='${list.imgPath == "" || list.imgPath == null}'>
			                    	<img src="<c:url value="/resources/images/default.png"/>">					                	
			                	</c:when>
			                	<c:otherwise>					                	
		                           	<img src="${list.imgPath}">
			                	</c:otherwise>
	                		</c:choose>
                           	</a>
                       </div>
                       <div class="recipe-info">
                           <i class="fas fa-heart fa-2x">${list.likeCnt }</i>
                           <i class="fas fa-scroll fa-2x">${list.scrapCnt }</i>
                           <i class="fas fa-eye fa-2x">${list.viewCnt }</i>
                       </div>
                   </div>
               </c:forEach>
                
            </div>
            <div id="sector3-header"></div>
        </div>
    </div>
    
    <script src="<c:url value="/resources/js/dist/js/swiper.min.js"/>"></script>
    <script>    
    $("#bottle").click(function () {
    	location.href = "<c:url value='/member/mypage.do?memNickname=${win.memNickname}'/>";
    });
    
	$(".writeno-button").click(function (){
		alert("로그인 후 이용가능합니다.")
	});
    function loadApp(id) {
       if (!$(id).turn("is")) {
          
          $(id).turn({
             width : 1000,
             height : 700,
             elevation : 50   
          });
       }
    }    
    // 레시피 메인  - turn.js 적용부분
    $("#recipe-book1").click(function () {   
       $("#resultImage").css({background:$(this).css("backgroundImage"),
         backgroundSize: "cover",
         backgroundRepeat : "no-repeat"});
      console.log("키 랭크 값 : " + $("input[name='countryrank']").val());
       $.ajax({
          type:"GET",
          url: "recipekeyword.do",
          data:{
             keywordNo : $("input[name='countryrank']").val()
             }
       }).done(function(response){
          let html = '<div ignore="1" class="next-button"></div><div class="hard" id="resultImage"></div>';
          

         let i = 1;
          for(let res of response){
             console.log("res : " + res);
//              html +="<div id='page"+i+"' class='pageX'></div>";
//              console.log("page : " + i);
              let editor = new EditorJS({
                  holderId: 'page'+i,
                  autofocus: false,
                  data: JSON.parse(res.content),
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
              i++;
          }
//           html+= '<div ignore="1" class="previous-button"></div>';
//           $("#turnJs").append(html);
       });


      $("#turnModal").modal("show");      
      
      $("#turnJsDiv").css(
      "display", "block"                
      ); 
      
       loadApp("#turnJs");       
       
    });
    

    $(document).ready(function () {
       $("#turnModal").modal("hide");
    });
//    $("#turnModal").modal({
//          backdrop: 'static'
//     });


   // modal 창 이전버튼
   
   $('.previous-button').bind($.mouseEvents.over, function() {
      
      $(this).addClass('previous-button-hover');

   }).bind($.mouseEvents.out, function() {
      
      $(this).removeClass('previous-button-hover');

   }).bind($.mouseEvents.down, function() {
      
      $(this).addClass('previous-button-down');

   }).bind($.mouseEvents.up, function() {
      
      $(this).removeClass('previous-button-down');

   }).click(function() {      
      $('#turnJs').turn('previous');

   });
   
   // modal 창 다음 버튼
   $('.next-button').bind($.mouseEvents.over, function() {
         
         $(this).addClass('next-button-hover');
   
      }).bind($.mouseEvents.out, function() {
         
         $(this).removeClass('next-button-hover');
   
      }).bind($.mouseEvents.down, function() {
         
         $(this).addClass('next-button-down');
   
      }).bind($.mouseEvents.up, function() {
         
         $(this).removeClass('next-button-down');
   
      }).click(function() {
         
         $('#turnJs').turn('next');
   
      });

        var swiper = new Swiper('.swiper-container', {
            loop:true,
            autoplay: {
            delay: 4500,
            disableOnInteraction: false,
            },
            scrollbar: {
            el: '.swiper-scrollbar',
            hide: true,
            },
        });
        $(".ranking").click(function(){
    
            $(this).animate({width: 900},600);
        }).mouseleave(function(){
            $(this).animate({width: 40},600);
        });
        
        $("#logout").click(function() {
           alert("로그아웃 성공!");
        });

    </script>
</body>
</html>