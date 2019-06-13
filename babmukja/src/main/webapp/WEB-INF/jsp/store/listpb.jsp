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
    <title>Document</title>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/resources/css/store/listpb.css"/>">
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
</head>
<body>
 <div class="pb_list_container">
        <p class="pb_list_title">PRODUCTS</p><br><br><br>


        <div class="pb_list_search">
            <div class="pb_list_count">전체 ${pbCount}개</div>
                <div class="pb_search_con">
                    <input id="namanyay-search-box" name="searchName" size="40" type="text" placeholder="Search" <c:if test="${param.searchName != '' || param.searchName != null}">value="${param.searchName}"</c:if>/>
                    <button class="searchNameBTN"><i class="fas fa-search" id="searchicon"></i></button>
                </div>
                	
            <select id="selectbox">
            	<c:if test="${sortType eq 0}">
	                <option value="0" id="dateDESC" selected>최신순</option>
	                <option value="1">인기순</option>
	                <option value="2" id="priceDESC">낮은 가격순</option>
	                <option value="3" id="priceASC">높은 가격순</option>
            	</c:if>
            	<c:if test="${sortType eq 1}">
	                <option value="0" id="dateDESC" >최신순</option>
	                <option value="1" selected>인기순</option>
	                <option value="2" id="priceDESC">낮은 가격순</option>
	                <option value="3" id="priceASC">높은 가격순</option>
            	</c:if>
            	<c:if test="${sortType eq 2}">
	                <option value="0" id="dateDESC">최신순</option>
	                <option value="1">인기순</option>
	                <option value="2" id="priceDESC" selected>낮은 가격순</option>
	                <option value="3" id="priceASC">높은 가격순</option>
            	</c:if>
            	<c:if test="${sortType eq 3}">
	                <option value="0" id="dateDESC">최신순</option>
	                <option value="1">인기순</option>
	                <option value="2" id="priceDESC">낮은 가격순</option>
	                <option value="3" id="priceASC" selected>높은 가격순</option>
            	</c:if>
            </select>
        </div>
 	<!-- pb 상품 list -->
        <div class="pb_list_images">
            <div class="pb_list_grid">
	            <c:forEach var="listpb" items="${listpb}">
	                <a class="pb_list_product_img" href="<c:url value='/store/detailpb.do?pbNo=${listpb.pbNo}'/>">
	                    <img src="${listpb.thumnail}" onerror="this.src='${pageContext.request.contextPath}/resources/images/foodthumbnail1.jpg'"/>
	                    <div class="pb_list_product_text">
	                        <div class="pb_list_product_title">
	                            <p>${listpb.name}</p>
	                        </div>
	                        <div class="pb_list_product_price">
	                            <p><fmt:formatNumber value="${listpb.price}" groupingUsed="true"/></p>
	                        </div>
	                        <div class="pb_list_product_rating">
	                            <span id="pb_store_popular_product_rating_star">★</span>
	                            <span>4.3</span>
	                        </div>
	                    </div>
	                </a>
	            </c:forEach>
            </div>
        </div>
        <div class="page">
		    <c:if test="${pageResult.count != 0}">
		    	<div>
					<c:if test="${pageResult.prev eq true}">
						<a href="${param.link}?pageNo=${pageResult.beginPage - 1}">이전</a>
					</c:if>
					<c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}">
						<a class="pageLink" href="${param.link}?pageNo=${i}">[${i}]</a>
						</c:forEach>
					<c:if test="${pageResult.next eq true}">
						<a href="${param.link}?pageNo=${pageResult.endPage + 1}">다음</a>
					</c:if>	
				</div>
		    </c:if>
   		</div>
     </div>
     <form id="searchForm" method="POST" action="<c:url value='/store/listpb.do'/>">
	     <input type="hidden" name="pageNo" value="${param.pageNo}">
	     <input type="hidden" name="sortType" value="${param.sortType}">
	     <input type="hidden" name="thumnail" value="${param.thumnail}">
	     <input type="hidden" name="name" value="${param.name}">
	     <input type="hidden" name="price" value="${param.price}">
	     <input type="hidden" name="regDate" value="${param.regDate}">
	     <input type="hidden" name="pbNo" value="${param.pbNo}">
	     <input type="hidden" name="searchName" value="${param.searchName}">
     </form>
     <script>
     	$(".page a").click(function(e){
     		pageNo = $(this).text().substring(1,$(this).text().lastIndexOf("]"));
     		sortType = $("#selectbox").find(":selected").val();
     		searchName = $("#namanyay-search-box").val();
     		$("#searchForm > input[name='pageNo']").val(pageNo);
     		$("#searchForm > input[name='sortType']").val(sortType);
     		$("#searchForm > input[name='searchName']").val(searchName);
     		$("#searchForm").submit();
			return false;
     	});
     	
     	$("#selectbox").change(function () {
     		$(".page a:eq(0)").click();
     	});
     	
     	$(".searchNameBTN").click(function () {
     		$(".page a:eq(0)").click();
     	});
     	
     	$(".pb_list_title").click(function () {
     		location.href = "listpb.do";
     	});
     </script>
</body>
</html>