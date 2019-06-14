<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet"
	href="<c:url value="/resources/css/store/detailpb.css"/>">
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/js/dist/css/lightbox.css"/>">
<script src="<c:url value="/resources/js/dist/js/lightbox.js"/>"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/js/common/stringUtil.js"/>"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body onload="myTimeWait()">
	<div id="pb_detail_container">
	<input type="hidden" id="hiddenRatingCnt" value="${storepb.ratingCnt}">
		<!-- 상단 컨테이너 --> 
		<div id="pb_detail_header_container">
			<div id="pb_detail_header_images">
				<div id="pb_detail_thumbnail_list">
					<c:forEach var="img" items="${imgList}" varStatus="status">

						<c:if test="${status.count != 1}">
							<a href="${img}" data-lightbox="gallery"> <img src="${img}">
							</a>
						</c:if>

					</c:forEach>
				</div>
				<%-- 			     <c:set var="detailpb" value="${detailpb}"/> --%>
				<div id="pb_detail_main_image">
					<a href="${imgList[0]}" data-lightbox="gallery"> <img
						src="${imgList[0]}">
					</a>
				</div>
			</div>

			<div id="pb_detail_info">
				<div id="pb_detail_title">
					<p>${storepb.name}</p>
				</div>
				<div id="pb_detail_rating_point">
					<div class="storeRating">
					<input type="hidden" value="${storepb.rating}" name="storeRating">
						<div class="storeRating-backStar"></div>
						<div class="storeRating-frontStar-wrapper">
						<div class="storeRating-frontStar" style="width:${storepb.rating *20}%;"></div>

						</div>
					</div>
				</div>
				<div id="pb_detail_price">

					<p id="pb_detail_price_p">
						<fmt:formatNumber value="${storepb.price}" groupingUsed="true" />
						원
					</p>
				</div>
				<div id="pb_detail_promotion">
					<p id="pb_detail_promotion_price"></p>
					<p>&nbsp;적립해드립니다</p>
				</div>

				<div id="pb_detail_select_box">
					<div id="select_product_title">${storepb.name}</div>
					<div id="select_product_count">
						<p>
							<button id="count_minus">-</button>
						</p>
						<p id="total_count">1</p>
						<p>
							<button id="count_plus">+</button>
						</p>
						<p class="total__price">원</p>
					</div>
				</div>
				<div id="select_product_total-price">
					<p>총 주문금액</p>
					<p class="total__price" id="total__price">원</p>
				</div>
				<div id="pb_detail_btns">
               	<input type="hidden" name="memhidden" value="${sessionScope.user.memNo}">
					<button class="add_to_cart">장바구니</button>
					<button class="buy_now">구매하기</button>
				</div>
			</div>
		</div>

		<!-- 메뉴바 -->
		<div id="pb_detail_menubar">
			<div id="detail_product_info">
				<a href="#pb_info_move">&nbsp;상품정보&nbsp;</a>
			</div>
			<div id="detail_product_review">
				<a href="#pb_review_header">&nbsp;후기&nbsp;</a>
			</div>
			<div id="detail_product_inquire">
				<a href="#pb_review_inquire_detail">&nbsp;문의&nbsp;</a>
			</div>
			<div id="detail_product_refund">
				<a href="#product_info_detail">&nbsp;배송/교환/환불&nbsp;</a>
			</div>
		</div>

		<a id="pb_info_move"></a>
		<div id="product_info_detail">
			<div id="product_info">
				상품정보<br>
				<br>
			</div>
			<br>
			<br>
			<br>
		</div>
		<!--  editor js 적용 -->
		<div id="hiddenValue" style="display: none">${storepb.content}</div>
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
		<div id="pb_review_detail">
			<div id="pb_review_header">
				<div id="pb_review">
					후기<br>
					<br>
				</div>
				<br>
				<br>
				<button id="pb_review_writeform">후기쓰기</button>
			</div>

			<div class="review_con">
				<c:forEach var="reviewList" items="${reviewMap}">
					<div class="pb_review_body"
						id='${reviewList.reviewList.pbReviewNo}'>
						<!-- 후기 프로필 -->
						<div class="pb_review_profile">
							<div class="pb_review_profile_img">
								<img src="<c:url value='/resources/images/profile19.jpg'/>">
							</div>
							<div class="pb_review_user_info">

								<div class="user_info_sec1">
									<p class="review_user_nickname">${reviewList.member.memNickname}</p>
									<div class="reviewBUTTON">
										<input type="hidden" name="pbReviewNo"
											value="${reviewList.reviewList.pbReviewNo}">
										<button class="reviewUpdateBTN">수정</button>
										<button class="reviewDeleteBTN">삭제</button>
									</div>
								</div>

								<div class="user_info_sec2">
									<div class="stars">
										<div class="backStar"></div>
										<div class="frontStar-wrapper">
											<div class="frontStar"
												style="width:${reviewList.reviewList.rating*24}px;"></div>
										</div>
									</div>
									<div>
										<fmt:formatDate value="${reviewList.reviewList.regDate}"
											pattern="yyyy.MM.dd hh:mm:ss" />
									</div>
								</div>

							</div>
						</div>
						<!-- 리뷰 사진 및 내용 -->
						<div class="pb_review_select">
							<div class="pb_review_select_content">
								<p>${reviewList.reviewList.content}</p>
							</div>
							<div class="pb_review_select_img">
								<c:forEach var="file" items="${reviewList.reviewFile}">
									<div>
										<a
											href="downloadpb.do?path=${file.path}&sysname=${file.sysname}"
											data-lightbox="mygallery"> <img
											src="downloadpb.do?path=${file.path}&sysname=${file.sysname}">
										</a>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<!-- pb_review_body 끝-->
				</c:forEach>
			</div>
			<c:if test="${empty reviewMap}">
				<p class="reviewMSG">후기가 존재하지 않습니다.</p>
				<p class="reviewMSG2">새 후기를 작성해주세요 !</p>
			</c:if>
		</div>
		<!-- 후기 끝 -->


		<!-- modal -->
		<form method="POST" enctype="multipart/form-data">
			<div id="reviewmodal" class="modal fade" tabindex="-1">
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
										<img src="${imgList[0]}">
									</div>
									<div class="pb_product_item_info">
										<p class="pb_product_item_name">${storepb.name}</p>
									</div>
								</div>
								<div class="pb_product_item_rating">
									<p class="rating_msg">별점을 눌러 만족도를 알려주세요.</p>
									<div class="check-stars">
										<div class="check-backStar"></div>
										<div class="check-frontStar-wrapper">
											<div class="check-frontStar"></div>
										</div>
									</div>
								</div>

								<div class="pb_reviewMap">
									<div class="pb_product_content">
										<textarea name="content" class="product__content" cols="60"
											rows="10" placeholder="상품에 대한 솔직한 후기가 궁금해요!"></textarea>
										<p class="review_images_msg">아래 + 를 눌러 이미지를 등록해주세요.</p>
									</div>
									<div class="review_images">
										<input type="file" name="img_file" id="img_file">
										<div id="preview_img_div">
											<div class="imgPlus">+</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-insert" id="insertmodalbtn">등록</button>
						</div>
					</div>
				</div>
			</div>
		</form>


		<!-- 문의 -->
		<div id="pb_review_inquire_detail">
			<div id="pb_review_inquire_header">
				<div id="pb_review_inquire">
					문의<br>
					<br>
				</div>
				<br>
				<br>
				<button id="pb_inquire_writeform">문의하기</button>
			</div>

			<!-- 문의 내용 -->
			<div class="inquiry_con">
				<c:forEach var="inqList" items="${inqList}">
					<div class="pb_inquire_body" id="${inqList.inquiryNo}">
						<div id="pb_inquire_profile">
							<div id="pb_inquire_nickname">
								<p id="pb_inquire_user_nickname">
									${inqList.member.memNickname} <input type="hidden"
										name="inquiryNo" value="${inqList.inquiryNo}">
									<button class="inq_update_btn">수정</button>
									<button class="inq_delete_btn">삭제</button>
								</p>
								<p id="pb_inquire_user_regdate">
									<fmt:formatDate value="${inqList.inquiryRegdate}"
										pattern="yyyy-MM-dd hh:mm:ss" />
								</p>
							</div>
							<div id="pb_inquire_Q&A">
								<p>
									Q<span id="pb_inquire_question">${inqList.content}</span>
								</p>
								<p>
									A<span id="pb_inquire_answer">관리자 답변</span><span
										id="pb_inquire_admin_regdate">2019.05.05</span>
								</p>
								<p id="pb_inquire_admin_msg">안녕하세요 고객님</p>
								<p id="pb_inquire_answer_content">오늘 상품을 주문하시면 3일 이내 배송 받으실
									수 있습니다.</p>
							</div>
						</div>
						<div id="pb_inquire_boder-bottom"></div>
					</div>
					<!-- 문의 내용 끝-->
				</c:forEach>
			</div>
			<c:if test="${empty inqList}">
				<p class="reviewMSG">문의가 존재하지 않습니다.</p>
				<p class="reviewMSG2">문의를 등록해주세요 !</p>
			</c:if>
		</div>
	</div>

	<!-- 문의 등록 modal -->
	<div id="inquiremodal" class="modal fade" tabindex="-1">
		<div class="moadl-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">x</button>
					<p class="modal-title">문의 작성</p>
				</div>
				<div class="modal-body">
					<div class="pb_insertform_container">
						<div class="pb_product_item">
							<div class="pb_product_item_img">
								<img src="${imgList[0]}">
							</div>
							<div class="pb_product_item_info">
								<p class="pb_product_item_name">${storepb.name}</p>
							</div>
						</div>

						<div class="pb_reviewMap">
							<div class="pb_product_content">
								<textarea name="content" class="inquire__content" cols="60"
									rows="10" placeholder="상품에 대해 문의해주세요!"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-insert"
						id="inquireInsertmodalbtn">등록</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 문의 수정 modal -->
	<div id="inquireupdatemodal" class="modal fade" tabindex="-1">
		<div class="moadl-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">x</button>
					<p class="modal-title">문의 수정</p>
				</div>
				<div class="modal-body">
					<div class="pb_insertform_container">
						<div class="pb_product_item">
							<div class="pb_product_item_img">
								<img src="${imgList[0]}">
							</div>
							<div class="pb_product_item_info">
								<p class="pb_product_item_name">${storepb.name}</p>
							</div>
						</div>

						<div class="pb_reviewMap">
							<div class="pb_product_content">
								<textarea name="content" class="inquire__update__content"
									cols="60" rows="10" placeholder="상품에 대해 문의해주세요!"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-insert"
						id="inquireUpdatemodalbtn">수정</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 장바구니  modal -->
	<div id="cartmodal" class="modal fade" tabindex="-1">
		<div class="moadl-dialog">
			<div class="modal-content" id="cart-modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal">x</button>
					<div class="cartmodal_container">
						<div class="cartmodal_header">
							<p class="cartmodal_msg">장바구니에 상품을 담았습니다.</p>
							<div class="cartmodal_button">
								<div>
									<button class="cart_move_btn">장바구니 보러가기</button>
								</div>
								<div>
									<button class="cart_move_not_btn">계속 쇼핑하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
    let imgArr= ["a","b","c","d","e","f","g","h","i","j"];
    
    $(document).ready(function () {
    	$("#reviewmodal").modal("hide");
    	$("#reviewUpdatemodal").modal("hide");
    	$("#inquiremodal").modal("hide");
    	$("#inquireupdatemodal").modal("hide");
    	$("#cartmodal").modal("hide");
//     	let num = $("input[name='pbReviewNo']").val();
//     	console.log(num);
//     	console.log($(".review_user_rating").text());
//     	console.log($(".reviewScore").text());
//     	console.log($(".reviewScore").val());
//     	console.log($(".reviewScore").html());
//     	console.dir($(".pb_review_body").val());
    });
    
    
    
    $("#pb_review_writeform").click(function () {
    	if ('${sessionScope.user}' != "") {
  	      $("#reviewmodal").modal("show");
      	} else {
      		alert("로그인 후 이용 가능합니다.");
      	}
    });
    
    $("#reviewmodal").modal({
      backdrop: 'static'
    });

    $("#reviewUpdatemodal").modal({
      backdrop: 'static'
    });
    
    $("#inquiremodal").modal({
    	backdrop: 'static'
    })
    
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
      let price = parseInt($("#pb_detail_price_p").text().replace(/,/g,""));
      
      $("#pb_detail_promotion_price").html(price * 0.01 + " POINT");
      $("#pb_detail_promotion_price").text(changeComma($("#pb_detail_promotion_price").text()));
      
      let cnt = $("#total_count").html();
      $(".total__price").text(price * cnt + "원");
      $(".total__price").text(changeComma($(".total__price:first").text()));
      $("#count_plus").click(function () {
          cnt++;
          console.log(cnt);
        $("#total_count").text(cnt);
        $(".total__price").text(price * cnt + "원");
	      console.log($(".total__price").html());
	      $(".total__price").text(changeComma($(".total__price:first").text()));
      });

      $("#count_minus").click(function () {
        if (cnt == 1) {
            alert("주문 개수는 1개 이상이어야 합니다.");
            return;
        }
        cnt--;
        $("#total_count").text(cnt);
        $(".total__price").text(price * cnt + "원");
        $(".total__price").text(changeComma($(".total__price:first").text()));
        
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
	
      // editor.js 커버 div
     function myTimeWait(){
	   
  	   	console.log($("#post-body").width() + " " + $("#post-body").height());
  	   	$("#post-body").append($("<div></div>").css({zIndex:"50","position":"absolute","width":"100%","height":"100%",top:"0px",left:"0px",background:"rgba(0,0,0,0)"}));	    
     }

     // 후기 모달 이미지 부분
   	   let index = 0;
       $(".imgPlus").click(function () {
          $("#img_file").click();
       });
     
		let imgCnt = 0;
		
		let idx = 0;
		let fileList = {};
		
		let reviewData = new FormData();
		
       $("#img_file").change(function (e) {
   	   	  let path = $(this).val();
   	   	  console.dir(e.target.files[0]);
//    	   		console.log(imgArr.pop());
//    	   		console.log(imgArr);
// 		  fileList.push(e.target.files[0]);
		  let imgKey = imgArr.pop();
		  fileList[imgKey] = e.target.files[0];
		  console.log(fileList);
		  idx++;
//    	   	reviewData.append("imageList", e.target.files[0]); 여기서 말고

			var reader = new FileReader();
            reader.readAsDataURL(e.target.files[0]);


            reader.onload = function () {
                var tempImage = new Image();
                
                tempImage.src = reader.result;
                
                tempImage.onload = function () {
                    var canvas = document.createElement('canvas');
                    var canvasContext = canvas.getContext("2d");

                    canvas.width = 100;
                    canvas.height = 100;

                    canvasContext.drawImage(this, 0, 0, 100, 100);
                    
                    var dataURI = canvas.toDataURL("image/jpeg");
	
					imgCnt++;
                    var imgTag = "<div class='image_box' id='idx"+idx+"'><img name='preview_img"+imgCnt+"' class='preview_img' src='"+dataURI+"'/><div id='"+imgKey+"' class='preview_img_btn' >x</div></div>";
						
                    if(fileList.length == 10){
                    	$(".imgPlus").hide();
                    }
                    
                    $("#preview_img_div").prepend(imgTag);
					
                    if(fileList.length > 3){						
	                    $(".modal-backdrop").css({height:"1100px"});
					}
                };
            };
            
            
       });



       // review 등록 - 체크포인트
       $("#insertmodalbtn").click(function () {
    	   let content = $(".product__content").val();
    	   let pbNo = ${storepb.pbNo};
    	   let rating = $("input[name='reviewStars']:checked").val();
    	   let ratingCnt = $("#hiddenRatingCnt").val();
    	   let storeRating = $("input[name='storeRating']").val();
    	   console.log(rating);
    	   reviewData.append("content",content );
    	   reviewData.append("pbNo", pbNo);
    	   reviewData.append("rating", checkedValue);
    	   reviewData.append("ratingCnt", ratingCnt);
    	   reviewData.append("storeRating", storeRating );
    	   console.log( Object.keys(fileList).length + "길이");
    	   for(key in fileList){
    		   reviewData.append("imageList", fileList[key]);
    	   }
			$.ajax({
				type:"POST",
				processData:false,
				contentType:false,
				url : "/babmukja/store/pbreviewinsert.do",
				data : reviewData,
				success: function(avg){
					alert("후기가 등록되었습니다.");
					location.href="detailpb.do?pbNo="+${storepb.pbNo};
				}
			});
       });
       
       // review 삭제
       $(".reviewDeleteBTN").click(function () {
//     		let pbNo = ${storepb.pbNo};
   	  		let num = $(this).siblings("input[name='pbReviewNo']").val();
   	  		console.log(num.length);
   	  		$.ajax({
   	  			url: "/babmukja/store/pbreviewdelete.do",
   	  			data: {
   	  				pbReviewNo : num
   	  			}
   	  		}).done(function(response) {
   	  			if ($(".pb_review_body").length == 1) {
	   	  			$(".review_con").html("<p class='reviewMSG'>후기가 존재하지 않습니다.</p><p class='reviewMSG2'>새 후기를 작성해주세요 !</p>");
   	  			}
   	  			$("#" + num).remove();
   	  		});
       });
       
       // review 수정
      $(document).on("click",".reviewUpdateBTN",function () {
          $("#reviewmodal").modal("show");

      });
       
		$(document).on("click",".preview_img_btn",function () {
			let key = $(this).attr("id");
			delete fileList[key];
			console.log(fileList);
			
			imgArr.push(key);
//  		   alert($(this).attr("id"));
 		   $(this).parent().remove(); 
 	   });
		
		// 문의 모달 오픈
		$("#pb_inquire_writeform").click(function () {
			if ('${sessionScope.user}' != "") {
				$("#inquiremodal").modal("show");
			} else {
				alert("로그인 후 이용 가능합니다.");
			}
		});
		
		// 문의 등록 버튼
		$("#inquireInsertmodalbtn").click(function () {
			let inquireData = new FormData();
    	   	let content = $(".inquire__content").val();
    	   	let pbNo = ${storepb.pbNo};
    	   	inquireData.append("content", content);
    	   	inquireData.append("pbNo", pbNo);
			$.ajax({
				type:"POST",
				processData:false,
				contentType:false,
				url : "/babmukja/store/pbinquiryinsert.do",
				data : inquireData,
				success: function(result){
					alert("문의가 등록되었습니다.");
					location.href="detailpb.do?pbNo="+${storepb.pbNo};
				}
			});
		});
		
		// 문의 수정 모달 오픈
		let inqData = new FormData();
		$(".inq_update_btn").click(function () {
			$("#inquireupdatemodal").modal("show");
			let inquiryNo = $(this).siblings("input[name='inquiryNo']").val();
			inqData.append("inquiryNo", inquiryNo);
			$.ajax({
				url: "/babmukja/store/pbinquiryupdateform.do",
   	  			data : {
   	  				inquiryNo : $(this).siblings("input[name='inquiryNo']").val()
   	  			}
			}).done(function (response) {
				console.dir(response);
				$(".inquire__update__content").val(response.content);
			});
		});
		
		// 문의 수정
		$("#inquireUpdatemodalbtn").click(function () {
			let inqNo = inqData.get("inquiryNo");
			console.log(inqNo);
			console.log($(".inquire__update__content").val());
			let inqContent = $(".inquire__update__content").val();
			inqData.append("content", inqContent)
			$.ajax({
				url: "/babmukja/store/pbinquiryupdate.do",
				data: {
					inquiryNo : inqNo,
					content : inqContent
				}
			}).done(function (response) {
				alert("문의 수정이 완료되었습니다.");
				location.href="detailpb.do?pbNo="+${storepb.pbNo};
			});
		});
		
		// 문의 삭제
		$(".inq_delete_btn").click(function () {
			let num = $(this).siblings("input[name='inquiryNo']").val();
// 			console.log(inquiryNo);
			$.ajax({
				url: "/babmukja/store/pbinquirydelete.do",
				data: {
					inquiryNo : num
				}
			}).done(function (response) {
				alert("문의 삭제 성공");
				if ($(".pb_inquire_body").length == 1) {
					$(".inquiry_con").html("<p class='reviewMSG'>문의가 존재하지 않습니다.</p><p class='reviewMSG2'>문의를 등록해주세요 !</p>");
				}
	  			$("#" + num).remove();
			})
		});
		
		// 결제
		$(".buy_now").click(function () {
			if ('${sessionScope.user}' != "") {
				let t = new Array();
				obj = new Object();
	// 			let price = $("#total__price").text(changeComma($("#total__price:first").text()));
				obj.price= $("#total__price").text().replace(/,/g, "").replace("원", "");    // 상품 총 금액
				obj.pbNo = ${storepb.pbNo};	  					// 해당 상품 번호
				obj.prodCount = $("#total_count").text();			// 상품 개수
// 				obj.pbName = $("#pb_detail_title > p").text();	// 상품 명
				obj.memNo = $("input[name='memhidden']").val();
				t.push(obj);
				console.log(t);
// 				console.log("상품 명 : " + pbName);
// 				console.log("개수 : " + count);
// 				console.log("상품번호 : " + pbNo);
// 				console.log("총 금액 : " + price);
// 				console.log("회원 번호 : " + memNo);
				
				let price = $("#total__price").text().replace(/,/g, "").replace("원", "");    // 상품 총 금액
				
		        var IMP = window.IMP; // 생략가능
		        IMP.init("imp21130958"); // 가맹점 식별 코드
	
		        IMP.request_pay(
		          {
		            pg: "kakao", // 결제방식
		            pay_method: "card", // 결제 수단
		            merchant_uid: "merchant_" + new Date().getTime(),
		            name: "BABMUKJA", // order 테이블에 들어갈 주문명 혹은 주문 번호
		            amount: price, // 결제 금액
		            buyer_name: "", // 구매자 이름
		            buyer_tel: "", // 구매자 전화번호
		            m_redirect_url: "" // 결제 완료 후 보낼 컨트롤러의 메소드명
		          },
		          function(rsp) {
		            if (rsp.success) {
		            	$.ajax({
		            		url: "/babmukja/store/pbpaymentinsert.do",
		            		traditional : true,
		            		dataType:"JSON",
		            		contentType : 'application/json; charset=UTF-8',
		            		type:"POST",
		            		data: JSON.stringify(t),
		            		success: function(result){
		    					if (result == 1) {
// 			            			alert("결제 성공");
			            			location.href = "mainpb.do";
		    					}
		    				}
		            	});
		              // 성공시
		              var msg = "결제가 완료되었습니다.";
		              msg += "고유ID : " + rsp.imp_uid;
		              msg += "상점 거래ID : " + rsp.merchant_uid;
		              msg += "결제 금액 : " + rsp.paid_amount;
		              msg += "카드 승인번호 : " + rsp.apply_num;
		            } else {
		              // 실패시
		              var msg = "결제에 실패하였습니다.";
		              msg += "에러내용 : " + rsp.error_msg;
		            }
		          }
		        );
			} else {
				alert("로그인 후 이용 가능합니다.");
			}
		});
		
		// 장바구니
		$(".add_to_cart").click(function () {
			if ('${sessionScope.user}' != "") {
				let price= $("#total__price").text().replace(/,/g, "").replace("원", "");    // 상품 총 금액
				let pbNo = ${storepb.pbNo};	  					// 해당 상품 번호
				let count = $("#total_count").text();			// 상품 개수
				let memNo = $("input[name='memhidden']").val();
// 				alert(memNo);
				console.log(price);
				console.log(pbNo);
				console.log(count);
				$.ajax({
					url: "/babmukja/store/pbcartinsert.do",
					data : {
						pbNo : pbNo,
						price : price,
						prodCount : count,
						memNo : memNo
					}
				}).done(function () {
// 					alert(memNo);
					$("#cartmodal").modal("show");
					$(".cart_move_btn").click(function () {
						location.href = "cartpb.do?memNo="+memNo;
					});
					$(".cart_move_not_btn").click(function () {
						location.href="detailpb.do?pbNo="+${storepb.pbNo};
					});
					
				});
			} else {
				alert("로그인 후 이용 가능합니다.");
			}
		});
		
		// 후기 별점부분
        let checkedValue = 0;
        let $checkStar = $(".check-frontStar");
		 $(".check-stars").mouseover(function(e){
	            let x,y;
	            $(this).mousemove(function(e){
	                let x = e.offsetX;
	                if(x <= 60){
	                	$checkStar.css({width: "60px"});
	                    checkedValue = 1;
	                }else if(x <= 120){
	                	$checkStar.css({width: "120px"});
	                    checkedValue = 2;
	                }else if(x <= 180){
	                	$checkStar.css({width: "180px"});
	                    checkedValue = 3;
	                }else if(x <= 240){
	                	$checkStar.css({width: "240px"});
	                    checkedValue = 4;
	                }else if(x <= 300){
	                	$checkStar.css({width: "300px"});
	                    checkedValue = 5;
	                	
	                }else{
	                	$checkStar.css({width: "0px"});
	                	checkedValue = 0;
	                }
	            })   
	        }).click(function(){
            	let widthVal = checkedValue * 60;
            	$checkStar.css({width: widthVal + "px"});
            });
    </script>
</body>
</html>