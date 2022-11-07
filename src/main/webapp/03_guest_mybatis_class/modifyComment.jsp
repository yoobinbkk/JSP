<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="mybatis.guest.service.CommentService" %>
 
<jsp:useBean id="comment" class="mybatis.guest.model.Comment">
	<jsp:setProperty name="comment" property="*" />
</jsp:useBean>

<%
	CommentService.getInstance().modifyComment(comment);
	response.sendRedirect("viewComment.jsp?cId=" + comment.getCommentNo());
%>

