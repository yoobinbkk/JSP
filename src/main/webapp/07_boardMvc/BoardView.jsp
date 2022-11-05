<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="boardMvc.model.*" %>

<%
	//Control에서 param으로 넘어오는 정보를 mList에 저장
	BoardVO vo = (BoardVO) request.getAttribute("param");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>BoardView</title>
</head>
<body>

	<h4> 게시판 글 보기 </h4><br/>
	<table border="1" bordercolor="red">
	<tr>
		<td> 제  목 : </td>
		<td><%= vo.getTitle() %></td>
	</tr>
	<tr>
		<td> 작성자 : </td>
		<td><%= vo.getWriter() %></td>
	</tr>
	<tr>
		<td> 작성일자 : </td>
		<td><%= vo.getRegdate() %></td>
	</tr>
	<tr>
		<td> 내  용 : </td>
		<td><%= vo.getContent() %></td>
	</tr>
	<tr>
		<td> 조회수 : </td>
		<td><%= vo.getCnt() %></td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="BoardControl?cmd=list-page"> 목록보기 </a>
			<a href="BoardControl?cmd=modify-form&seq=<%= vo.getSeq() %>"> 수정하기 </a>
			<a href="BoardControl?cmd=delete-form&seq=<%= vo.getSeq() %>"> 삭제하기 </a>	
		</td>
	</tr>
	</table>

</body>
</html>