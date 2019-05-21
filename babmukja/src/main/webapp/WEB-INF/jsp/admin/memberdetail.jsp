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
    <link rel="stylesheet" href="<c:url value="/resources/css/admin/adminmemberdetail.css"/>">
    <script src="/babmukja/js/jquery-3.2.1.min.js"></script>
    <title>Document</title>
</head>
<body>
    <div id="body">
        <div id="body-header">회원 상세 조회</div>
        <div id="body-main">
            <div id="member-img">
                <img src="/babmukja/WEB-INF/images/profile2.jpg">
                <div><b>5012.</b>bitchanmom</div>
            </div>
            <div id="member-profile">
                <table>                
                    <tr>
                        <td>아이디</td>
                        <td></td>
                        <td>이름</td>
                        <td>${d.memName }</td>
                    </tr>
                    <tr>
                        <td>닉네임</td>
                        <td>${d.memNickname }</td>
                        <td>성별</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>회원 가입일</td>
                        <td><fmt:formatDate value= "${d.signDate }" pattern="yyyy-MM-dd" /></td>
                        <td>최종 접속일</td>
                        <td><fmt:formatDate value= "${d.lastDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td colspan="3">${d.memEmail }</td>
                    </tr>
                    <tr>
                        <td>회원 전화 번호</td>
                        <td>${d.memPhone }</td>
                        <td>우편번호</td>
                        <td>${d.postNo }</td>
                    </tr>
                    <tr>
                        <td>기본 주소</td>
                        <td colspan="3">${d.addrDefault }</td>
                    </tr>
                    <tr>
                        <td>상세 주소</td>
                        <td colspan="3">${d.addrDetail }</td>
                    </tr>
                    <tr>
                        <td>소셜로그인</td>
                        <td colspan="3">
                            <input type="radio">네이버
                            <input type="radio">페이스북
                            <input type="radio">카카오
                        </td>
                    </tr>
                    <tr>
                        <td>설정 키워드</td>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>보유 포인트</td>
                        <td>${d.point }</td>
                        <td>회원 등급</td>
                        <td>${d.gradeName }</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>팔로워</td>
                        <td></td>
                        <td>팔로우</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>관리자 여부</td>
                        <td colspan="3">                       
                        <c:if test="${d.managerAt eq '1'.charAt(0) }">Y</c:if>              
                        <c:if test="${d.managerAt eq '0'.charAt(0) }">N</c:if>
                        </td>
                    </tr>                                      
                </table>
            </div>
            <div id="member-memo">
                <div>
                
                    <div>memo1</div>
                    <div>레시피를 많이 올렸음. 1대1 상담 많이 올림ㅡ,.ㅡ </div>
                </div>
                <div>
                    <div>memo1</div>
                    <div>레시피를 많이 올렸음. 1대1 상담 많이 올림ㅡ,.ㅡ </div>
                </div>
                <div>
                    <div>memo1</div>
                    <div>레시피를 많이 올렸음. 1대1 상담 많이 올림ㅡ,.ㅡ </div>
                </div>
                <button>메모 추가</button>
            </div>
        </div>
        <div id="member-info">
            <div>
                <div>
                    <h2>구매 내역</h2>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>주문 번호</th>
                            <th>판매 회원</th>
                            <th>구매 회원</th>
                            <th>주문 수량</th>
                            <th>상품 수령 여부</th>
                            <th>총 결제 금액</th>
                            <th>송장 번호</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>                        
                           <td>${d.orderNo }</td>
                            <td>${d.sellMemNo }</td>
                            <td>${d.buyMemNo }</td>
                            <td>${d.totCount }</td>
                            <td>
	                            <c:if test="${d.get eq '1'.charAt(0) }">Y</c:if>   
	                            <c:if test="${d.get eq '0'.charAt(0) }">N</c:if>   
                            </td>
                            <td>${d.orderSum }</td>
                            <td>${d.deliveryNo }</td>  
                        </tr>
                    </tbody>               
                </table>
            </div>
            
            <div>
                <div>
                    <h2>판매 내역</h2>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>주문 번호</th>
                            <th>판매 회원</th>
                            <th>구매 회원</th>
                            <th>주문 수량</th>
                            <th>상품 수령 여부</th>
                            <th>총 결제 금액</th>
                            <th>송장 번호</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${d.orderNo }</td>
                            <td>${d.sellMemNo }</td>
                            <td>${d.buyMemNo }</td>
                            <td>${d.totCount }</td>
                            <td>
	                            <c:if test="${d.get eq '1'.charAt(0) }">Y</c:if>   
	                            <c:if test="${d.get eq '0'.charAt(0) }">N</c:if>   
                            </td>
                            <td>${d.orderSum }</td>
                            <td>${d.deliveryNo }</td>  
                        </tr>
                    </tbody>                                                     
                </table>
            </div>

            <div>
                <div>
                    <h2>Q&A 등록 이력</h2>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>Q&A 번호</th>
                            <th>카테고리</th>
                            <th>제목</th>
                            <th>답변 여부</th>
                            <th>Q&A 등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
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
    <script>
    	
    </script>
</body>
</html>
