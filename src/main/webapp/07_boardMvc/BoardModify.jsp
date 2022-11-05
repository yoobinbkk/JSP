<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String result = String.valueOf(request.getAttribute("result"));
	String seq = String.valueOf(request.getAttribute("seq"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardModify</title>
</head>
<body>

<%  // 게시글 수정이 성공적으로 되었다면 그 해당 게시글을 보여주는 페이지로 이동하고
	if (result.equals("1")) {
		response.sendRedirect("BoardControl?cmd=view-page&seq=" + seq);
	} else {
		// 그렇지 않다면, "암호가 잘못 입력되었습니다"를 출력
		%> 암호가 잘못 입력되었습니다. <%
	}
%>

</body>
</html>