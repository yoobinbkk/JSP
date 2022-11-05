<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardMvc.model.*" %>

<%
	BoardVO vo = (BoardVO) request.getAttribute("param");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardModifyForm</title>
</head>
<body>

	<h4> 게시판 글 수정하기 </h4><br/>
	<form name='frm' method='post' action="BoardControl?cmd=modify-doo">
	제  목 : <input type='text' name='title' value="<%= vo.getTitle() %>"><br/><br/>
	패스워드(수정/삭제시 필요) :
			<input type='password' name='pass'><br/><br/>
	내  용 : <textarea name='content' rows='10' cols='40'><%= vo.getContent()%></textarea><br/><br/>
			<input type='hidden' name='seq' value='<%= vo.getSeq() %>' />

	<input type='submit' value='수정하기'>
	<input type='button' value='목록보기' onclick="window.location='BoardControl?cmd=list-page'">
	</form>

</body>
</html>