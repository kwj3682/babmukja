<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<c:url value="/resources/css/notice/notice enroll.css"/>">
    <script src="/babmukja/WEB-INF/js/jquery-3.2.1.min.js"></script>
    <title>전체조회</title>
</head>
<body style="background: white;">
        <form
        action="write.do"
        method="post"
        name="inqform"
        encType="multipart/form-data"
        class="notice_forms"
      >
        <div class="notice_summary">공지 사항 등록</div>
        <hr class="enrollhr" />
        <table class="notice_commt">
          <tr>
            <th class="notice_th2">관리자</th>
            <td class="notice_td2"><input type="text" name="writer"/></td>
          </tr>
          <tr>
            <th class="notice_th2">제목</th>
            <td class="notice_td2"><input type="text" name="title"/></td>
          </tr>
          <tr>
            <th class="notice_th3">내용</th>
            <td class="notice_td3">
              <textarea
                name="content"
                rows="25"
                cols="100"
                class="notice_textarea"
              ></textarea>
            </td>
          </tr>
          <tr>
            <th class="notice_th2">첨부파일</th>
            <td class="notice_td5"><input type="file" class="notice_search"/></td>
          </tr>
          <tr>
            <th class="notice_th2">첨부파일</th>
            <td class="notice_td5"><input type="file" class="notice_search"/></td>
          </tr>
        </table>
        <hr />
        <br />
        <div class="notice_wsubd">
          <th class="notice_wsub"><button type="submit"><a href="list.do">목록보기</a></button></th>
          &nbsp; &nbsp; &nbsp;
          <th class="notice_wsub"><button type="submit">등록하기</button></th>
        </div>
      </form>
      <br />
      <hr />
  <footer>
          <h2>BABMUKJA COMPANY</h2>
          <div>Lorem ipsum dolor sit.</div>
  </footer>
    <script>
    	$("form").submit(function inqform() {
    		
    		var notice_no = document.inqform.notice_no 
    		var writer = document.inqform.writer;
    		var title = document.inqform.title;
    		var content = document.inqform.content;
    		
    		var notnull = [notice_no, writer, title, content]
    		
    		if (isEmpty(notice_no , "글번호를 입력하세요.")) return false; 
    		if (isEmpty(writer , "글쓴이를 입력하세요.")) return false;
    		if (isEmpty(title, "제목을 입력하세요.")) return false;
    		if (isEmpty(content, "내용을 입력하세요.")) return false;
    		
    		function isEmpty(ele, msg) {
    			if (ele.value == "") {
    				alert(msg);
    				ele.focus();
    				return true;
    			}
    			return false;
    		}
    	});
    	</script>
</body>
</html>