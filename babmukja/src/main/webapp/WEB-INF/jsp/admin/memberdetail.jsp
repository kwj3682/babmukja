<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/babmukja/css/adminmemberdetail.css">
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
                        <td>bitchanmom</td>
                        <td>이름</td>
                        <td>황빛찬</td>
                    </tr>
                    <tr>
                        <td>닉네임</td>
                        <td>빛찬맘9단</td>
                        <td>성별</td>
                        <td>남</td>
                    </tr>
                    <tr>
                        <td>회원 가입일</td>
                        <td>2019-05-01</td>
                        <td>최종 접속일</td>
                        <td>2019-05-05 15:31:30</td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td colspan="3">bitchanmom9@naver.com</td>
                    </tr>
                    <tr>
                        <td>회원 전화 번호</td>
                        <td>010-1111-2222</td>
                        <td>우편번호</td>
                        <td>10348</td>
                    </tr>
                    <tr>
                        <td>기본 주소</td>
                        <td colspan="3">경기도 고양시 일산서구</td>
                    </tr>
                    <tr>
                        <td>상세 주소</td>
                        <td colspan="3">원일로3(신원아침도시2차), 202-1101</td>
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
                        <td colspan="3">#주부9단입니다lv9</td>
                    </tr>
                    <tr>
                        <td>보유 포인트</td>
                        <td>1,252</td>
                        <td>회원 등급</td>
                        <td>우수회원</td>
                    </tr>
                    <tr>
                        <td>비밀번호 힌트</td>
                        <td>졸업한 초등학교 이름은?</td>
                        <td>힌트 답</td>
                        <td>상탄 초등학교</td>
                    </tr>
                    <tr>
                        <td>팔로워</td>
                        <td>50</td>
                        <td>팔로우</td>
                        <td>125</td>
                    </tr>
                    <tr>
                        <td>관리자 여부</td>
                        <td colspan="3">N</td>
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
                            <td>15</td>
                            <td>15</td>
                            <td>15</td>
                            <td>15</td>
                            <td>15</td>
                            <td>15</td>
                            <td>15</td>
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
                            <td>15</td>
                            <td>15</td>
                            <td>15</td>
                            <td>15</td>
                            <td>15</td>
                            <td>15</td>
                            <td>15</td>
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
                            <td>15</td>
                            <td>15</td>
                            <td>15</td>
                            <td>15</td>
                            <td>15</td>
                        </tr>
                    </tbody>
                
                </table>
            </div>
        </div>
    </div>
</body>
</html>

<!--
    회원 아이디 
    회원 이름
    회원 번호
    회원 닉네임
    회원 이메일
    회원 전화번호
    회원 비밀번호
    회원 우편번호
    회원 기본주소
    회원 상세주소
    관리자 여부
    회원가입일
    최종접속일
    소셜 로그인 여부
    포인트
    비밀번호 힌트
    비밀번호 힌트 답
    스크랩 게시물
    장바구니
    팔로워
    팔로우
    키워드
    회원 등급

-->