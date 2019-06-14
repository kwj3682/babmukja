<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
  	<link rel="stylesheet" href="<c:url value="/resources/css/member/mypage.css"/>">
  	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/js/DataTables/DataTables-1.10.18/css/jquery.dataTables.1.css"/>"/>
	<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/DataTables/DataTables-1.10.18/js/jquery.dataTables.1.js"/>"></script>
</head>
<body>
    <div id="open-filter">
        <p>"${user.memNickname}'s KITCHEN"</p>
        <input type="hidden" name="memNo" value="${user.memNo}"/>
        
    </div>
    <div id="container">
    </div>
	<div class="modal fade" id="modal-detail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
			<div class="modal-dialog" role="document" style="min-width:1100px">
				<div class="modal-content" style="width:1200px; height: 700px;">
					
					<div class="modal-body">
						<table id="writtenrecipe">
							<thead>
								<tr>
									<th>제목</th>
									<th>작성일</th>
									<th> we</th>
									<th>평점</th>
									<th>좋아요 수</th>
									<th>스크랩 수</th>
								</tr>
							</thead>
							<tbody id="tbody">
								
							</tbody>
						</table>
					</div>
				</div>
		</div>
	</div>
    <script src="<c:url value="/resources/js/three/three.min.js"/>"></script>
    <script src="<c:url value="/resources/js/three/GLTFLoader.js"/>"></script>
    <script src="<c:url value="/resources/js/three/PointLight.js"/>"></script>
    <script src="<c:url value="/resources/js/three/DRACOLoader.js"/>"></script>
    <script src="<c:url value="/resources/js/three/three.interaction/build/three.interaction.js"/>"></script>
	<script src="<c:url value="/resources/js/three/DirectionalLight.js"/>"></script>
	<script src="<c:url value="/resources/js/three/GeometryUtils.js"/>"></script>
	<script src="<c:url value="/resources/js/three/mypage.js"/>"></script>

    
</body>
</html>