<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mybatis.guest.service.CommentService" %>  

<%
	request.setCharacterEncoding("utf-8");

	int commentNo = Integer.parseInt( request.getParameter("cId"));
	CommentService.getInstance().deleteCommentByPrimaryKey(commentNo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
</head>
<body>

삭제되었습니다. <br/>
<a href="listComment.jsp">목록보기</a>

</body>
</html>