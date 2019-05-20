<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>PB 스토어 상세 조회</title>
	<script src="<c:url value="/resources/js/editor.min.js"/>"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/header@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/list@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/embed@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/raw@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/simple-image@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/checklist@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/quote@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/image@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/simple-image@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/marker@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/table@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/warning@latest"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/store/detailpb.css"/>">
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body onload="myTimeWait()">
	<div id="pb_detail_container">
        <!-- 상단 컨테이너 -->
        <div id="pb_detail_header_container">
            <div id="pb_detail_header_images">
	                <div id="pb_detail_thumbnail_list">
<%--                 		<c:forEach var="detailpbIamge" items="${detailpbIamge}"> --%>
		                	<img src="">
<%-- 	                    	<img src="<c:url value="/store/downloadpb.do?path=${detailpbIamge.path}&sysname=${detailpbIamge.sysname}"/>"> --%>
<%--                 		</c:forEach> --%>
	                </div>
<%-- 			     <c:set var="detailpb" value="${detailpb}"/> --%>
	                <div id="pb_detail_main_image">
	                	<img src="">
<%-- 	                    <img src="<c:url value="/store/downloadpb.do?path=${detailpb.images[0].path}&sysname=${detailpb.images[0].sysname}"/>"> --%>
	                </div>
            </div>

            <div id="pb_detail_info">
                <div id="pb_detail_title">
                    <p>${storepb.name}</p>
                </div>
                <div id="pb_detail_rating_point">
                    <p>★★★★☆</p>
                </div>
                <div id="pb_detail_price">
                    <p id="pb_detail_price_p">${storepb.price}원</p>
                </div>
                <div id="pb_detail_promotion">
                    <p id="pb_detail_promotion_price"></p>
                    <p>&nbsp;적립해드립니다</p>
                </div>
                
                <div id="pb_detail_select_box">
                    <div id="select_product_title">${storepb.name}</div>
                    <div id="select_product_count">
                        <p><button id="count_minus">-</button></p>
                        <p id="total_count">1</p>
                        <p><button id="count_plus">+</button></p>
                        <p class="total__price">원</p>
                    </div>
                </div>
                <div id="select_product_total-price">
                    <p>총 주문금액</p>
                    <p class="total__price">원</p>
                </div>
                <div id="pb_detail_btns">
                    <button class="add_to_cart">장바구니</button>
                    <button class="buy_now">구매하기</button>
                </div>
            </div>
        </div>
        
        <!-- 메뉴바 -->
        <div id="pb_detail_menubar">
            <div id="detail_product_info"><a href="#pb_info_move">&nbsp;상품정보&nbsp;</a></div>
            <div id="detail_product_review"><a href="#pb_review_header">&nbsp;리뷰&nbsp;</a></div>
            <div id="detail_product_inquire"><a href="#pb_review_inquire_detail">&nbsp;문의&nbsp;</a></div>
            <div id="detail_product_refund"><a href="#product_info_detail">&nbsp;배송/교환/환불&nbsp;</a></div>
        </div>
        
        <a id="pb_info_move"></a>
        <div id="product_info_detail" >
        	<div id="product_info">상품정보<br><br></div><br><br><br>
        </div>
        <!--  editor js 적용 -->
		<div id="hiddenValue" style="display:none">${storepb.content}</div>
		<div id="post-body"></div>		
        
        
<!--         editor js 적용 전 -->
        <!-- 상품설명 ~ 후기 ~ 문의 ~ 배송/교환/환불 -->
<!--         <div id="pb_detail_body_container" name="product_info_detail"> -->
            <!-- 상품설명 -->
            <!-- 
            <div id="product_info_detail" >
                <div id="product_info">상품정보<br><br></div><br><br><br>
                <c:forEach var="detailImg" items="${detailpbIamge}">
                <div id="product_info_img">
                    <img src="downloadpb.do?path=${detailImg.path}&sysname=${detailImg.sysname}">
                </div>
                </c:forEach>
                <div id="product_info_content">
                    <p>
                        ${detailpb.content}
                    </p>
                </div>
                 -->
                <!-- 
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
                 -->
