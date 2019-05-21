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
                    <form action="<c:url value='/admin/member.do'/>" method="post" >
                        <select class="search" name="searchType">
                            <option value="memName">이름</option>
                            <option value="memId">아이디</option>
                            <option value="memNickname">닉네임</option>
                            <option value="memEmail">이메일</option>
                        </select>
                        <input class="search_form_input" name="input" type="text">
                        <div>
                            <input type="button" id="detail_button" value="+">
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
                                    <input class="selector" name="signDate1"> ~
                                    <input class="selector" name="signDate2">
                                </div>
                                
                                <div>
                                    <input class="selector2" name="lastDate1"> ~
                                    <input class="selector2" name="lastDate2">
                                </div>
                                <div>
                                    <input type="text" name="totalBuy1"> ~
                                    <input type="text" name="totalBuy2">
                                </div>
                                <div>
                                    <input type="text" name="totalSel1"> ~
                                    <input type="text" name="totalSel2">
                                </div>
                                <div>
                                    <input type="text" name="recipeCnt1"> ~
                                    <input type="text" name="recipeCnt2">
                                </div>
                                <div>
                                    <input type="text" name="sellingCnt1"> ~
                                    <input type="text" name="sellingCnt2">
                                </div>
                                <div>
                                    <input type="text" name="point1"> ~
                                    <input type="text" name="point2">
                                </div>
                                <div>
                                    <select class="grade" name="gradeType">
                                        <option value="newMem">신규회원</option>
                                        <option value="normalMem">일반회원</option>
                                        <option value="goodMem">우수회원</option>
                                        <option value="bestMem">VIP</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="member-search-button">
                    <button>검색</button>
                </div>
               </form>
            </div>
        </div>

        <div id="search-output">
        	<c:choose>
        	<c:when test="${count != 0 }">
        		<div id="search-output-header">검색 결과 ${count}명</div>
        	</c:when>
        	<c:otherwise>
        		<div id="search-output-header">검색 결과 회원이 존재하지 않습니다.</div>
        	</c:otherwise>
    		</c:choose>
            <div>
                <div id="search-output-list">
                    <table>
                        <thead>
                            <tr>
                                <th>체크</th>
                                <th>회원 번호</th>                                
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
                        <c:forEach var="m" items="${list}">
                            <tr>                            
                                <td><input type="checkbox"></td>
                                <td><a href="<c:url value='/admin/memberdetail.do?no=${m.memNo }'/>">${m.memNo }</a></td> 
                                <td>${m.memEmail }</td>
                                <td>${m.memNickname }</td>
                                <td><a href="<c:url value='/admin/memberdetail.do?no=${m.memNo }'/>">${m.memName }</a></td>
                                <td><fmt:formatDate value= "${m.signDate }" pattern="yyyy-MM-dd" /></td>
                                <td><fmt:formatDate value= "${m.lastDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                <td>${m.totalBuy }</td>
                                <td>${m.totalSel }</td>
                                <td>${m.recipeCnt }</td>
                                <td>${m.sellingCnt }</td>
                                <td>${m.point }</td>
                                <td>${m.gradeName }</td>                            	
                            </tr>
                            	</c:forEach>
                        </tbody>
                    </table>
                    <div id="pageText">
                    <c:if test="${pageResult.count != 0}"> 
							<c:if test="${pageResult.prev eq true}">
							<a data-pageNo="${pageResult.beginPage - 1}" href="${param.link}?pageNo=${pageResult.beginPage - 1}">이전</a>
						</c:if>
						<c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}">
							<a data-pageNo="${i}" href="${param.link}?pageNo=${i}">[${i}]</a>
							</c:forEach>
						<c:if test="${pageResult.next eq true}">
							<a data-pageNo="${pageResult.endPage + 1}" href="#1">다음</a>
						</c:if>	
					</c:if>	
					</div>
                </div>                
            </div>
        </div>
	</div>
	<form name="searchForm" action="<c:url value="/admin/member.do"/>" method="post">
		<input type="hidden" name="pageNo" value="${param.pageNo}">
		<input type="hidden" name="searchType" value="${param.searchType}">
		<input type="hidden" name="input" value="${param.input}">
		<input type="hidden" name="signDate1" value="${param.signDate1}">
		<input type="hidden" name="signDate2" value="${param.signDate2}">
		<input type="hidden" name="lastDate1" value="${param.lastDate1}">
		<input type="hidden" name="lastDate2" value="${param.lastDate2}">
		<input type="hidden" name="totalBuy1" value="${param.totalBuy1}">
		<input type="hidden" name="totalBuy2" value="${param.totalBuy2}">
		<input type="hidden" name="totalSel1" value="${param.totalSel1}">
		<input type="hidden" name="totalSel2" value="${param.totalSel2}">
		<input type="hidden" name="recipeCnt1" value="${param.recipeCnt1}">
		<input type="hidden" name="recipeCnt2" value="${param.recipeCnt2}">
		<input type="hidden" name="sellingCnt1" value="${param.sellingCnt1}">
		<input type="hidden" name="sellingCnt2" value="${param.sellingCnt2}">
		<input type="hidden" name="point1" value="${param.point1}">
		<input type="hidden" name="point2" value="${param.point2}">
		<input type="hidden" name="gradeType" value="${param.gradeType}">	
	</form>
    <script>    
    	
    	$("#pageText > a").click(function () {
    		$("[name='searchForm'] > input[name='pageNo']").val();
    		$("[name='searchForm']").submit();
    		return false;
    	});
    
 
   		 $("#detail_button").click(function () { 
       		$("#detail-search").css(
            	"display", "block"                
        	);            
    	});
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