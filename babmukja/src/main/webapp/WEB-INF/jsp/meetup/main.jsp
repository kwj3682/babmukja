<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="<c:url value="/resources/js/jquery-3.2.1.js"/>"> </script> <script
        src='<c:url value="/resources/js/meetup_address.js"/>'> </script>
    <!--     <script src="//code.jquery.com/jquery-1.11.0.min.js"></script> -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
        integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <!--모달 부분  -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!--     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" -->
    <!--         integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" -->
    <!--         crossorigin="anonymous"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    <!-- modal address js -->
    <!--<script type="text/javascript" src="/resources/js/meetup_main_modal_address.js"></script>-->
    <script src='<c:url value="/resources/js/meetup_main_modal_address.js"/>'> </script>
    <script src='<c:url value="/resources/js/meetup_main_search_address.js"/>'> </script>

    <!-- maincss -->
    <link href="<c:url value="/resources/css/meetup/meetup_main.css"/>" rel="stylesheet" type="text/css">

    <script src='<c:url value="/resources/js/meetup_main_comma.js"/>'> </script>
    <!-- include libraries(jQuery,
    
    
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
  <!-- 쿠킹 모임 메인 컨테이너 -->
    <div class="main_container">
        <!-- 쿠킹 모임 헤더  -->
        <div class=main_header>
            <span class="header_cooking_meetup">쿠킹모임</span>

        </div>
        <!--검색 클릭시 세부내용처리 -->
        <form method="post">
            <span class="header_search">
                <input type="text" placeholder="검색">
                <i class="fas fa-search fa-2x"></i>
            </span>
            <div class="after_click">
                <div class="location_container">
                    <!--지역설정 -->
                    <div class="location_title_container">
                        <span></span>
                        <span class="location_title">지역</span>
                        <span class="location_add_minus"><i class="fas fa-plus-circle" id="main_add_location"></i>
                            &nbsp; <i class="fas fa-minus-circle" id="main_substract_location"></i>


                        </span>
                    </div>
                    <div class=" location_position" id="location_position">


                    </div>
                </div>

                <div class="food_type_container">
                    <div class="food_type_title">카테고리</div>
                    <div class="food_type_position">

                        <input type="checkbox" name="category" value="total"> 전체</input>
                        <input type="checkbox" name="category" value="total"> 한식</input>
                        <input type="checkbox" name="category" value="total">중식</input>
                        <input type="checkbox" name="category" value="total">일식</input>
                        <input type="checkbox" name="category" value="total">양식</input>
                        <input type="checkbox" name="category" value="total">동남아시아</input>
                        <input type="checkbox" name="category" value="total">기타</input>

                    </div>
                </div>
                <div class="monthly_fee_container">
                    <div class="monthly_fee_title">월 회비</div>
                    <div class="monthly_fee_position">

                        <input type="checkbox" name="category" value="all" />무관</input>
                        <input type="checkbox" name="category" value="10000" />만원 이하</input>
                        <input type="checkbox" name="category" value="30000" />3만원 이하</input>
                        <input type="checkbox" name="category" value="50000" />5만원 이하</input>
                        <input type="checkbox" name="category" value="100000" />10만원 이하</input>
                    </div>
                </div>
                <!--클릭 후  끝 -->
            </div>
        </form>
        <div class="create_manage_container"> <span class="header_meetup_create">모임개설</span><span
                class="header_meetup_manage">모임관리</span></div>
        <!-- 추천모임부분 시작 -->
        <div class="recommend_div">
            <div class="recommend_title">추천모임</div>

            <!-- 추천모임 탭 시작 -->
            <div class="tabContainer">
                <table class="selectTab">
                    <tr>
                        <td>전체</td>
                        <td>한식</td>
                        <td>중식</td>
                        <td>일식</td>
                        <td>양식</td>
                        <td>동남아시아</td>
                    </tr>
                </table>



            </div>

     
            

            <div class="tabPanel">전체
                <!-- 추천모임 박스 -->
                <div class="info_block_container">
                    <!--1 추천모임 박스 복사시작 -->
                    <div class="info_block">
                        <div class="info_pic"><img src='<c:url value ="/resources/images/zzapageti.jpg"/>' width="384px"
                                , height="190px">
                        </div>
                        <div class="info_line">오늘은 내가 짜파게티 요리사</div>
                        <div class="info_monthly_fee">
                            <sapn>월 회비: 5000원</sapn>
                        </div>

                        <div class="info_bottom">
                            <div class="bottom_location"><span><i class="fas fa-map-marker-alt "></i>&nbsp; 여의도</span>
                            </div>
                            <div class="border_line"></div>
                            <div class="bottom_view_count"><span><i class="fas fa-eye"></i>&nbsp;370</span>
                            </div>
                        </div>
                    </div>
                    <!-- 추천모임 박스 복사끝 -->
                    <!--2 추천모임 박스 복사시작 -->
                    <div class="info_block">
                        <div class="info_pic"><img src='<c:url value ="/resources/images/meetup_coldnoodle.jpg"/>'
                                width="384px" , height="190px">
                        </div>
                        <div class="info_line">마로님과 함께하는 평양냉면 기행</div>
                        <div class="info_monthly_fee">
                            <sapn>월 회비: 2000원</sapn>
                        </div>

                        <div class="info_bottom">
                            <div class="bottom_location"><span><i class="fas fa-map-marker-alt "></i>&nbsp; 서울 종각</span>
                            </div>
                            <div class="border_line"></div>
                            <div class="bottom_view_count"><span><i class="fas fa-eye"></i>&nbsp;320</span>
                            </div>
                        </div>
                    </div>
                    <!-- 추천모임 박스 복사끝 -->
                    <!-- 3추천모임 박스 복사시작 -->
                    <div class="info_block">
                        <div class="info_pic"><img src='<c:url value ="/resources/images/meetup_meat.jpg"/>'
                                width="384px" , height="190px">
                        </div>
                        <div class="info_line">한빈님과 함께하는 근육을 위한 요리교실</div>
                        <div class="info_monthly_fee">
                            <sapn>월 회비: 10000원</sapn>
                        </div>

                        <div class="info_bottom">
                            <div class="bottom_location"><span><i class="fas fa-map-marker-alt "></i>&nbsp; 서울
                                    마포구</span>
                            </div>
                            <div class="border_line"></div>
                            <div class="bottom_view_count"><span><i class="fas fa-eye"></i>&nbsp;310</span>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- 추천모임 박스 복사끝 -->
            </div>
            <div class="tabPanel">한식
                <!-- 추천모임 박스 -->
                <div class="info_block_container">
                    <!--1 추천모임 박스 복사시작 -->
                    <div class="info_block">
                        <div class="info_pic"><img src='<c:url value ="/resources/images/meetup_coldnoodle.jpg"/>'
                                width="384px" , height="190px">
                        </div>
                        <div class="info_line">마로님과 함께하는 평양냉면 기행</div>
                        <div class="info_monthly_fee">
                            <sapn>월 회비: 2000원</sapn>
                        </div>

                        <div class="info_bottom">
                            <div class="bottom_location"><span><i class="fas fa-map-marker-alt "></i>&nbsp; 서울 종각</span>
                            </div>
                            <div class="border_line"></div>
                            <div class="bottom_view_count"><span><i class="fas fa-eye"></i>&nbsp;320</span>
                            </div>
                        </div>
                    </div>
                    <!-- 추천모임 박스 복사끝 -->
                    <!--2 추천모임 박스 복사시작 -->
                    <div class="info_block">
                        <div class="info_pic"><img src='<c:url value ="/resources/images/meetup_bibimbap.jpg"/>'
                                width="384px" , height="190px">
                        </div>
                        <div class="info_line">우리음식 동호회</div>
                        <div class="info_monthly_fee">
                            <sapn>월 회비: 10000원</sapn>
                        </div>

                        <div class="info_bottom">
                            <div class="bottom_location"><span><i class="fas fa-map-marker-alt "></i>&nbsp; 경기도
                                    부천</span>
                            </div>
                            <div class="border_line"></div>
                            <div class="bottom_view_count"><span><i class="fas fa-eye"></i>&nbsp;200</span>
                            </div>
                        </div>
                    </div>
                    <!-- 추천모임 박스 복사끝 -->
                    <!-- 3추천모임 박스 복사시작 -->
                    <div class="info_block">
                        <div class="info_pic"><img src='<c:url value ="/resources/images/meetup_sidedish.jpg"/>'
                                width="384px" , height="190px">
                        </div>
                        <div class="info_line">집반찬을 만들어보아요~</div>
                        <div class="info_monthly_fee">
                            <sapn>월 회비: 5000원</sapn>
                        </div>

                        <div class="info_bottom">
                            <div class="bottom_location"><span><i class="fas fa-map-marker-alt "></i>&nbsp; 서울
                                    은평구</span>
                            </div>
                            <div class="border_line"></div>
                            <div class="bottom_view_count"><span><i class="fas fa-eye"></i>&nbsp;210</span>
                            </div>
                        </div>
                    </div>
                    <!-- 추천모임 박스 복사끝 -->

                </div>
                <!-- 추천모임 박스끝 -->
            </div>
            <div class="tabPanel">중식
                <!-- 추천모임 박스 -->
                <div class="info_block_container">
                    <!--1 추천모임 박스 복사시작 -->
                    <div class="info_block">
                        <div class="info_pic"><img src='<c:url value ="/resources/images/meetup_zzazang.jpg"/>'
                                width="384px" , height="190px">
                        </div>
                        <div class="info_line">중국 음식 집에서!</div>
                        <div class="info_monthly_fee">
                            <sapn>월 회비: 5000원</sapn>
                        </div>

                        <div class="info_bottom">
                            <div class="bottom_location"><span><i class="fas fa-map-marker-alt "></i>&nbsp; 부산 기장</span>
                            </div>
                            <div class="border_line"></div>
                            <div class="bottom_view_count"><span><i class="fas fa-eye"></i>&nbsp;200</span>
                            </div>
                        </div>
                    </div>
                    <!-- 추천모임 박스 복사끝 -->
                    <!--2 추천모임 박스 복사시작 -->
                    <div class="info_block">
                        <div class="info_pic"><img src='<c:url value ="/resources/images/meetup_zzambbong.jpg"/>'
                                width="384px" , height="190px">
                        </div>
                        <div class="info_line">중국집 음식 동호회</div>
                        <div class="info_monthly_fee">
                            <sapn>월 회비: 5000원</sapn>
                        </div>

                        <div class="info_bottom">
                            <div class="bottom_location"><span><i class="fas fa-map-marker-alt "></i>&nbsp; 여의도</span>
                            </div>
                            <div class="border_line"></div>
                            <div class="bottom_view_count"><span><i class="fas fa-eye"></i>&nbsp;190</span>
                            </div>
                        </div>
                    </div>
                    <!-- 추천모임 박스 복사끝 -->
                    <!-- 3추천모임 박스 복사시작 -->
                    <div class="info_block">
                        <div class="info_pic"><img src='<c:url value ="/resources/images/meetup_mara.jpg"/>'
                                width="384px" , height="190px">
                        </div>
                        <div class="info_line">마라탕 맛집탐방</div>
                        <div class="info_monthly_fee">
                            <sapn>월 회비: 7000원</sapn>
                        </div>

                        <div class="info_bottom">
                            <div class="bottom_location"><span><i class="fas fa-map-marker-alt "></i>&nbsp; 여의도</span>
                            </div>
                            <div class="border_line"></div>
                            <div class="bottom_view_count"><span><i class="fas fa-eye"></i>&nbsp;30</span>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- 추천모임 박스 복사끝 -->
            </div>
            <!-- 중식 추천모임 박스끝 -->
        </div>
        <div class="tabPanel">일식
            <!-- 추천모임 박스 -->
            <div class="info_block_container">
                <!--1 추천모임 박스 복사시작 -->
                <div class="info_block">
                    <div class="info_pic"><img src='<c:url value ="/resources/images/meetup_sushi.jpg"/>' width="384px"
                            , height="190px">
                    </div>
                    <div class="info_line">집에서 초밥 만들기</div>
                    <div class="info_monthly_fee">
                        <sapn>월 회비: 15000원</sapn>
                    </div>

                    <div class="info_bottom">
                        <div class="bottom_location"><span><i class="fas fa-map-marker-alt "></i>&nbsp; 여의도</span>
                        </div>
                        <div class="border_line"></div>
                        <div class="bottom_view_count"><span><i class="fas fa-eye"></i>&nbsp;170</span>
                        </div>
                    </div>
                </div>
                <!-- 추천모임 박스 복사끝 -->
                <!--2 추천모임 박스 복사시작 -->
                <div class="info_block">
                    <div class="info_pic"><img src='<c:url value ="/resources/images/meetup_japanset.jpg"/>'
                            width="384px" , height="190px">
                    </div>
                    <div class="info_line">나는요 일식이 좋은걸</div>
                    <div class="info_monthly_fee">
                        <sapn>월 회비: 7000원</sapn>
                    </div>

                    <div class="info_bottom">
                        <div class="bottom_location"><span><i class="fas fa-map-marker-alt "></i>&nbsp; 천안</span>
                        </div>
                        <div class="border_line"></div>
                        <div class="bottom_view_count"><span><i class="fas fa-eye"></i>&nbsp;100</span>
                        </div>
                    </div>
                </div>
                <!-- 추천모임 박스 복사끝 -->
                <!-- 3추천모임 박스 복사시작 -->
                <div class="info_block">
                    <div class="info_pic"><img src='<c:url value ="/resources/images/meetup_yaki.jpg"/>' width="384px" ,
                            height="190px">
                    </div>
                    <div class="info_line">갓우중과 함께하는 일본 길거리 음식 탐방</div>
                    <div class="info_monthly_fee">
                        <sapn>월 회비: 5000원</sapn>
                    </div>

                    <div class="info_bottom">
                        <div class="bottom_location"><span><i class="fas fa-map-marker-alt "></i>&nbsp; 여의도</span>
                        </div>
                        <div class="border_line"></div>
                        <div class="bottom_view_count"><span><i class="fas fa-eye"></i>&nbsp;90</span>
                        </div>
                    </div>
                </div>

            </div>

            <!-- 추천모임 박스 복사끝 -->

        </div>
        <!--일식 추천모임 박스끝 -->
        <div class="tabPanel">양식
            <!-- 추천모임 박스 -->
            <div class="info_block_container">
                <!--1 추천모임 박스 복사시작 -->
                <div class="info_block">
                    <div class="info_pic"><img src='<c:url value ="/resources/images/meetup_pasta.jpg"/>' width="384px"
                            , height="190px">
                    </div>
                    <div class="info_line">파스타의 모든것</div>
                    <div class="info_monthly_fee">
                        <sapn>월 회비: 25000원</sapn>
                    </div>

                    <div class="info_bottom">
                        <div class="bottom_location"><span><i class="fas fa-map-marker-alt "></i>&nbsp; 경기도 파주</span>
                        </div>
                        <div class="border_line"></div>
                        <div class="bottom_view_count"><span><i class="fas fa-eye"></i>&nbsp;190</span>
                        </div>
                    </div>
                </div>
                <!-- 추천모임 박스 복사끝 -->
                <!--2 추천모임 박스 복사시작 -->
                <div class="info_block">
                    <div class="info_pic"><img src='<c:url value ="/resources/images/meetup_pizza.jpg"/>' width="384px"
                            , height="190px">
                    </div>
                    <div class="info_line">피자에 미치다</div>
                    <div class="info_monthly_fee">
                        <sapn>월 회비: 8000원</sapn>
                    </div>

                    <div class="info_bottom">
                        <div class="bottom_location"><span><i class="fas fa-map-marker-alt "></i>&nbsp; 인천,부천</span>
                        </div>
                        <div class="border_line"></div>
                        <div class="bottom_view_count"><span><i class="fas fa-eye"></i>&nbsp;30</span>
                        </div>
                    </div>
                </div>
                <!-- 추천모임 박스 복사끝 -->
                <!-- 3추천모임 박스 복사시작 -->

                <div class="info_block">
                    <div class="info_pic"><img src='<c:url value ="/resources/images/meetup_steak.jpg"/>' width="384px"
                            , height="190px">
                    </div>
                    <div class="info_line">마음껏 스테이크 먹는 모임</div>
                    <div class="info_monthly_fee">
                        <sapn>월 회비: 15000원</sapn>
                    </div>

                    <div class="info_bottom">
                        <div class="bottom_location"><span><i class="fas fa-map-marker-alt "></i>&nbsp; 서울 동작구</span>
                        </div>
                        <div class="border_line"></div>
                        <div class="bottom_view_count"><span><i class="fas fa-eye"></i>&nbsp;90</span>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <!-- 추천모임 박스 복사끝 -->
        <div class="tabPanel">동남아시아
            <!-- 추천모임 박스 -->
            <div class="info_block_container">
                <!--1 추천모임 박스 복사시작 -->
                <div class="info_block">
                    <div class="info_pic"><img src='<c:url value ="/resources/images/meetup_ricenoodle.jpg"/>'
                            width="384px" , height="190px">
                    </div>
                    <div class="info_line">빛찬맘과 함께하는 쌀국수 만들기</div>
                    <div class="info_monthly_fee">
                        <sapn>월 회비: 7000원</sapn>
                    </div>

                    <div class="info_bottom">
                        <div class="bottom_location"><span><i class="fas fa-map-marker-alt "></i>&nbsp; 전주</span>
                        </div>
                        <div class="border_line"></div>
                        <div class="bottom_view_count"><span><i class="fas fa-eye"></i>&nbsp;30</span>
                        </div>
                    </div>
                </div>
                <!-- 추천모임 박스 복사끝 -->
                <!--2 추천모임 박스 복사시작 -->
                <div class="info_block">
                    <div class="info_pic"><img src='<c:url value ="/resources/images/meetup_patai.jpg"/>' width="384px"
                            , height="190px">
                    </div>
                    <div class="info_line">세계 4대 진미 태국음식</div>
                    <div class="info_monthly_fee">
                        <sapn>월 회비: 5000원</sapn>
                    </div>

                    <div class="info_bottom">
                        <div class="bottom_location"><span><i class="fas fa-map-marker-alt "></i>&nbsp; 경상북도 포항</span>
                        </div>
                        <div class="border_line"></div>
                        <div class="bottom_view_count"><span><i class="fas fa-eye"></i>&nbsp;30</span>
                        </div>
                    </div>
                </div>
                <!-- 추천모임 박스 복사끝 -->
                <!-- 3추천모임 박스 복사시작 -->
                <div class="info_block">
                    <div class="info_pic"><img src='<c:url value ="/resources/images/meetup_satae.jpg"/>' width="384px"
                            , height="190px">
                    </div>
                    <div class="info_line">인도네시아 음식 어디까지 먹어봤니? </div>
                    <div class="info_monthly_fee">
                        <sapn>월 회비: 10000원</sapn>
                    </div>

                    <div class="info_bottom">
                        <div class="bottom_location"><span><i class="fas fa-map-marker-alt "></i>&nbsp; 강원도 양구</span>
                        </div>
                        <div class="border_line"></div>
                        <div class="bottom_view_count"><span><i class="fas fa-eye"></i>&nbsp;80</span>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
    <!-- 추천모임 탭 끝 -->


    </div>

    <!-- 추천모임 박스 복사끝 -->

    <!-- 모달 부분 아래시작 -->
    <form action="<c:url value='/meetup/createMeetup.do'/>" method="POST" enctype="multipart/form-data">
        <div id="write_modal" class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog"
            aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">모임 개설하기</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- modal 이름 적는부분 -->
                        <div class="modal_meetup_name_container">
                            <div class="modal_meetup_name">
                                카테고리/모임명
                            </div>
                            <div></div>
                            <div class="modal_meetup_category">
                                <select name="category" class="food_nation_category">
                                    <option value="카테고리">카테고리</option>
                                    <option value="한식">한식</option>
                                    <option value="중식">중식</option>
                                    <option value="일식">일식</option>
                                    <option value="동남아시아">동남아시아</option>
                                    <option value="양식">양식</option>
                                    <option value="기타">기타</option>
                                </select>
                            </div>
                            <div></div>
                            <div class="modal_meetup_name">
                                <input type="text" name="title" class="meetup_title" placeholder="모임명을 입력해주세요" />
                            </div>

                        </div>
                        <!-- model tag 부분 -->
                        <div class="modal_meetup_tag_container">
                            <div id="modal_meetup_tag">태그</div>
                            <div></div>
                            <div class="modal_meetup_tag_box">
                                <input type="text" name="tag" class="meetup_tag" placeholder="#모임을 표현할 태그명를 입력해주세요" />
                            </div>
                        </div>

                        <div class="modal_meetup_location_container">
                            <div class="location">활동지역</div>

                            <div class="modal_meetup_plus_container">
                                <div><i class="fas fa-plus-circle" id="modal_location_plus"></i> &nbsp;&nbsp; <i
                                        class="fas fa-minus-circle" id="modal_location_minus"></i></div>
                            </div>
                            <div></div>
                            <div class="modal_meetup_location_box">

                            </div>
                        </div> <!-- location container 끝  -->


                        <!-- 요일선택 부분 -->
                        <div class="modal_meetup_day_container">
                            <div id="modal_meetup_day">요일선택</div>
                            <div></div>
                            <div class="modal_meetup_day_box">
                                <input type="checkbox" class="selectDay" id="selectMonday" name="day" value="월">
                                <label for="selectMonday" class="select_Day_label">월</label>
                                <input type="checkbox" class="selectDay" id="selectTuesday" name="day" value="화">
                                <label for="selectTuesday" class="select_Day_label">화</label>
                                <input type="checkbox" class="selectDay" id="selectWednesday" name="day" value="수">
                                <label for="selectWednesday" class="select_Day_label">수</label>
                                <input type="checkbox" class="selectDay" id="selectThursday" name="day" value="목">
                                <label for="selectThursday" class="select_Day_label">목</label>
                                <input type="checkbox" class="selectDay" id="selectFriday" name="day" value="금">
                                <label for="selectFriday" class="select_Day_label">금</label>
                                <input type="checkbox" class="selectDay" id="selectSaturday" name="day" value="토">
                                <label for="selectSaturday" class="select_Day_label">토</label>
                                <input type="checkbox" class="selectDay" id="selectSunday" name="day" value="일">
                                <label for="selectSunday" class="select_Day_label">일</label>
                            </div>
                        </div>

                        <div class="modal_meetup_fee_container">
                            <div class="modal_meetup_fee">월 회비</div>
                            <div></div>
                            <div class="modal_meetup_fee_checkbox">
                                <input type="radio" name="fee" class="modal_monthly_fee" value="na" id="notDefined" />미정
                            </div>
                            <div class="modal_meetup_fee_inputbox">
                                <input type="radio" name="fee" value="personal" class="modal_monthly_fee"
                                    id="Defined" />
                                <input type="text" name="detailFee" class="modal_fee_input" id="DefinedDetail"
                                    placeholder="액수를 입력해 주세요" />원
                            </div>
                        </div>
                        <div class="modal_meetup_mainPic_container">
                            <div class="modal_meetup_mainPic">메인사진 설정</div>
                            <div></div>
                            <div class="modal_meetup_mainPic_box">
                                <!-- 부트스트랩 적용 -->
                                <div class="file-upload">
                                    <button class="file-upload-btn" type="button"
                                        onclick="$('.file-upload-input').trigger( 'click' )">사진 첨부하기</button>

                                    <div class="image-upload-wrap">
                                        <input class="file-upload-input" type='file' name='file'
                                            onchange="readURL(this);" accept="image/*" />
                                        <div class="drag-text">
                                            <h3>Drag and drop a file or select add Image</h3>
                                        </div>
                                    </div>
                                    <div class="file-upload-content">
                                        <img class="file-upload-image" src="#" alt="your image" />
                                        <div class="image-title-wrap">
                                            <button type="button" onclick="removeUpload()" class="remove-image">삭제하기
                                                <span class="image-title">Uploaded Image</span></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 모델 바디 끝  -->

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button class="btn btn-primary" id="modalSave">Save changes</button>
                    </div>

                </div>
            </div>


        </div>
    </form>
    <!--form tag-->
    <!--위까지 모달 부분 끝 -->

    <!--메인 컨테이너 끝 -->
    </div>


    <!--  <script type="text/javascript" src="/resources/js/meetup_main.js"></script>-->
    <script src='<c:url value="/resources/js/meetup_main.js"/>'> </script>


    </body>

</html>