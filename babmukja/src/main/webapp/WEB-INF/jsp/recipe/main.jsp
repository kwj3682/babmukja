<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
            <img src="<c:url value="/resources/images/f2.jpg"/>"/>
            </div>
            <div class="swiper-slide">
                <div></div>
                <p>"자라보고 놀란 가슴 <br> 솥뚜껑 삼겹살로 달랜다."</p>
                <img src="<c:url value="/resources/images/f8.jpg"/>"/>
            </div>
            <div class="swiper-slide">
                <div></div>
            <p>"둘이 먹다 하나 죽었으면 좋겠다."</p>
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
                        <img src="<c:url value="/resources/images/f3.jpg"/>">
                        <div id="sticker2"></div>
                    </div>
                    <div id="monthrecipe-keyword">#퓨전요리</div>
                </div>
            </div>
            <div id="sec1-content2">
                <div id="sec1-content2-wrapper">
                    <div>만든 이 <span id="monthly-profile-wrapper"><img id="monthly-profile" src="<c:url value="/resources/images/profile15.jpg"/>"></span></div>
                    <div id="paragraph">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorem cum expedita libero unde quos nemo blanditiis molestias mollitia! Vitae deserunt minima accusantium, inventore magnam fuga doloribus dolorem illum dolorum debitis perferendis porro quasi, similique maxime? Eum, officiis nemo? Repellat, deserunt.</div>
                    <div>
                        <div>111111<img src="<c:url value="/resources/images/f3.jpg"/>"></div>
                        <div>22222<img src="<c:url value="/resources/images/food1.jpg"/>"></div>
                        <div>33333<img src="<c:url value="/resources/images/foodthumbnail7.jpg"/>"></div>
                        <div>더 보기 <b>↓</b><img id="bottle" src="<c:url value="/resources/images/bottle.png"/>"></div>
                    </div>
                    <div>- 주부9단빛찬맘 -</div>
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
				       		<div id="resultImage"></div>
				       		<img src="<c:url value="/resources/images/food1.jpg"/>">
				       		<img src="<c:url value="/resources/images/food2.jpg"/>">
				       		<img src="<c:url value="/resources/images/food3.jpg"/>">
				       		<img src="<c:url value="/resources/images/food4.jpg"/>">
				       		<img src="<c:url value="/resources/images/f1.jpg"/>">
				       		<img src="<c:url value="/resources/images/f2.jpg"/>">
				       		<img src="<c:url value="/resources/images/f3.jpg"/>">
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
        <div id="sector3">
            <div id="sector3-body">
                <div class="profile-container">
                    <div class="profile-pic-box">
                        <div>
                            <img class="profile-picture" src="<c:url value="/resources/images/profile16.jpg"/>">
                        </div>
                        <div class="profile-name">
                            <p>1분 전</p>
                            <p>
                                렁래쓰렁래
                            </p>
                        </div>
                    </div>
                    <div class="recipe-pic-box">
                        <img src="<c:url value="/resources/images/foodthumbnail3.jpg"/>"/>
                    </div>
                    <div class="recipe-info">
                        <i class="fas fa-heart fa-2x">50</i>
                        <i class="fas fa-scroll fa-2x">60</i>
                        <i class="fas fa-eye fa-2x">120</i>
                    </div>
                </div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
            </div>
            <div id="sector3-header"></div>
        </div>
    </div>
    
    <script src="<c:url value="/resources/js/dist/js/swiper.min.js"/>"></script>
    <script>
    $("#recipe-book1").click(function () {   
    	$("#resultImage").css({background:$(this).css("backgroundImage"),
    							backgroundSize: "cover",
    							backgroundRepeat : "no-repeat"});
    	$("#turnModal").modal("show");
    	$("#turnJsDiv").css(
            	"display", "block"                
    	); 
	    function loadApp() {
	    	$('#turnJs').turn({
	    			width : 700,
	    			height : 600,
	    			elevation : 50,
	    			gradients : true			
	    			/* autoCenter: true */
	    	});
	    }
	    loadApp();    	
    });
$('.next-button').bind($.mouseEvents.over, function() {
		
		$(this).addClass('next-button-hover');

	}).bind($.mouseEvents.out, function() {
		
		$(this).removeClass('next-button-hover');

	}).bind($.mouseEvents.down, function() {
		
		$(this).addClass('next-button-down');

	}).bind($.mouseEvents.up, function() {
		
		$(this).removeClass('next-button-down');

	}).click(function() {
		
		$('.magazine').turn('next');

	});

	// Events for the next button
	
	$('.previous-button').bind($.mouseEvents.over, function() {
		
		$(this).addClass('previous-button-hover');

	}).bind($.mouseEvents.out, function() {
		
		$(this).removeClass('previous-button-hover');

	}).bind($.mouseEvents.down, function() {
		
		$(this).addClass('previous-button-down');

	}).bind($.mouseEvents.up, function() {
		
		$(this).removeClass('previous-button-down');

	}).click(function() {
		
		$('.magazine').turn('previous');

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
    </script>
</body>
</html>