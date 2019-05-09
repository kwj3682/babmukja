<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>댓글 등록</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/notice/notice comment.css"/>">
    <script src="/babmukja/WEB-INF/js/jquery-3.2.1.min.js"></script>
</head>
<body>
        <form
        action="proc.jpg"
        method="post"
        name="mainForm"
        encType="multipart/form-data"
        class="pc_forms"
      >
        <div class="pcsummary">댓글 등록</div>
        <hr class="enrollhr" />
        <table class="pccommt">    
          <tr>
            <td class="pctd3">
              <textarea
                name="content"
                rows="25"
                cols="100"
                class="pc_textarea"
              ></textarea>
            </td>
          </tr>
        </table>
        <hr />
        <br /><br />
        <div class="pcwsubd">
          <th class="pcwsub"><button type="submit">수정하기</button></th>
          &nbsp; &nbsp; &nbsp;
          <th class="pcwsub"><button type="submit">등록하기</button></th>
        </div>
      </form>
</body>
</html>