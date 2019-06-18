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
        <p>"<b id="memNickname">${user.memNickname}</b>'s KITCHEN"</p>
        <input type="hidden" name="memNo" value="${user.memNo}">
        <input type="hidden" name="memEmail" value="${user.memEmail}">
        <input type="hidden" name="follow" value="${user.follow}">
        <input type="hidden" name="follower" value="${user.follower}">
        <input type="hidden" name="recipeCnt" value="${user.recipeCnt}">
    </div>
    <div id="container">
    </div>
	<div class="modal fade" id="modal-detail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
			<div class="modal-dialog" role="document" style="min-width:1100px;margin:0 auto;margin-top:70px;">
				<div class="modal-content" style="width:1200px; height: 700px;margin:0 auto;">
					
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
	<!-- user info -->
	<div class="modal fade" id="modal-user-detail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
			<div class="modal-dialog" role="document" style="min-width:1100px;margin:0 auto;margin-top:70px;">
				<div class="modal-content" style="width:800px; height: 400px;margin:0 auto;">
					
					
                        <input type="file" name="profile-picture" style="display:none;">
					    <div id="updateform-body">
					        <div id="updateform-sec1">
					            <div id="updateform-sec1-menu1" style="background: white;">회원 정보</div>
					            <c:choose>
					            	<c:when test="${sessionScope.user.memNickname == user.memNickname}">
							            <div id="updateform-sec1-menu2">비밀번호 변경</div>
					            	</c:when>
					            	<c:otherwise>
					            		<div style="background:gray;"></div>
					            	</c:otherwise>
					            </c:choose>
					        </div>
					        <div id="updateform-sec2">
					            <div id="check-userinfo">
					                <div id="updateform-sec2-imgSelector">
					                	<c:choose>
						                	<c:when test="${user.imgPath == null}">
						                    	<img id="profile-picture" src="<c:url value="/resources/images/default/userdefault.png"/>">					                	
						                	</c:when>
						                	<c:otherwise>					                	
						                    	<img id="profile-picture" src="${pageContext.request.contextPath}/member/download.do?path=${user.imgPath}&memNickname=${user.memNickname}&sysname=${user.imgSysname}">
						                	</c:otherwise>
					                	</c:choose>
					                </div>
					                <div id="updateform-sec2-userinfo">
					                    <p id="updateform-sec2-userinfo-id">${user.memNickname}</p>
					                    <div id="updateform-sec2-userinfo-opt">
							            	<c:if test="${sessionScope.user.memNickname == user.memNickname}">
						                        <button id="profile-change-button">프로필 사진 변경</button>
				            				</c:if>
					                        <button id="follow-button">팔로우</button>
					                        <p>팔로우 중</p>				            					
					                    </div>
					                    <p id="updateform-sec2-userinfo-info">
								                        작성한 레시피<b>${user.recipeCnt}</b>
								                        팔로워<b>${user.follower}</b>
								                        팔로우<b>${user.follow}</b>
					                    </p>
					                </div>
					            </div>
					        </div>
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