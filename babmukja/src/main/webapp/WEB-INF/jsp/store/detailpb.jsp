<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/store/detailpb.css"/>">
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
</head>
<body>
<div id="pb_detail_container">
        <!-- 상단 컨테이너 -->
        <div id="pb_detail_header_container">
            <div id="pb_detail_header_images">
                <div id="pb_detail_thumbnail_list">
                    <img src="images/foodthumbnail14.jpg">
                    <img src="images/foodthumbnail15.jpg">
                    <img src="images/foodthumbnail17.jpg">
                    <img src="images/foodthumbnail20.jpg">
                </div>
                <div id="pb_detail_main_image">
                    <img src="images/foodthumbnail1.jpg">
                </div>
            </div>

            <div id="pb_detail_info">
                <div id="pb_detail_title">
                    <p>인기 샐러드</p>
                </div>
                <div id="pb_detail_rating_point">
                    <p>★★★★☆</p>
                </div>
                <div id="pb_detail_price">
                    <p>17,900원</p>
                </div>
                <div id="pb_detail_promotion">
                    <p>179P</p>
                    <p>적립해드립니다</p>
                </div>
                
                <div id="pb_detail_select_product">
                    <select name="select_title">
                        <option value="0">상품을 선택해주세요</option>
                        <option value="1">인기 샐러드</option>
                    </select>
                </div>
                <div id="pb_detail_select_box">
                    <div id="select_product_title">인기 샐러드</div>
                    <div id="select_product_count">
                        <p><button>-</button></p>
                        <p>1</p>
                        <p><button>+</button></p>
                        <p>17,900원</p>
                    </div>
                </div>
                <div id="select_product_total-price">
                    <p>총 주문금액</p>
                    <p class="total__price">17,900원</p>
                </div>
                <div id="pb_detail_btns">
                    <button class="add_to_cart">장바구니</button>
                    <button calss="buy_now">구매하기</button>
                </div>
            </div>
        </div>
        
        <!-- 메뉴바 -->
        <div id="pb_detail_menubar">
            <div id="detail_product_info"><a href="#product_info_detail">&nbsp;상품정보&nbsp;</a></div>
            <div id="detail_product_review"><a href="#pb_review_detail">&nbsp;리뷰&nbsp;</a></div>
            <div id="detail_product_inquire"><a href="#pb_review_inquire_detail">&nbsp;문의&nbsp;</a></div>
            <div id="detail_product_refund"><a href="#product_info_detail">&nbsp;배송/교환/환불&nbsp;</a></div>
        </div>
        <!-- 상품설명 ~ 후기 ~ 문의 ~ 배송/교환/환불 -->
        <div id="pb_detail_body_container" name="product_info_detail">
            <!-- 상품설명 -->
            <div id="product_info_detail" >
                <div id="product_info">상품정보<br><br></div><br><br><br>
                <div id="product_info_img">
                    <img src="images/foodthumbnail1.jpg">
                </div>
                <div id="product_info_content">
                    <p>
                        상품의 정보를 작성해주세요~~
                        상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~
                    </p>
                </div>
                <div id="product_info_img">
                    <img src="images/foodthumbnail14.jpg">
                </div>
                <div id="product_info_content">
                    <p>
                        상품의 정보를 작성해주세요~~
                        상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~
                    </p>    
                </div>
                <div id="product_info_img">
                    <img src="images/foodthumbnail15.jpg">
                </div>
                <div id="product_info_content">
                    <p>
                        상품의 정보를 작성해주세요~~
                        상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~상품의 정보를 작성해주세요~~
                    </p>    
                </div>
            </div>

            <!-- 후기 -->
            <div id="pb_review_detail" name="pb_review_detail">
                <div id="pb_review_header">
                    <div id="pb_review">후기<br><br></div><br><br>
                    <button id="pb_review_writeform">후기쓰기</button>
                </div>

                <div id="pb_review_body">
                    <!-- 후기 프로필 -->
                    <div id="pb_review_profile">
                        <div id="pb_review_profile_img">
                            <img src="images/profile5.jpg">
                        </div>
                        <div id="pb_review_user_info">
                            <p class="review_user_nickname">주부9단빛찬맘</p>
                            <p class="review_user_rating">★★★★☆<span>7분 전</span></p>
                        </div>
                    </div>
                    <!-- 리뷰 사진 및 내용 -->
                    <div id="pb_review_select">
                        <div id="pb_review_select_img">
                            <img src="images/foodthumbnail16.jpg">
                        </div>
                        <div id="pb_review_select_content">
                            <p>맛있어요~~</p>
                        </div>
                    </div>
                    <div id="review_border-bottom"></div>
                </div>  <!-- pb_review_body 끝-->
                
                <div id="pb_review_body">
                    <!-- 후기 프로필 -->
                    <div id="pb_review_profile">
                        <div id="pb_review_profile_img">
                            <img src="images/profile3.jpg">
                        </div>
                        <div id="pb_review_user_info">
                            <p class="review_user_nickname">갓-중</p>
                            <p class="review_user_rating">★★★☆☆<span>7분 전</span></p>
                        </div>
                    </div>
                    <!-- 리뷰 사진 및 내용 -->
                    <div id="pb_review_select">
                        <div id="pb_review_select_img">
                            <img src="images/foodthumbnail15.jpg">
                        </div>
                        <div id="pb_review_select_content">
                            <p>맛있어요~~</p>
                        </div>
                    </div>
                    <div id="review_border-bottom"></div>
                </div>  <!-- pb_review_body 끝-->

                <div id="pb_review_body">
                    <!-- 후기 프로필 -->
                    <div id="pb_review_profile">
                        <div id="pb_review_profile_img">
                            <img src="images/profile9.jpg">
                        </div>
                        <div id="pb_review_user_info">
                            <p class="review_user_nickname">나는야 김렁래</p>
                            <p class="review_user_rating">★★★★☆<span>7분 전</span></p>
                        </div>
                    </div>
                    <!-- 리뷰 사진 및 내용 -->
                    <div id="pb_review_select">
                        <div id="pb_review_select_img">
                            <img src="images/foodthumbnail17.jpg">
                        </div>
                        <div id="pb_review_select_content">
                            <p>맛있어요~~</p>
                        </div>
                    </div>
                    <div id="review_border-bottom"></div>
                </div>  <!-- pb_review_body 끝-->
                
                <!-- 후기 페이징 -->
                <div id="pb_review_page">
                    <p>1</p>
                    <p>2</p>
                    <p>3</p>
                    <p>4</p>
                    <p>5</p>
                </div>
            </div> <!-- 후기 끝 -->
        
            <!-- 문의 -->
            <div id="pb_review_inquire_detail" name="pb_review_inquire_detail">
                <div id="pb_review_inquire_header">
                    <div id="pb_review_inquire">문의<br><br></div><br><br>
                    <button id="pb_inquire_writeform">문의하기</button>
                </div>
                
                <!-- 문의 내용 -->
                <div id="pb_inquire_body">
                        <div id="pb_inquire_profile">
                            <div id="pb_inquire_nickname">
                                <p id="pb_inquire_user_nickname">주부9단빛찬맘</p>
                                <p id="pb_inquire_user_regdate">2019.05.05</p>
                            </div>
                            <div id="pb_inquire_Q&A">
                                <p>Q<span id="pb_inquire_question">상품을 오늘 주문하면 언제 받을 수 있나요?</span></p>
                                <p>A<span id="pb_inquire_answer">관리자 답변<span><span id="pb_inquire_admin_regdate">2019.05.05</span></p>
                                <p id="pb_inquire_admin_msg">안녕하세요 고객님</p>
                                <p id="pb_inquire_answer_content">오늘 상품을 주문하시면 3일 이내 배송 받으실 수 있습니다.</p>
                            </div>                 
                        </div> 
                    <div id="pb_inquire_boder-bottom"></div> 
                </div> <!-- 문의 내용 끝-->
                <!-- 문의 내용 -->
                <div id="pb_inquire_body">
                        <div id="pb_inquire_profile">
                            <div id="pb_inquire_nickname">
                                <p id="pb_inquire_user_nickname">주부9단빛찬맘</p>
                                <p id="pb_inquire_user_regdate">2019.05.05</p>
                            </div>
                            <div id="pb_inquire_Q&A">
                                <p>Q<span id="pb_inquire_question">상품을 오늘 주문하면 언제 받을 수 있나요?</span></p>
                                <p>A<span id="pb_inquire_answer">관리자 답변<span><span id="pb_inquire_admin_regdate">2019.05.05</span></p>
                                <p id="pb_inquire_admin_msg">안녕하세요 고객님</p>
                                <p id="pb_inquire_answer_content">오늘 상품을 주문하시면 3일 이내 배송 받으실 수 있습니다.</p>
                            </div>                 
                        </div> 
                    <div id="pb_inquire_boder-bottom"></div> 
                </div> <!-- 문의 내용 끝-->
                <!-- 문의 내용 -->
                <div id="pb_inquire_body">
                        <div id="pb_inquire_profile">
                            <div id="pb_inquire_nickname">
                                <p id="pb_inquire_user_nickname">주부9단빛찬맘</p>
                                <p id="pb_inquire_user_regdate">2019.05.05</p>
                            </div>
                            <div id="pb_inquire_Q&A">
                                <p>Q<span id="pb_inquire_question">상품을 오늘 주문하면 언제 받을 수 있나요?</span></p>
                                <p>A<span id="pb_inquire_answer">관리자 답변<span><span id="pb_inquire_admin_regdate">2019.05.05</span></p>
                                <p id="pb_inquire_admin_msg">안녕하세요 고객님</p>
                                <p id="pb_inquire_answer_content">오늘 상품을 주문하시면 3일 이내 배송 받으실 수 있습니다.</p>
                            </div>                 
                        </div> 
                    <div id="pb_inquire_boder-bottom"></div> 
                </div> <!-- 문의 내용 끝-->
                <!-- 문의 내용 -->
                <div id="pb_inquire_body">
                        <div id="pb_inquire_profile">
                            <div id="pb_inquire_nickname">
                                <p id="pb_inquire_user_nickname">주부9단빛찬맘</p>
                                <p id="pb_inquire_user_regdate">2019.05.05</p>
                            </div>
                            <div id="pb_inquire_Q&A">
                                <p>Q<span id="pb_inquire_question">상품을 오늘 주문하면 언제 받을 수 있나요?</span></p>
                                <p>A<span id="pb_inquire_answer">관리자 답변<span><span id="pb_inquire_admin_regdate">2019.05.05</span></p>
                                <p id="pb_inquire_admin_msg">안녕하세요 고객님</p>
                                <p id="pb_inquire_answer_content">오늘 상품을 주문하시면 3일 이내 배송 받으실 수 있습니다.</p>
                            </div>                 
                        </div> 
                    <div id="pb_inquire_boder-bottom"></div> 
                    <!-- 문의 페이징 -->
                    <div id="pb_inquire_page">
                        <p>1</p>
                        <p>2</p>
                        <p>3</p>
                        <p>4</p>
                        <p>5</p>
                    </div>
                </div> <!-- 문의 내용 끝-->
            </div>
        </div>

    </div>
    <script>
        $("a[href^='#']").click(function (event) {
            event.preventDefault();
            var target = $(this.hash);
            $('html, body').animate({scrollTop: target.offset().top}, 500);
        });

      $(document).ready(function () {
          var topBar = $("#pb_detail_menubar").offset();

          $(window).scroll(function () {
            var docScrollY = $(document).scrollTop()
            var barThis = $("#pb_detail_menubar")

            if (docScrollY > topBar.top) {
                barThis.addClass("top_bar_fix");
            } else {
                barThis.removeClass("top_bar_fix");
            }
          });
      })
    </script>
</body>
</html>