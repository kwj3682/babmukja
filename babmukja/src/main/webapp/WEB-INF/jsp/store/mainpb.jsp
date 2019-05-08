<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/store/mainpb.css"/>">
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
</head>
<body>
    <!-- PB스토어 메인화면 -->
    <div id="pb_store_container">
        <!-- 오늘의 추천상품 -->
        <div id="pb_store_today_product">
            <div id="pb_store_today_product_text">오늘의 추천<br><br></div>
            
            <!-- 메인 이미지 슬라이드 보여주기 -->
            <div id="pb_store_today_product_img">
                <div id="pb_store_today_img">
                   <img id="img1" src="http://cfd.tourtips.com/@cms_800/2014062365/gjdrmb/%EC%89%91%EC%89%91%EB%B2%84%EA%B1%B0(%EB%89%B4%EC%9A%95%EC%9C%A0%EB%AA%85%ED%96%84%EB%B2%84%EA%B1%B0)_2.jpg">
                    <img id="img2" src="http://edgerank.co.kr/wp-content/uploads/2016/11/22.png">
                    <img id="img3" src="https://t1.daumcdn.net/cfile/tistory/15298033513ECBD304">
                    <img id="img4" src="https://us.123rf.com/450wm/baibakova/baibakova1609/baibakova160900188/63444373-%EC%95%8C%EB%A0%88%EB%A5%B4%EA%B8%B0-%EC%9D%8C%EC%8B%9D-%EA%B0%9C%EB%85%90%EC%9E%85%EB%8B%88%EB%8B%A4-%ED%9D%B0%EC%83%89-%EB%82%98%EB%AC%B4-%EB%B0%B0%EA%B2%BD%EC%97%90-%EC%95%8C%EB%A0%88%EB%A5%B4%EA%B8%B0-%EC%9D%8C%EC%8B%9D.jpg?ver=6">
                    <img id="img5" src="https://www.spcmagazine.com/wp-content/uploads/2018/02/%E1%84%80%E1%85%A7%E1%84%8B%E1%85%AE%E1%86%AF%E1%84%8B%E1%85%B3%E1%86%B7%E1%84%89%E1%85%B5%E1%86%A8_5.png">
                </div>
            </div>
        </div>
        <br>

        <!-- 키워드 -->
        <div id="pb_store_popular_keyword">
            <div id="pb_sotre_popular_keyword_text">인기 키워드<br><br></div>
            
            <!-- 키워드 이미지 -->
            <div id="pb_sotre_popular_keyword_img">
                <div id="images">
                    <a href="#">
                        <div class="text">#키워드</div>
                        <img src="http://edgerank.co.kr/wp-content/uploads/2016/11/22.png">
                    </a>
                    <a href="#">
                        <div class="text">#키워드</div>
                        <img src="http://cfd.tourtips.com/@cms_800/2014062365/gjdrmb/%EC%89%91%EC%89%91%EB%B2%84%EA%B1%B0(%EB%89%B4%EC%9A%95%EC%9C%A0%EB%AA%85%ED%96%84%EB%B2%84%EA%B1%B0)_2.jpg">
                    </a>
                    <a href="#">
                        <div class="text">#키워드</div>
                        <img src="https://t1.daumcdn.net/cfile/tistory/15298033513ECBD304">
                    </a>
                    <a href="#">
                        <div class="text">#키워드</div>
                        <img src="https://us.123rf.com/450wm/baibakova/baibakova1609/baibakova160900188/63444373-%EC%95%8C%EB%A0%88%EB%A5%B4%EA%B8%B0-%EC%9D%8C%EC%8B%9D-%EA%B0%9C%EB%85%90%EC%9E%85%EB%8B%88%EB%8B%A4-%ED%9D%B0%EC%83%89-%EB%82%98%EB%AC%B4-%EB%B0%B0%EA%B2%BD%EC%97%90-%EC%95%8C%EB%A0%88%EB%A5%B4%EA%B8%B0-%EC%9D%8C%EC%8B%9D.jpg?ver=6">
                    </a>
                    <a href="#">
                        <div class="text">#키워드</div>
                        <img src="https://us.123rf.com/450wm/baibakova/baibakova1609/baibakova160900188/63444373-%EC%95%8C%EB%A0%88%EB%A5%B4%EA%B8%B0-%EC%9D%8C%EC%8B%9D-%EA%B0%9C%EB%85%90%EC%9E%85%EB%8B%88%EB%8B%A4-%ED%9D%B0%EC%83%89-%EB%82%98%EB%AC%B4-%EB%B0%B0%EA%B2%BD%EC%97%90-%EC%95%8C%EB%A0%88%EB%A5%B4%EA%B8%B0-%EC%9D%8C%EC%8B%9D.jpg?ver=6">
                    </a>
                    <a href="#">
                        <div class="text">#키워드</div>
                        <img src="https://t1.daumcdn.net/cfile/tistory/15298033513ECBD304">
                    </a>
                    <a href="#">
                        <div class="text">#키워드</div>
                        <img src="http://cfd.tourtips.com/@cms_800/2014062365/gjdrmb/%EC%89%91%EC%89%91%EB%B2%84%EA%B1%B0(%EB%89%B4%EC%9A%95%EC%9C%A0%EB%AA%85%ED%96%84%EB%B2%84%EA%B1%B0)_2.jpg">
                    </a>
                    <a href="#">
                        <div class="text">#키워드</div>
                        <img src="http://edgerank.co.kr/wp-content/uploads/2016/11/22.png">
                    </a>
                </div>
            </div>
        </div>
        <br><br><br>
    
        <!-- 인기 상품 -->
        <div id="pb_store_popular_product">
            <div id="pb_store_popular_product_header">
                <div id="pb_store_popular_product_text">인기 상품</div>
                <button id="pb_store_popular_product_btn">더보기<br><br></button>
            </div><br>
            
            <!-- 인기상품 이미지 -->
            <div id="pb_store_popular_product_img">
                <div id="pb_store_popular_product_imges">
                    <div id="pb_store_popular_product_imges_grid">
                    <c:forEach var="pbList" items="${pbList}" begin="1" end="4">
                        <a class="pb_store_popular_product_img" href="#">
                            <img src="http://edgerank.co.kr/wp-content/uploads/2016/11/22.png">
                            <div class="pb_store_popular_product_text">
                                <div class="pb_store_popular_product_title">
                                    <p>${pbList.name}</p>
                                </div>
                                <div class="pb_store_popular_product_price">
                                    <p>${pbList.price}</p>
                                </div>
                                <div class="pb_store_popular_product_rating">
                                    <span id="pb_store_popular_product_rating_star">★</span>
                                    <span>4.3</span>        
                                </div>
                            </div>
                        </a>
                    </c:forEach>
