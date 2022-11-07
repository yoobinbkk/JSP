<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="mybatis.guest.model.Comment" %>   
 <%@ page import="mybatis.guest.service.CommentService" %>

<%
	int commentNo = Integer.parseInt( request.getParameter("cId"));
	Comment comment = CommentService.getInstance().selectCommentByPrimaryKey(commentNo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 수정</title>
</head>
<body>

<form name="frm" action="modifyComment.jsp" >
<table>
	<tr><td>글번호</td><td name="commentNo"><%=  comment.getCommentNo()%></td></tr>
	<tr><td>사용자</td><td name="userId"><%=  comment.getUserId()%></td></tr>
	<tr><td>메세지</td><td><textarea name="commentContent" rows="10" columns="40"><%=  comment.getCommentContent()%></textarea></td></tr>
	<tr><td><input type="submit" value="입력"/></td></tr>
</table>
</form>

</body>
</html>