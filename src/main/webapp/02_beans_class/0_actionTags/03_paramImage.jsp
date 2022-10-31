<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// <jsp:param>의 값 넘겨받기
	String lang = request.getParameter("lang");
	if( lang == null || lang.equals("")) lang="ko";
%>    

선택한 언어 약자 : <%= lang %> <br/><br/>
<img src="./imgs/dokdo_<%=lang%>.jpg">