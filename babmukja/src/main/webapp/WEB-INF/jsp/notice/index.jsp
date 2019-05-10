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
    <link rel="stylesheet" href="<c:url value="/resources/css/notice/notice index.css"/>">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <title>고객센터</title>
</head>
<body>
    <center><h1>밥먹자 고객센터</h1></center>
    <hr>
    <div class="inquiry">
        <table class="customer2">
            <tr>
                <td class="inquire3">자주묻는 질문</td>              
            </tr>
        </table>
        <div class="inquire2">
            <h3>리스트1</h3>
                 <div>
                     <p>리스트 답변1</p>
                 </div>
        </div>
        <div class="inquire2">
                <h3>리스트2</h3>
                <div>
                    <p>리스트 답변2</p>
                </div>
       </div>
       <div class="inquire2">
            <h3>리스트3</h3>
            <div>
                <p>리스트 답변3</p>
            </div>
    </div>
    <div class="inquire2">
        <h3>리스트4</h3>
        <div>
            <p>리스트 답변4</p>
        </div>
    </div>
         <div class="inquire">1:1문의하기</div>
         <div class="inquire">전화문의하기</div>
        <div>
            <p class="inlined"><a href="list.do">공지사항</a></p>
                <div class="inquire2">
                        <h3>리스트</h3>
                        <div>
            <p>리스트 답변</p>
                </div>
        </div>         
    </div> 
    <nav id="pageNav">
            <ul>
                <li><a href='detail.do'>1</a></li>
                <li><a href='#'>2</a></li>
                <li><a href='#'>3</a></li>
                <li><a href='#'>4</a></li>
                <li><a href='#'>5</a></li>
                <li><a href='#'>NEXT</a></li>
            </ul>
    </nav><br>
    <script>
            $(function() {
              $( ".inquire2" ).accordion({
                collapsible: true
              });
            } );        
    </script>
</body>
</html>