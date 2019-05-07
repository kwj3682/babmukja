<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<c:url value="/resources/css/recipe/recipemain.css"/>">    
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="/js/jquery-3.2.1.min.js"></script>
    <title>Document</title>

</head>
<body>
    <div class="container">
        <div id="tit">           
           <input id="title" type="text" name="title" placeholder="제목을 입력해주세요">
        </div>
        <div id="con">
            <div id="video">
                <div>
                    <button style="font-size:40px;color:white;">+</button>                
                </div>
                <div id="plus">
                    메인동영상 추가하기
                </div>
            </div>
            <div id="pic">
                <div>
                    <button style="font-size:40px;color:white;">+</button>  
                </div>
                <div id="plus">
                        메인사진 추가하기
                </div>
            </div>
            <div class="text">                
                <textarea name="content" class="content" cols="30" rows="10" placeholder="내용을 입력해주세요."></textarea>
                <div class="attachresult"></div>
                <div class="image">
                    <input type="file" class="attach" name="attach">
                </div>
            </div>
            <div class="add">
                    <div>
                        <button class="addcontent">+</button>
                    </div>
                    <div class="plus">
                            내용 추가하기
                    </div>
            </div>
            
            <div id="addresult"></div>
            <div class="circle">
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
            </div>

            <div class="tag">
                <div>
                    <span class="icon"><i class="fa fa-search"></i></span>
                    <input type="text" id="hash" name="hash" placeholder="#태그명(최대 5개)">
                </div>
            </div>
            </div>
        </div>
    
<script>
    $(".addcontent").click(function () {
        $(".text").append(
            '<textarea name="content" class="content" cols="30" rows="10" placeholder="내용을 입력해주세요."></textarea>'
            +    '<div class="attachresult"></div>'
            +    '<div class="image">'
            +    '<input type="file" class="attach" name="attach">'
            +    '</div>'
        );
    });
</script>
</body>
</html>