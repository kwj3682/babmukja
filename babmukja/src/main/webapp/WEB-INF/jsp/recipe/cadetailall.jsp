<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/resources/js/slider/slider-radio.css"/>">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link rel="stylesheet" href="<c:url value="/resources/css/recipe/selectbox.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/recipe/recipeCaDetail.css"/>">
    <script src="<c:url value="/resources/js/slider/slider-radio.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
    <title>Document</title>

</head>
<body>               
    <div id="main-body">    
    <!-- 검색 부분 -->
   <div id="selectBoxSelector"><p>검색 조건을 선택해주세요<i id="fa-arrow" class="fas fa-caret-down"></i></p><i id="submitBtn" class="fa fa-search fa-2x"></i></div>
   <div id="selectBox-wrapper">
            <form name="searhForm" method="get" action="cadetailall.do">
       <div id="selectBox">
            <div class="selectmenuContent">
                <img src="<c:url value="/resources/images/icons/title.png"/>">    
                <div class="selectmenuContent-detail">제목
                    <div class="hiddenMenu">
                        <input type="text" name="searchTitle"<c:if test="${param.searchTitle != '' || param.searchTitle != null}">value="${param.searchTitle }"</c:if>><span class="search-icon"></span>
                    </div>  
                </div>
                <div class="selectmenuContentFold"><i class="fas fa-chevron-right"></i></div>
            </div>
            
            <div class="selectmenuContent">
                <img src="<c:url value="/resources/images/icons/nickname.png"/>">  
                <div class="selectmenuContent-detail">닉네임     
                    <div class="hiddenMenu">
                        <input type="text" name="searchNickname" <c:if test="${param.searchNickname != '' || param.searchNickname != null}">value="${param.searchNickname }"</c:if>><span class="search-icon"></span>
                    </div>  
                </div>
                <div class="selectmenuContentFold"><i class="fas fa-chevron-right"></i></div>
            </div>

            <div class="selectmenuContent">
                <img src="<c:url value="/resources/images/icons/warning.png"/>">   
                <div class="selectmenuContent-detail">주의사항
                    <div class="hiddenMenu">
                        <input type="checkbox" id="pregnant" name="caution" value="7" <c:if test="${caution7 == 7}">checked</c:if>>
                        <label for="pregnant">임산부 주의</label>
                        <input type="checkbox" id="baby" name="caution" value="8" <c:if test="${caution8 == 8}">checked</c:if>>
                        <label for="baby">영유아 주의</label>
                        <input type="checkbox" id="high-blood-pressure" name="caution" value="9" <c:if test="${caution9 == 9}">checked</c:if>>
                        <label for="high-blood-pressure">고혈압 주의</label>
                        <input type="checkbox" id="vegan" name="caution" value="10" <c:if test="${caution10 == 10}">checked</c:if>>
                        <label for="vegan">채식주의자를 위한</label>
                        <br><input type="checkbox" id="halal" name="caution" value="11" <c:if test="${caution11 == 11}">checked</c:if>>
                        <label for="halal">돼지고기 포함</label>
                        <input type="checkbox" id="old" name="caution" value="12" <c:if test="${caution12 == 12}">checked</c:if>>
                        <label for="old">노약자 주의</label>
                        <input type="checkbox" id="allergic" name="caution" value="13" <c:if test="${caution13 == 13}">checked</c:if>>
                        <label for="allergic">알러지 유발 주의</label>
                        <input type="checkbox" id="diabetes" name="caution" value="14" <c:if test="${caution14 == 14}">checked</c:if>>
                        <label for="diabetes">당뇨 주의</label>
                        
                    </div>
                </div>
                <div class="selectmenuContentFold"><i class="fas fa-chevron-right"></i></div>
            </div>
            
            <div class="selectmenuContent">
                <img src="<c:url value="/resources/images/icons/giftbox.png"/>">  
                <div class="selectmenuContent-detail">상황
                    <div class="hiddenMenu">
                        <input type="radio" id="overnight" name="situation" value="15" <c:if test="${param.situation == 15}">checked</c:if>><label for="overnight">야식</label> 
                        <input type="radio" id="homeparty" name="situation" value="16" <c:if test="${param.situation == 16}">checked</c:if>><label for="homeparty">홈파티</label>
                        <input type="radio" id="birthday" name="situation" value="17" <c:if test="${param.situation == 17}">checked</c:if>><label for="birthday">생일</label> 
                        <input type="radio" id="anniversary" name="situation" value="18" <c:if test="${param.situation == 18}">checked</c:if>><label for="anniversary">기념일</label>
                        <input type="radio" id="drinkalone" name="situation" value="19" <c:if test="${param.situation == 19}">checked</c:if>><label for="drinkalone">혼술</label>
                        <input type="radio" id="eatalone" name="situation" value="20" <c:if test="${param.situation == 20}">checked</c:if>><label for="eatalone">혼밥</label> 
                        <input type="radio" id="coupledate" name="situation" value="21" <c:if test="${param.situation == 21}">checked</c:if>><label for="coupledate">데이트</label>
                        <input type="radio" id="snack" name="situation" value="22" <c:if test="${param.situation == 22}">checked</c:if>><label for="snack">간식</label> <br>
                        <input type="radio" id="wholetable" name="situation" value="23" <c:if test="${param.situation == 23}">checked</c:if>><label for="wholetable">한상차림</label>
                        <input type="radio" id="dinner" name="situation" value="24" <c:if test="${param.situation == 24}">checked</c:if>><label for="dinner">저녁</label>
                        <input type="radio" id="lunch" name="situation" value="25" <c:if test="${param.situation == 25}">checked</c:if>><label for="lunch">점심</label> 
                        <input type="radio" id="breakfast" name="situation" value="26" <c:if test="${param.situation == 26}">checked</c:if>><label for="breakfast">아침</label> 
                        <input type="radio" id="picnic" name="situation" value="27" <c:if test="${param.situation == 27}">checked</c:if>><label for="picnic">피크닉</label>
                    </div>
                </div>
                <div class="selectmenuContentFold"><i class="fas fa-chevron-right"></i></div>
            </div>

            <div class="selectmenuContent">
                <img src="<c:url value="/resources/images/icons/graph.png"/>">  
                <div class="selectmenuContent-detail">난이도
                    <div class="hiddenMenu">
                        <input type="radio" id="veryeasy" name="level" value="28" <c:if test="${param.level == 28}">checked</c:if>><label for="veryeasy">매우 쉬움</label>
                        <input type="radio" id="easy" name="level" value="29" <c:if test="${param.level == 29}">checked</c:if>><label for="easy">쉬움</label>
                        <input type="radio" id="normal" name="level" value="30" <c:if test="${param.level == 30}">checked</c:if>><label for="normal">보통</label>
                        <input type="radio" id="hard" name="level" value="31" <c:if test="${param.level == 31}">checked</c:if>><label for="hard">어려움</label>
                        <input type="radio" id="veryhard" name="level" value="32" <c:if test="${param.level == 32}">checked</c:if>><label for="veryhard">매우 어려움</label>
                    </div>
                </div>
                <div class="selectmenuContentFold"><i class="fas fa-chevron-right"></i></div>
            </div>

            <div class="selectmenuContent">
                <img src="<c:url value="/resources/images/icons/meal.png"/>">  
                <div class="selectmenuContent-detail">조리시간
                    <div class="hiddenMenu">
                        <input type="radio" id="five" name="taketime" value="33" <c:if test="${param.time == 33}">checked</c:if>><label for="five">5분 이내</label>
                        <input type="radio" id="fifteen" name="taketime" value="34" <c:if test="${param.time == 34}">checked</c:if>><label for="fifteen">15분 이내</label>
                        <input type="radio" id="thirty" name="taketime" value="35" <c:if test="${param.time == 35}">checked</c:if>><label for="thirty">30분 이내</label>
                        <input type="radio" id="hour" name="taketime" value="36" <c:if test="${param.time == 36}">checked</c:if>><label for="hour">1시간 이내</label>
                        <input type="radio" id="overhour" name="taketime" value="37" <c:if test="${param.time == 37}">checked</c:if>><label for="overhour">1시간 초과</label>
                    </div>
                </div>
                <div class="selectmenuContentFold"><i class="fas fa-chevron-right"></i></div>
            </div>

            <div class="selectmenuContent">
                <img src="<c:url value="/resources/images/icons/dish.png"/>">  
                <div class="selectmenuContent-detail">종류
                    <div class="hiddenMenu">
                        <input type="radio" id="koreansoup" name="foodtype" value="38" <c:if test="${param.type == 38}">checked</c:if>><label for="koreansoup">국/탕류</label>
                        <input type="radio" id="jjigae" name="foodtype" value="39" <c:if test="${param.type == 39}">checked</c:if>><label for="jjigae">찌개</label>
                        <input type="radio" id="sidedish" name="foodtype" value="40" <c:if test="${param.type == 40}">checked</c:if>><label for="sidedish">반찬</label>
                        <input type="radio" id="noodle" name="foodtype" value="41" <c:if test="${param.type == 41}">checked</c:if>><label for="noodle">면</label>
                        <input type="radio" id="dumpling" name="foodtype" value="42" <c:if test="${param.type == 42}">checked</c:if>><label for="dumpling">만두</label>
                        <input type="radio" id="rice" name="foodtype" value="43" <c:if test="${param.type == 43}">checked</c:if>><label for="rice">밥</label>
                        <input type="radio" id="salad" name="foodtype" value="44" <c:if test="${param.type == 44}">checked</c:if>><label for="salad">샐러드</label>
                        <input type="radio" id="soup" name="foodtype" value="45" <c:if test="${param.type == 45}">checked</c:if>><label for="soup">스프</label><br>
                        <input type="radio" id="beverage" name="foodtype" value="46" <c:if test="${param.type == 46}">checked</c:if>><label for="beverage">음료</label>
                        <input type="radio" id="bread" name="foodtype" value="47" <c:if test="${param.type == 47}">checked</c:if>><label for="bread">빵/디저트</label>
                        <input type="radio" id="hardboiled" name="foodtype" value="48" <c:if test="${param.type == 48}">checked</c:if>><label for="hardboiled">조림</label>
                        <input type="radio" id="easymixed" name="foodtype" value="49" <c:if test="${param.type == 49}">checked</c:if>><label for="easymixed">무침</label>
                        <input type="radio" id="hardmixed" name="foodtype" value="50" <c:if test="${param.type == 50}">checked</c:if>><label for="hardmixed">비빔</label>
                        <input type="radio" id="steamed" name="foodtype" value="51" <c:if test="${param.type == 51}">checked</c:if>><label for="steamed">찜</label>
                        <input type="radio" id="pickled" name="foodtype" value="52" <c:if test="${param.type == 52}">checked</c:if>><label for="pickled">절임</label>
                        <input type="radio" id="fried" name="foodtype" value="53" <c:if test="${param.type == 53}">checked</c:if>><label for="fried">튀김</label><br>
                        <input type="radio" id="boiled" name="foodtype" value="54" <c:if test="${param.type == 54}">checked</c:if>><label for="boiled">삶기</label>
                        <input type="radio" id="cooked" name="foodtype" value="55" <c:if test="${param.type == 55}">checked</c:if>><label for="cooked">굽기</label>
                        <input type="radio" id="blanch" name="foodtype" value="56" <c:if test="${param.type == 56}">checked</c:if>><label for="blanch">데치기</label>
                        <input type="radio" id="row" name="foodtype" value="57" <c:if test="${param.type == 57}">checked</c:if>><label for="row">회</label>
                        <input type="radio" id="foodtypeetc" name="foodtype" value="58" <c:if test="${param.type == 58}">checked</c:if>><label for="foodtypeetc">기타</label>
                    </div>
                </div>
                <div class="selectmenuContentFold"><i class="fas fa-chevron-right"></i></div>
            </div>
        </div>
             </form>
   </div> 
   
    <!-- 레시피 목록 부분 -->
	    <div class="boundary"></div>  
	    <div class="chalkheader"></div>
	    
	        <div id="sector3-mid">
	        </div>
	        <div id="sector3">
	            <div id="sector3-body">   
	            	<c:if test="${empty calist}">
	            		<p class="no-search">검색결과가 존재하지 않습니다.</p>  
	            	</c:if>      
	                <c:forEach var="ca" items="${calist }">  	                
	                <input type="hidden" name="pageNo" value="${param.pageNo }">             
	                   <div class="profile-container">
	                       <div class="profile-pic-box">
	                           <div>
	                           <c:choose>
				                	<c:when test="${ca.memImgPath == null}">
				                    	<img class="profile-picture" src="<c:url value="/resources/images/default/userdefault.png"/>">					                	
				                	</c:when>
				                	<c:otherwise>					                	
				                    	<img class="profile-picture" src="${pageContext.request.contextPath}/member/download.do?path=${ca.memImgPath}&sysname=${ca.memImgSysname}">
				                	</c:otherwise>
		                		</c:choose>
	                           </div>
	                           <div class="profile-name">
	                               <p>
			                    	  <span>평점 : <fmt:formatNumber value="${ca.rating }" pattern="#.##"/></span>
	                           <br>
	                                  ${ca.title}
	                           <br>
	                                  ${ca.memNickname}
	                               </p>
	                           </div>
	                       </div>
	                       <div class="recipe-pic-box">
	                           <a href = "detail.do?no=${ca.recipeNo }">
		                           <c:choose>
					                	<c:when test="${ca.imgPath == '' || ca.imgPath == null}">
					                    	<img src="<c:url value="/resources/images/default.png"/>">				                	
					                	</c:when>
					                	<c:otherwise>					                	
				                           <img src="${ca.imgPath}">
					                	</c:otherwise>
			                		</c:choose>
		                		</a>
	                       </div>
	                       <div class="recipe-info">
	                           <i class="fas fa-heart fa-2x">${ca.likeCnt }</i>
	                           <i class="fas fa-scroll fa-2x">${ca.scrapCnt }</i>
	                           <i class="fas fa-eye fa-2x">${ca.viewCnt }</i>
	                       </div>
	                   </div>
	               </c:forEach>	                
	            </div>
	            <div id="sector3-header"></div>
	        </div>
	    </div>
	
    <script>
	    let arrow = $("#fa-arrow");
		let $selectBoxSelector = $("#selectBoxSelector");
    	let $selectBoxWrapper = $("#selectBox-wrapper");
		let offLeft = $selectBoxSelector.offset().left;
		
		
        $("#submitBtn").css({
        	position: "absolute",
        	top: 15,
        	left: 220
        });
        $selectBoxWrapper.css({
        	position: "fixed",
        	top: 55,
        	left: offLeft
        });
    	let openFlag = false;
	    $selectBoxSelector.click(function(e){
	    	if(!openFlag){
	    		openFlag = true;
	    	}else{	    		
	    		openFlag = false;
	    		$(".selectmenuContent").children(".selectmenuContentFold").children().attr({class:"fas fa-chevron-right"});
	    	}
	        $selectBoxWrapper.slideToggle(150);

	        if(arrow.attr("class") == "fas fa-caret-down") arrow.attr({class : "fas fa-caret-up"});
	        else{
	            arrow.attr({class : "fas fa-caret-down"});
	            $(".selectmenuContent").css({width:"190px"});
	            $(".selectmenuContent").find(".hiddenMenu").css({display:"none"});
	        } 
	    });
	    $(".selectmenuContent").click(function(){
	        let $this = $(this);
	        let $hiddenMenu = $this.children(".selectmenuContent-detail").children();
	        let $fold = $this.children(".selectmenuContentFold");
	        
	        if($this.width() < 220){
	            $this.animate({width: "700px"},180);
	            setTimeout(function(){
	                $hiddenMenu.css({display:"inline-block"});
	            }, 200);
	            $fold.children().attr({class:"fas fa-chevron-left"});
	        }
	        $fold.click(function(){
	            if($hiddenMenu.css("display") == 'none'){
	                return;
	            }
	            $this.animate({width: "190px"},180);
	            $hiddenMenu.css({display:"none"});
	            $fold.children().attr({class:"fas fa-chevron-right"});
	        });
	    });
    
         $("#submitBtn").click(function () {
        		 $("form[name='searhForm']").submit();
         });
         
      // 무한스크롤
         let pageNo = 0;
         $(window).scroll( 
           function () {
             let sh = $(window).scrollTop() + $(window).height();
             let dh = $(document).height(); 
            
             if(sh >= dh-10) {
            	 
               pageNo = pageNo+12;
		       let cautions = [];
		       $("input[name='caution']:checked").each(function(){
		       	 cautions.push($(this).val());
		       });
		       
		       let data = {
		    		   pageNo : pageNo,
		    		   searchTitle : $("input[name='searchTitle']").val(),
		    		   searchNickname : $("input[name='searchNickname']").val(),
	                   caution : cautions,
	                   situation : $("input[name='situation']:checked").val(),
	                   level : $("input[name='level']:checked").val(),
	                   time : $("input[name='taketime']:checked").val(),
	                   type : $("input[name='foodtype']:checked").val()
		       }
		       console.log(data);
               
               $.ajax({               
		                data : data,
		                url : "cadetailAllScroll.do"
         
               }).done(function (result) {            	   
            	   if(result.length != 0) {
             			 let html = "";
               		 for(let i = 0 ; i < result.length ; i ++) {
               			 html += '<div class="profile-container">'
      	                        + '<div class="profile-pic-box">'
	                           	+ '<div>'
	                           	
                   		 if(result[i].memImgPath == null || result[i].memImgPath == "") {
                   			html += '<img class="profile-picture" src="<c:url value="/resources/images/default/userdefault.png"/>">';				                	
                   		 } else {
                   			html += '<img class="profile-picture" src="${pageContext.request.contextPath}/member/download.do?path='+ result[i].memImgPath + '&sysname='+ result[i].memImgSysname+ '">';
                   		 }
	                        html += `</div>
	                        			<div class="profile-name">
	                               			<p>
			                    	  			<span>평점 :` + result[i].rating + ` </span>
	                          			 <br>
	                              			 ` +  result[i].title + `
	                          			 <br>
	                               			 ` +  result[i].memNickname + `
	                               			</p>
	                           			</div>
	                       			</div>
			                        <div class="recipe-pic-box">
			                           <a href = "detail.do?no=` + result[i].recipeNo + `">`;
			                           
                           if(result[i].imgPath == null || result[i].imgPath == "") {
                   			html += '<img src="<c:url value="/resources/images/default.png"/>"></a>';				                	
                   		  } else {
                   			html += '<img src="'+ result[i].imgPath + '"></a>';
                   		  }
			                html += `</div>
			                        <div class="recipe-info">
			                           <i class="fas fa-heart fa-2x">` + result[i].likeCnt + `</i>
			                           <i class="fas fa-scroll fa-2x">` + result[i].scrapCnt + `</i>
			                           <i class="fas fa-eye fa-2x">` + result[i].viewCnt + `</i>
			                        </div>
			                    </div>`;
               			 
               		 	}
                        	 $("#sector3-body").append(html);
                 	} 
            	  
              }).fail(function(xhr){	               
	               console.dir(xhr);
              })
             }
           });

    </script>
</body>
</html>