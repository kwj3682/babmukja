<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/store/insertform.css"/>">
	<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
</head>

<body>
 	<div class="pb_insertform_container">
		<form method="post" enctype="multipart/form-data" action="<c:url value="/store/insertpb.do"/>">
	        <div class="pb_product_name">
	            <p>상품 이름</p>
	            <input type="text" name="name" id="product__name">
	        </div>
	        <div class="pb_product_price">
	            <p>상품 가격</p>
	            <input type="text" name="price" id="product__price">
	        </div>
	        <div class="pb_product_image">
	            <div class="image_container"></div>
	            <div class="image_choice">
	            	<label for="product_img_file">사진선택</label>
	                <input type="file" name="imageList" id="product_img_file" multiple="multiple">
	            </div>
	        </div>
	        <div class="pb_product_content">
	            <textarea name="content" class="product__content" cols="50" rows="15" placeholder="상품의 설명을 입력해주세요."></textarea>
	        </div>
            <div class="pb_insert_submit">
          	    <button id="pb_insert_submit_button">등록</button>
      	    </div>
 		</form>
        	<button id="pb_insert_cancle_button">취소</button>
    </div>
    <script>
	    $(function() {
	        $("#product_img_file").on("change", function(){
	            var files = !!this.files ? this.files : [];
	            if (!files.length || !window.FileReader) return; 
	            if (/^image/.test( files[0].type)){ 
	                var reader = new FileReader(); 
	                reader.readAsDataURL(files[0]); 
	                reader.onloadend = function(){ 
	                 $('.image_container').css({
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
	    
	    $("#pb_insert_cancle_button").click(function () {
	    	window.location.href="<c:url value='/admin/main.do'/>";
	    });
    </script>
</body>
</html>