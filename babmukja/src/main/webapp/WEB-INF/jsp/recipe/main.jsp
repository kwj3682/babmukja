<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/recipe/recipemain.css"/>">
    <script src="/js/jquery-3.2.1.min.js"></script>

</head>
<body>
    <div id="container">
        <div class="text">
            <div>이달의 레시피</div>
            <hr>
        </div>
        <div class="recipe">
            <img src="image/2.jpg">
        </div>
        <div class="profile">
            <span id="member">
                <div id="info">                    
                    <img src="image/cat.jpg"> 
                    <p>프로필 아이디</p>
                    <p>팔로워 100 팔로우 10</p>                    
                </div>
                <div id="content">
                    <p>1등한 레시피 내용들</p>
                </div>
                <div id="pic">
                    <div></div>
                    <div><img src="image/2.jpg"></div>
                    <div><img src="image/2.jpg"></div>
                    <div><img src="image/2.jpg"></div>
                    <div></div>
                </div>
            </span>
        </div>        
        <div class="month">
            <div>
                <img class="mem" src="image/dog1.png">
                <span>회원아이디</span>
                <img src="image/1.jpg">
            </div>
            <div>
                <img class="mem" src="image/dog1.png">
                <span>회원아이디</span>
                <img src="image/3.jpg">
            </div>
            <div>
                <img class="mem" src="image/dog1.png">
                <span>회원아이디</span>
                <img src="image/bab.jpg">
            </div>
            <div>
                <img class="mem" src="image/dog1.png">
                <span>회원아이디</span>
                <img src="image/jab.jpg">
            </div>
   
        </div> 
        <div class="text">
            <div>인기 키워드</div>
            <hr>
        </div>
        <div class="key">
            <div>
                <img src="image/1.jpg">
                <div id="text">#키워드</div>
            </div>
            <div>
                <img src="image/2.jpg">
                <div id="text">#키워드</div>
            </div>
            <div>
                <img src="image/3.jpg">
                <div id="text">#키워드</div>
            </div>
            <div>
                <img src="image/bab.jpg">
                <div id="text">#키워드</div>
            </div>
            <div>
                <img src="image/jab.jpg">
                <div id="text">#키워드</div>
            </div>
            <div>
                <img src="image/3.jpg">
                <div id="text">#키워드</div>
            </div>
            <div>
                <img src="image/bab.jpg">
                <div id="text">#키워드</div>
            </div>
            <div>
                <img src="image/2.jpg">
                <div id="text">#키워드</div>
            </div>
        </div>        
        <div class="text">
                <div>오늘의 레시피</div>
                <hr>
        </div>
        <div class="today">
            <div>
                <img class="mem" src="image/dog1.png">
                <span>회원아이디</span>
                <img src="image/2.jpg">   
                <a class="title" href="#">레시피 제목</a>            
            </div>
            <div>
                <img class="mem" src="image/dog1.png">
                <span>회원아이디</span>
                <img src="image/5.jpg">
                <a class="title" href="#">레시피 제목</a>
            </div>
            <div>
                <img class="mem" src="image/dog1.png">
                <span>회원아이디</span>
                <img src="image/6.jpg">
                <a class="title" href="#">레시피 제목</a>
            </div>
            <div>
                <img class="mem" src="image/dog1.png">
                <span>회원아이디</span>
                <img src="image/jab.jpg">
                <a class="title" href="#">레시피 제목</a>
            </div>
        </div>
        <div class="plus">
            <img src="image/plus.png">
            <a href="#">더보기</a>
        </div>
    </div>
</body>
</html>