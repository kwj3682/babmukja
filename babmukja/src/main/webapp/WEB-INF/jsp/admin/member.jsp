<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value="/resources/css/admin/adminmember.css"/>">
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>

<!-- flatpickr 날짜 api -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<!-- datatable 테이블 api -->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/js/DataTables/datatables.css"/>"/>
<script type="text/javascript" src="<c:url value="/resources/js/DataTables/DataTables-1.10.18/js/jquery.dataTables.js"/>"></script>
<!-- MODAL bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<title>회원 관리</title>
</head>
<body>

	<div id="main">
		<div id="main-header">
			<h2>회원 관리</h2>

		</div>

		<div id="search-output">

			<div>
				<div id="search-output-list">
					<table id="searchResult">
						<thead>
							<tr>
								<th>체크</th>
								<th>회원 번호</th>
								<th>이메일</th>
								<th>닉네임</th>
								<th>이름</th>
								<th>가입일</th>
								<th>최종 접속일</th>
								<th>총 구매액</th>
								<th>총 판매액</th>
								<th>레시피 개수</th>
								<th>상품 개수</th>
								<th>포인트</th>
								<th>등급</th>
							</tr>
						</thead>
						<tbody class="row-border hover order-column" style="width:100%">
							<c:forEach var="m" items="${list}">
								<tr>
									<td><input type="checkbox"></td>
									<td><a
										href="<c:url value='/admin/memberdetail.do?no=${m.memNo }'/>">${m.memNo }</a></td>
									<td>${m.memEmail }</td>
									<td>${m.memNickname }</td>
									<td><a
										href="<c:url value='/admin/memberdetail.do?no=${m.memNo }'/>">${m.memName }</a></td>
									<td><fmt:formatDate value="${m.signDate }"
											pattern="yyyy-MM-dd" /></td>
									<td><fmt:formatDate value="${m.lastDate }"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td>${m.totalBuy }</td>
									<td>${m.totalSel }</td>
									<td>${m.recipeCnt }</td>
									<td>${m.sellingCnt }</td>
									<td>${m.point }</td>
									<td>${m.gradeName }</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>체크</th>
								<th>회원 번호</th>
								<th>이메일</th>
								<th>닉네임</th>
								<th>이름</th>
								<th>가입일</th>
								<th>최종 접속일</th>
								<th>총 구매액</th>
								<th>총 판매액</th>
								<th>레시피 개수</th>
								<th>상품 개수</th>
								<th>포인트</th>
								<th>등급</th>
							</tr>
						</tfoot>
					</table>
					
				</div>
			</div>
		</div>
	</div>

	<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<!-- 	datatables -->

    <div id="profile-main">
        <div id="profile-left">
            <div id="profile-left-photo">
                <img src="images/profile15.jpg">
            </div>
            <div id="profile-left-contact">
                <h3>CONTACT</h3>
                <div class="underline"></div>
                <div>
                    <i class="fas fa-at"></i>
                    <p>kwj3682@naver.com</p>
                </div>
                <div>
                    <i class="fas fa-mobile-alt"></i>
                    <p>010-4955-6029</p>

                </div>    
                <div>
                    <i class="fas fa-map-marker-alt"></i>
                    <p>경기도 고양시 일산서구 <br>원일로3 , 202-1101</p>
                </div>    
            </div>
            <div id="profile-left-simpledata">
                <h3>팔로우/팔로워</h3>
                <div class="underline"></div>
                <div>
                    <i class="fas fa-user-friends"></i>
                    <P>15 / 10</P>
                </div>
                <h3>좋아요 누른 게시물</h3>
                <div class="underline"></div>
                <div>
                    <i class="far fa-heart"></i>
                    <P>500개</P>
                </div>
                <h3>스크랩한 게시물</h3>
                <div class="underline"></div>
                <div>
                    <i class="fas fa-paperclip"></i>
                    <P>11개</P>
                </div>
            </div>
        </div>
        <div id="profile-right">
            <div id="profile-right-header">
                <h5>1241.</h5>
                <h2>주부9단빛찬맘</h2>
                <hr>
                <h3>#한식</h3>
            </div>
            <div id="profile-right-body">

                <h4>보유 포인트</h4>
                <div id="profile-right-point">
                    <div id="point"><h3 id="point-value">30000<h3></div>
                </div>
                <p id="grade"> 주부9단빛찬맘님은 <b>VIP회원</b>입니다.</p>
                    
                <h4>구매 현황</h4>
                <table class="totalTable" id="totalbuy">
                    <thead>
                        <tr>
                            <th>주문 번호</th>
                            <th>판매 회원	</th>
                            <th>구매 회원	</th>
                            <th>주문 수량	</th>
                            <th>상품 수령 여부	</th>
                            <th>총 결제 금액	</th>
                            <th>송장 번호</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>
                    </tbody>
                </table>
                <h4>판매 현황</h4>
                <table class="totalTable" id="totalsell">
                    <thead>
                        <tr>
                            <th>주문 번호</th>
                            <th>판매 회원	</th>
                            <th>구매 회원	</th>
                            <th>주문 수량	</th>
                            <th>상품 수령 여부	</th>
                            <th>총 결제 금액	</th>
                            <th>송장 번호</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>
                    </tbody>
                </table>

            </div>

        </div>
    </div>

<!-- 	datatables -->
	
	<script>
	    $(document).ready(function() {
	        $('#totalbuy').DataTable({
	            "order":[[0,"asc"]]
	        });
	        $('#totalsell').DataTable({
	            "order":[[0,"asc"]]
	        });
	        // Setup - add a text input to each footer cell
            $('#searchResult tfoot th').each( function () {
                var title = $(this).text();
                $(this).html( '<input type="text" class="searchForm" placeholder="'+title+'" />' );
            } );
        
            // DataTable
            var table = $('#searchResult').DataTable({
                "order":[[1,"asc"]]
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
            
            $('.row-border')
            .on( 'mouseenter', 'td', function () {
                var colIdx = table.cell(this).index().column;
     
                $( table.cells().nodes() ).removeClass( 'highlight' );
                $( table.column( colIdx ).nodes() ).addClass( 'highlight' );
            } );
            
	    });
// 		$("#pageText > a").click(function() {

// 			let pageNo = $(this).attr("data-pageNo");
			
// 			$("form[name='searchForm'] > input[name='pageNo']").val(pageNo);
// 			$("form[name='searchForm']").submit();
// 			return false;
// 		});
		
		$("#detail_button").click(function() {
			$("#detail-search").css("display", "block");
		});
		
		$(".selector").flatpickr({
			enableTime : true,
			dateFormat : "Y-m-d"
		});
		$(".selector2").flatpickr({
			enableTime : true,
			dateFormat : "Y-m-d H:i"
		});

	</script>
</body>
</html>