<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<c:url value="/resources/css/notice/notice list.css"/>">
    <script src="/babmukja/WEB-INF/js/jquery-3.2.1.min.js"></script>
    <title>전체조회</title>
</head>
<body>
    <div class="noticelist">
        <h2>공지사항 전체조회</h2><br>
        <hr>
        <table id="tableDesign">
                <caption>전체조회</caption>
                <tr>
                    <th class="inquirelist"><span>번호</span></th>
                    <th class="inquirelist"><span>제목</span></th>
                    <th class="inquirelist"><span>분류</span></th>
                    <th class="inquirelist"><span>등록일</span></th>
                    <th class="inquirelist"><span>조회</span></th>
                </tr>
                <tr>
                    <td class="noticeNo">1</td>
                    <td class="leftstyle2">반찬가게 프랜차이즈 밥먹자 MBC 미니시리즈 ‘봄이 오나 봄’ 협찬</td>
                    <td class="inquirelist2">공지</td>
                    <td class="inquirelist2">2018/04/12</td>
                    <td class="btnView"><button input type="button"><a href="#">확인</a></button></td>
                </tr>
                <tr>
                    <td class="noticeNo">2</td>
                    <td class="leftstyle2">어린이 반찬 6종 출시</td>
                    <td class="inquirelist2">공지</td>
                    <td class="inquirelist2">2018/04/25</td>
                    <td class="btnView">
                      <button input type="button" ><a href="#">확인</a></button>
                   </td>
                </tr>
                <tr>
                    <td class="noticeNo">3</td>
                    <td class="leftstyle2">밥먹자의 홈페이지가 개편되었습니다.</td>
                    <td class="inquirelist2">공지</td>
                    <td class="inquirelist2">2018/12/31</td>
                    <td class="btnView"><button input type="button" onclick="alert('비회원은 가입 후 이용하세요')">확인</button></td>
                </tr>
                <tr>
                   <td class="noticeNo">4</td>
                   <td class="leftstyle2">밥먹자가 최근 온라인 쇼핑몰을 오픈하고 서비스를 시작했습니다</td>
                   <td class="inquirelist2">공지</td>
                   <td class="inquirelist2">2019/02/12</td>
                   <td class="btnView"><button input type="button">확인</button></td>
                </tr>
                <tr>
                   <td class="noticeNo">5</td>
                   <td class="leftstyle2">신제품 출시 - 양념 과메기 1+1 행사</td>
                   <td class="inquirelist2">공지</td>
                   <td class="inquirelist2">2019/03/23</td>
                   <td class="btnView"><button input type="button">확인</button></td>
                </tr>
                <tr>
                   <td class="noticeNo">6</td>
                   <td class="leftstyle2">프랜차이즈 창업 박람회 참가 11.17~19</td>
                   <td class="inquirelist2">공지</td>
                   <td class="inquirelist2">2018/011/15</td>
                   <td class="btnView"><button input type="button">확인</button></td>
                </tr>
                <tr>
                   <td class="noticeNo">7</td>
                   <td class="leftstyle2">'밥먹자'가 오는 25일(목)부터 부산벡스코에서 진행되는 부산창업박람회에 참가</td>
                   <td class="inquirelist2">공지</td>
                   <td class="inquirelist2">2018/06/30</td>
                   <td class="btnView"><button input type="button">확인</button></td>
                </tr>
                <tr>
                   <td class="noticeNo">8</td>
                   <td class="leftstyle2">'밥먹자' KBS2 주말드라마 [부탁해요 엄마] 반찬협찬중!!</td>
                   <td class="inquirelist2">공지</td>
                   <td class="inquirelist2">2019/01/31</td>
                   <td class="btnView"><button input type="button">확인</button></td>
                </tr>
                <tr>
                    <td class="noticeNo">9</td>
                    <td class="leftstyle2">2019년 3월 신제품 왕갈비탕 출시</td>
                    <td class="inquirelist2">공지</td>
                    <td class="inquirelist2">2019/02/08</td>
                    <td class="btnView"><button input type="button">확인</button></td>
                </tr>
                <tr>
                   <td class="noticeNo">10</td>
                   <td class="leftstyle2">반찬가게 1등 프랜차이즈 ‘밥먹자’, 반찬배달로 매출 상승</td>
                   <td class="inquirelist2">공지</td>
                   <td class="inquirelist2">2019/03/21</td>
                   <td class="btnView"><button input type="button">확인</button></td>
                </tr>
             </table><hr>
               <nav id="pageNav">
                   <ul>
                       <li><a href='notice detail.html'>1</a></li>
                       <li><a href='#'>2</a></li>
                       <li><a href='#'>3</a></li>
                       <li><a href='#'>4</a></li>
                       <li><a href='#'>5</a></li>
                       <li><a href='#'>></a></li>
                   </ul>
               </nav><br>
        </table>
    </div>
    <c:forEach inquirys="${inquireList}" var="inquire">
                <tr class="record">
                    <td align="center">"${inquire.inquiryNumber}"</td>
                    <td align="center">"${inquire.inquiryContent}"</td>
                    <td align="center">"${inquire.inquiryNotice}"</td>
                    <td align="center">"${inquire.inquireyTime}"</td>
                    <td align="center">"${inquire.inquiry.viewCnt}"</td>
                </tr>
    </c:forEach>
    <footer>
            <h2>BABMUKJA COMPANY</h2>
            <div>Lorem ipsum dolor sit.</div>
    </footer>
</body>
</html>