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
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/js/DataTables/datatables.css"/>"/>
	<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
	<link rel="stylesheet" href="<c:url value="/resources/css/store/buyList.css"/>">
	<script type="text/javascript" src="<c:url value="/resources/js/DataTables/DataTables-1.10.18/js/jquery.dataTables.js"/>"></script>
	<title>결제 내역</title>
</head>
<body>
    <div id="buylist-container">
    <p class="buyList-text">PAYMENT DETAILS</p>
        <table id="buylist">
            <thead>
                <tr>
                    <th>상품명</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>구매 날짜</th>
                </tr>
            </thead>
            <tbody>
	            <c:forEach var="buyList" items="${buyList}">
	                <tr>
	                    <td><a class="product_move" href="<c:url value='/store/detailpb.do?pbNo=${buyList.pbNo}'/>">${buyList.name}</a></td>
	                    <td><fmt:formatNumber value="${buyList.price}" groupingUsed="true"/>원</td>
	                    <td>${buyList.prodCount}개</td>
	                    <td><fmt:formatDate value="${buyList.regdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
	                </tr>
	            </c:forEach>
            </tbody>
            <tfoot>
                <tr>
                    <th>상품명</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>구매 날짜</th>
                </tr>
            </tfoot>
        </table>
    </div>
    
    <script>
        $(document).ready(function() {
            // Setup - add a text input to each footer cell
            $('#buylist tfoot th').each( function () {
                var title = $(this).text();
                $(this).html( '<input type="text" class="searchForm" placeholder="'+title+'" />' );
            } );
        
            // DataTable
            var table = $('#buylist').DataTable({
                "order":[[3,"desc"]]
            });
        
            // Apply the search
            table.columns().every( function () {
                var that = this;
        
                $( 'input', this.footer() ).on( 'keyup change', function () {
                    if ( that.search() !== this.value ) {
                        that
                            .search( this.value )
                            .draw();
                    }
                } );
            } );

        } );
        </script>
</body>
</html>