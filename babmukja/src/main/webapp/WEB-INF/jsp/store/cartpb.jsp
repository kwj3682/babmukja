<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>PB STORE CART</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/store/cartpb.css"/>">
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
    <script src="<c:url value="/resources/js/common/stringUtil.js"/>"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <div class="pb_cart_container">
	      <div class="pb_cart_grid">
	          <div class="pb_cart_con">
	            
	            <!-- 반복 -->
	            <c:forEach var="cartList" items="${cartList}">
		            <div class="pb_cart_product" id="${cartList.cartNo}">
		            <input type="hidden" name="hiddenNo" id="hiddenNo" value="${cartList.cartNo}">
		            <input type="hidden" name="hiddenpbNo" id="hiddenpbNo" value="${cartList.pbNo}">
		                <div class="product_image">
		                    <img src="${cartList.imgPath}" onerror="this.src='${pageContext.request.contextPath}/resources/images/foodthumbnail1.jpg'"/>
		                </div>
		                <div class="product_info">
		                    <div class="product_flex">
		                        <p class="product_name">${cartList.name}</p>
		                        <button id="product_delete_btn" class="product_delete_btn">X</button>
		                    </div>
		                    
		                    <div id="select_product_count">
		                        <p><button id="count_minus" class="count_minus">-</button></p>
		                        <p id="total_count">${cartList.prodCount}</p>
		                        <p><button id="count_plus" class="count_plus">+</button></p>
		                        <p class="total__price" id="total__price"><fmt:formatNumber value="${cartList.price}" groupingUsed="true"/>원</p>
		                    </div>
		                </div>
		            </div> <!-- 반복끝 -->
	            </c:forEach>
                <c:if test="${empty cartList}">
					<p class="cartMSG">장바구니에 상품이 존재하지 않습니다.</p>
					<p class="cartMSG2">상품을 담아주세요~!</p>
            	</c:if>
     		  </div>

	        <!-- 상품 종합 정보 -->
	        <div class="pb_cart_order_container">
	            <div class="pb_cart_order">
	                <div class="order_payment">총결제 금액<span class="order_price"><fmt:formatNumber value="" groupingUsed="true"/>원</span></div>
	            </div>
	            <div class="cart_order_btn">
	                <button class="payment_btn"><span class="order_count"></span>개상품구매하기</button>
	            </div>
	        </div>
	    </div>
    </div>
    
    <script>
    	// 총 결제 금액 및 개수
   		let orderPrice = 0;
    	let orderCnt = 0;
    	$(document).ready(function () {
    		orderCnt = $(".pb_cart_product").length;
    		$(".pb_cart_product").each(function () {
    			let a = parseInt($(this).children().children().children(".total__price").text().replace(/,/g,"").replace('원',""));
    			orderPrice += a;
    		});
    		console.log(orderPrice);
	   		$(".order_price").text(changeComma(orderPrice)+"원");
	    	$(".order_count").text(orderCnt);
    	});
    	
    	// 장바구니 삭제
    	$(".product_delete_btn").click(function () {
    		let num = $(this).parent().parent().siblings("input[name='hiddenNo']").val();
    		let p = parseInt($(this).parent().siblings().children("#total__price").text().replace(/,/g,""));
    		$.ajax({
    			url: "/babmukja/store/deletepbcart.do",
    			data : {
    				cartNo : num
    			}
    		}).done(function () {
    			if ($(".pb_cart_product").length == 1) {
	   	  			$(".pb_cart_con").html("<p class='cartMSG'>장바구니에 상품이 존재하지 않습니다.</p><p class='cartMSG2'>상품을 담아주세요~!</p>");
   	  			}
   	  			$("#" + num).remove();
    			orderPrice -= p;
    			orderCnt--;
    			$(".order_price").text(changeComma(orderPrice)+"원");
    			$(".order_count").text(orderCnt);
    		});
    	});
    	