<!-- 
                        <a class="pb_store_popular_product_img" href="#">
                            <img src="https://us.123rf.com/450wm/baibakova/baibakova1609/baibakova160900188/63444373-%EC%95%8C%EB%A0%88%EB%A5%B4%EA%B8%B0-%EC%9D%8C%EC%8B%9D-%EA%B0%9C%EB%85%90%EC%9E%85%EB%8B%88%EB%8B%A4-%ED%9D%B0%EC%83%89-%EB%82%98%EB%AC%B4-%EB%B0%B0%EA%B2%BD%EC%97%90-%EC%95%8C%EB%A0%88%EB%A5%B4%EA%B8%B0-%EC%9D%8C%EC%8B%9D.jpg?ver=6">
                            <div class="pb_store_popular_product_text">
                                <div class="pb_store_popular_product_title">
                                    <p>식빵 세트</p>
                                </div>
                                <div class="pb_store_popular_product_price">
                                    <p>4,900</p>
                                </div>
                                <div class="pb_store_popular_product_rating">
                                    <span id="pb_store_popular_product_rating_star">★</span>
                                    <span>4.3</span>                
                                </div>
                            </div>
                        </a>
                        <a class="pb_store_popular_product_img" href="#">
                            <img src="https://t1.daumcdn.net/cfile/tistory/15298033513ECBD304">
                            <div class="pb_store_popular_product_text">
                                <div class="pb_store_popular_product_title">
                                    <p>야채 세트</p>
                                </div>
                                <div class="pb_store_popular_product_price">
                                    <p>9,900</p>
                                </div>
                                <div class="pb_store_popular_product_rating">
                                    <span id="pb_store_popular_product_rating_star">★</span>
                                    <span>4.3</span>                
                                </div>
                            </div>
                        </a>
                        <a class="pb_store_popular_product_img" href="#">
                            <img src="http://cfd.tourtips.com/@cms_800/2014062365/gjdrmb/%EC%89%91%EC%89%91%EB%B2%84%EA%B1%B0(%EB%89%B4%EC%9A%95%EC%9C%A0%EB%AA%85%ED%96%84%EB%B2%84%EA%B1%B0)_2.jpg">
                            <div class="pb_store_popular_product_text">
                                <div class="pb_store_popular_product_title">
                                    <p>쉑쉑버거</p>
                                </div>
                                <div class="pb_store_popular_product_price">
                                    <p>7,900</p>
                                </div>
                                <div class="pb_store_popular_product_rating">
                                    <span id="pb_store_popular_product_rating_star">★</span>
                                    <span>4.3</span>        
                                </div>
                            </div>
                        </a>
 -->
                     </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script>
        let index = 0;

        $(document).ready(function () {
            setInterval(function () {
                if (index == 4) index = 0;

                else index++;
                moveSlide();
            },2000);    
        }); 
        
        function moveSlide() {
            $("#pb_store_today_img").animate({left: index * -1000}, 3000);
        };
        
    </script>
</body>
</html>