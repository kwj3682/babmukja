<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>

</head>
<body>
<div>
<button>팝업띄우기</button>

</div>
<script>
 
$("button").click(function(){
	
	goPopup();
	jusoCallBack();
});
	


      //팝업주소띄우기!
      function goPopup() {
         var pop = window.open("/babmukja/meetup/meetupAddress.do", "pop",
               "width=570,height=420, scrollbars=yes, resizable=yes");
      }

      function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
            roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn,
            bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm,
            rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
       
    	  console.log(roadAddrPart1);
    	  console.log(engAddr);
    	  console.log("bdNm :" +bdNm);
    	  console.log("siNm :" +siNm);
    	  console.log("detBdNmList :" +detBdNmList);
    	  console.log("sggNm :" +sggNm);
    	  /*   $("#signupform input[name='postNo']").val(zipNo);
         $("#signupform input[name='addrDefault']").val(
               roadAddrPart1 + roadAddrPart2);
         $("#signupform input[name='addrDetail']").val(addrDetail); */
      }
   </script>

</body>
</html>