<!--             </div> -->

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
            
                <!-- modal -->
    <div id="reviewmodal" class="modal fade" tabindex="-1" >
        <div class="moadl-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">x</button>
                    <p class="modal-title">후기 작성</p>
                </div>
                <div class="modal-body">
                    <div class="pb_insertform_container">
                        <div class="pb_product_item">
                            <div class="pb_product_item_img">
                                <img src="images/foodthumbnail1.jpg">
                            </div>
                            <div class="pb_product_item_info">
                                <p class="pb_product_item_name">${storepb.name}</p>
                            </div>
                        </div>
                        <div class="pb_product_item_rating">
                            <p class="rating_msg">별점을 눌러 만족도를 알려주세요.</p>
                            <div id="reviewStars-input">
                                <input id="star-4" type="radio" name="reviewStars"/>
                                <label title="gorgeous" for="star-4"></label>
                            
                                <input id="star-3" type="radio" name="reviewStars"/>
                                <label title="good" for="star-3"></label>
                            
                                <input id="star-2" type="radio" name="reviewStars"/>
                                <label title="regular" for="star-2"></label>
                            
                                <input id="star-1" type="radio" name="reviewStars"/>
                                <label title="poor" for="star-1"></label>
                            
                                <input id="star-0" type="radio" name="reviewStars"/>
                                <label title="bad" for="star-0"></label>
                            </div>
                        </div>
                        <div class="pb_product_image">
                            <div class="image_container"></div>
                            <div class="image_choice">
                                <label for="product_img_file">사진을 선택해주세요</label>
                                <input type="file" name="product_img_file" id="product_img_file">
                            </div>
                        </div>
                        <div class="pb_product_content">
                            <textarea name="product__content" class="product__content" cols="50" rows="15" placeholder="후기를 작성해주세요."></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-insert" id="insertmodalbtn">등록</button>
                </div>
            </div>
        </div>
    </div>
        
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

    <script>
    $(document).ready(function () {
    	$("#reviewmodal").modal("hide");
    });
    
    $("#pb_review_writeform").click(function () {
      alert("modal 켜진다");
      $("#reviewmodal").modal("show");
    });
    
    $("#reviewmodal").modal({
      backdrop: 'static'
    });

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
      });
      
      // 수량 늘리기 줄이기.
      let price = parseInt($("#pb_detail_price_p").text().replace(",",""));
      
      $("#pb_detail_promotion_price").html(price * 0.01 + " POINT");
      
      let cnt = $("#total_count").html();
      $(".total__price").text(price * cnt + "원");
      
      $("#count_plus").click(function () {
          cnt++;
          console.log(cnt);
        $("#total_count").text(cnt);
        $(".total__price").text(price * cnt + "원");
      });

      $("#count_minus").click(function () {
        if (cnt == 1) {
            alert("주문 개수는 1개 이상이어야 합니다.");
            return;
        }
        cnt--;
        $("#total_count").text(cnt);
        $(".total__price").text(price * cnt + "원");
      });
      
      $(function() {
          $("#product_img_file").on("change", function() {
            var files = !!this.files ? this.files : [];
            if (!files.length || !window.FileReader) return;
            if (/^image/.test(files[0].type)) {
              var reader = new FileReader();
              reader.readAsDataURL(files[0]);
              reader.onloadend = function() {
                $(".image_container").css({
                  "background-image":
                  "url(" + this.result + ")",
                  "background-size":
                  "contain",
                  "background-repeat":
                  "no-repeat",
                }
                );
              };
            }
          });
        });
      
      // editor js 적용
      const value = $("#hiddenValue").text();
      const editor = new EditorJS({
          holderId: 'post-body',

          autofocus: false,
          data: JSON.parse(value),
          tools: { 
              warning: {
                  class: Warning,
                  inlineToolbar: true,
              },
   
              table: {
                  class: Table,
                  inlineToolbar: true,
              },                       
              quote: {
                  class: Quote,
                  inlineToolbar: true,
              },
				image: {
                  class: ImageTool,
              },            

              header: {
                  class: Header,
              }, 
              checklist: {
                  class: Checklist,
              },
              marker: {
                  class: Marker,
              },
              list: {
                  class: List,
              },
              embed: {
                  class: Embed,
              }
          }
      });
		
     function myTimeWait(){
	   
  	   	console.log($("#post-body").width() + " " + $("#post-body").height());
  	   	$("#post-body").append($("<div></div>").css({zIndex:"50","position":"absolute","width":"100%","height":"100%",top:"0px",left:"0px",background:"rgba(0,0,0,0)"}));	    
     }
    </script>
</body>
</html>