//     	// 결제
// 		$(".payment_btn").click(function () {
// 			alert("구매하기버튼 클릭됨");
// 			let t = [];
// 			$(".pb_cart_product").each(function () {
// 				let price = parseInt($(this).children().children().children(".total__price").text().replace(/,/g,"").replace('원',""));
// 				let pbNo = parseInt($(this).children("input[name='hiddenpbNo']").val());
// 				let count = parseInt($(this).children().children().children("#total_count").text());
// 				t.push({'pbNo' : pbNo, 'price' : price, 'prodCount' : count});
//     		});
// 			console.log(t);
// 			alert(JSON.stringify(t));			
// // 			for (let i = 0; i < t.length; i++) {
// // 				console.log(t[i].pbNo, t[i].price, t[i].count);
// // 			}

			
// 			let price= $(".order_price").text().replace(/,/g, "").replace("원", "");    // 상품 총 금액
// // 			let count = $("#total_count").text();			// 상품 개수
// // 			let pbName = $("#pb_detail_title > p").text();	// 상품 명
// // 			console.log("개수 : " + count);
// // 			console.log("총 금액 : " + price);
// // 			console.log("상품번호 : " + pbNo);
// 	        var IMP = window.IMP; // 생략가능
// 	        IMP.init("imp21130958"); // 가맹점 식별 코드

// 	        IMP.request_pay(
// 	          {
// 	            pg: "kakao", // 결제방식
// 	            pay_method: "card", // 결제 수단
// 	            merchant_uid: "merchant_" + new Date().getTime(),
// 	            name: "BABMUKJA", // order 테이블에 들어갈 주문명 혹은 주문 번호
// 	            amount: price, // 결제 금액
// 	            buyer_name: "", // 구매자 이름
// 	            buyer_tel: "", // 구매자 전화번호
// 	            m_redirect_url: "" // 결제 완료 후 보낼 컨트롤러의 메소드명
// 	          },
// 	          function(rsp) {
// 	            if (rsp.success) {
// 	            	$.ajax({
// 	            		url: "/babmukja/store/pbpaymentinsert.do",
// 	            		traditional : true,
// 	            		dataType:"JSON",
// 	            		type:"POST",
// 	            		data: {result : JSON.stringify(t)}
// 	            	}).done(function (response) {
// 	            		alert("결제 완료@!@!");
// 	            	});
// 	              // 성공시
// 	              var msg = "결제가 완료되었습니다.";
// 	              msg += "고유ID : " + rsp.imp_uid;
// 	              msg += "상점 거래ID : " + rsp.merchant_uid;
// 	              msg += "결제 금액 : " + rsp.paid_amount;
// 	              msg += "카드 승인번호 : " + rsp.apply_num;
// 	            } else {
// 	              // 실패시
// 	              var msg = "결제에 실패하였습니다.";
// 	              msg += "에러내용 : " + rsp.error_msg;
// 	              alert (msg);
// 	            }
// 	          }
// 	        );
// 		});
    	
    	// 수량 조절 부분
    	let price = parseInt($("#total__price").text().replace(/,/g,""));
    	let cnt = $("#total_count").html();
//         $("#total__price").text(price * cnt + "원");
        $("#total__price").text(changeComma($("#total__price").text()));
	
        // 수량 늘리기 버튼
        $(".count_plus").click(function () {
        	let $this = $(this).parent();
	    	let cnt = $this.siblings("#total_count").text();
	    	let p = parseInt($this.siblings("#total__price").text().replace(/,/g,""));
	    	let p1 = p / cnt;  
	        cnt++;
	        
		  $this.siblings("#total_count").text(cnt);
		  $this.siblings("#total__price").text(p1 * cnt + "원");
	      $this.siblings("#total__price").text(changeComma($this.siblings("#total__price").text()));
	      orderPrice += p1;
	      $(".order_price").text(changeComma(orderPrice)+"원");
	    });
	
        // 수량 빼기 버튼
	    $(".count_minus").click(function () {
        	let $this = $(this).parent();
	    	let cnt = $this.siblings("#total_count").text();
	    	let p = parseInt($this.siblings("#total__price").text().replace(/,/g,""));
	    	let p1 = p / cnt;

	      if (cnt == 1) {
	          alert("주문 개수는 1개 이상이어야 합니다.");
	          return;
	      }
	      cnt--;

	      $this.siblings("#total_count").text(cnt);
	      $this.siblings("#total__price").text(p1 * cnt + "원");
	      $this.siblings("#total__price").text(changeComma($this.siblings("#total__price").text()));
	      orderPrice -= p1;
	      $(".order_price").text(changeComma(orderPrice)+"원");
	    });
    </script>
</body>
</html>