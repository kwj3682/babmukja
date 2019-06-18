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
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/store/mainpb.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/js/dist/css/swiper.min.css"/>">
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
</head>
<body>
	<div class="swiper-container">
        <div class="swiper-wrapper">
   			<c:forEach var="pbList" items="${storepb}" begin="0" end="4">
	            <div class="swiper-slide">
	            	<div></div>
		            <p>"BABMUKJA PB STORE"</p>
	             	<img src="${pbList.imgPath}" onerror="this.src='${pageContext.request.contextPath}/resources/images/foodthumbnail1.jpg'"/>	
	            </div>
			</c:forEach>
        </div>
        <!-- Add Scrollbar -->
        <div class="swiper-scrollbar"></div>
        
    </div>
    <!-- PB스토어 메인화면 -->
  <div id="pb_store_container"> 

        <!-- 키워드 -->
        <div id="pb_store_popular_keyword">
            <div id="pb_sotre_popular_keyword_text">KEYWORD<br><br></div>
            
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
    
    </div>
            <!-- 인기 상품 -->
        
            <div class="product_con">
        <div id="pb_store_popular_product">
            <div id="pb_store_popular_product_header">
                <div id="pb_store_popular_product_text">PRODUCTS<br><br></div>
<!--                 <button id="pb_store_popular_product_btn">더보기<br><br></button> -->
            </div><br>
            
            <!-- 인기상품 이미지 -->
            <div id="pb_store_popular_product_img">
                <div id="pb_store_popular_product_imges">
                <a class="pb_store_more_product" href="<c:url value='/store/listpb.do'/>">더보기</a>
                    <div id="pb_store_popular_product_imges_grid">
                    <c:forEach var="pbList" items="${storepb}" begin="0" end="3">
                        <a class="pb_store_popular_product_img" href="<c:url value="/store/detailpb.do?pbNo=${pbList.pbNo}"/>">
                            <img src="${pbList.imgPath}" onerror="this.src='${pageContext.request.contextPath}/resources/images/foodthumbnail1.jpg'"/>
                            <div class="pb_store_popular_product_text">
                                <div class="pb_store_popular_product_title">
                                    <p>${pbList.name}</p>
                                </div>
                                <div class="pb_store_popular_product_price">
                                    <p><fmt:formatNumber value="${pbList.price}" groupingUsed="true"/>원</p>
                                </div>
		                        <div class="pb_list_product_rating">
		                            <span id="pb_store_popular_product_rating_star"></span>
		                            <span class="pb_store_popular_rating_cnt"><fmt:formatNumber value="${pbList.rating}" pattern="#.##"/></span>
	                            	<img class="likeheart" src="<c:url value='/resources/images/icons/like2.png'/>">
	                            	<span class="likeheartCnt">${pbList.likeCnt}</span>
	                            	<i class="far fa-eye" id="viewCntIcon"><span class="PBviewCnt">${pbList.viewCnt}</span></i>
		                        </div>
                            </div>
                        </a>
                    </c:forEach>
                     </div>
                </div>
            </div>
        </div>
       </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/dist/js/swiper.min.js"/>"></script>
    <script>
        
        var swiper = new Swiper('.swiper-container', {
            loop:true,
            autoplay: {
            delay: 4500,
            disableOnInteraction: false,
            },
            scrollbar: {
            el: '.swiper-scrollbar',
            hide: true,
            },
        });
    </script>
</body>
</html>