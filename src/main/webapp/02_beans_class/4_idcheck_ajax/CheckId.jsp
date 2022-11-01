<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.beans.MemberDao" %>

<%
	String user = request.getParameter("id");
	MemberDao dao = MemberDao.getInstance();
	boolean result = dao.isDuplicatedId(user);
	
	String word = null;
	if (result) {
		word = "YES";
	} else {
		word = "NO";
	}
	
	out.print(word);
%>