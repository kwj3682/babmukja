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
    <link rel="stylesheet" href="<c:url value="/resources/css/admin/adminmember.css"/>">
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <title>회원 관리</title>
</head>
<body>

    <div id="main">
        <div id="main-header">
            <h2>회원 관리</h2>
            <div id="member-search">
                <div id="member-search-header">멤버 조회</div>
                <div id="member-search-input">
                    <div>
                        <select>
                            <option>이름</option>
                            <option>아이디</option>
                            <option>닉네임</option>
                            <option>이메일</option>
                        </select>
                        <input type="text">
                        <div>
                            <button id="detail">+</button>
                        </div>
                    </div>
                </div>
                <div id="detail-search">
                    <div>상세 검색</div>
                    <hr>
                    <div id="detail-search-content">
                        <div>
                            <div>
                                <div>가입일</div>
                                <div>최종 접속 시간</div>
                                <div>총 구매액</div>
                                <div>총 판매액</div>
                                <div>레시피 등록수</div>
                                <div>상품 등록수</div>
                                <div>포인트</div>
                                <div>등급</div>
                            </div>
                            <div>
                                <div>
                                    <input class="selector"> ~
                                    <input class="selector">
                                </div>
                                
                                <div>
                                    <input class="selector2"> ~
                                    <input class="selector2">
                                </div>
                                <div>
                                    <input type="text"> ~
                                    <input  type="text">
                                </div>
                                <div>
                                    <input  type="text"> ~
                                    <input  type="text">
                                </div>
                                <div>
                                    <input  type="text"> ~
                                    <input  type="text">
                                </div>
                                <div>
                                    <input  type="text"> ~
                                    <input  type="text">
                                </div>
                                <div>
                                    <input  type="text"> ~
                                    <input  type="text">
                                </div>
                                <div>
                                    <select>
                                        <option>일반회원</option>
                                        <option>우수회원</option>
                                        <option>VIP</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div id="member-search-button">
                    <button>검색</button>
                </div>
            </div>
        </div>

        <div id="search-output">
            <div id="search-output-header">검색 결과</div>
            <div>
                <div id="search-output-list">
                    <table>
                        <thead>
                            <tr>
                                <th>체크</th>
                                <th>회원 번호</th>
                                <th>아이디</th>
                                <th>이메일</th>
                                <th>닉네임</th>
                                <th>이름</th>
                                <th>가입일</th>
                                <th>최종 접속일</th>
                                <th>총 구매액</th>
                                <th>총 판매액</th>
                                <th>레시피 개수</th>
                                <th>상품 개수</th>
                                <th>포인트</th>
                                <th>등급</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>123123123</td>
                                <td><a href="#">kwjd124</a></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>                
            </div>
            
        </div>


    </div>
    <script>
        $(".selector").flatpickr({
            enableTime: true,
            dateFormat: "Y-m-d",
        });
        $(".selector2").flatpickr({
            enableTime: true,
            dateFormat: "Y-m-d H:i",
        });
    </script>

</body>
</html>