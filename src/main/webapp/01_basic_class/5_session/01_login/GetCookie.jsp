<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<html>
<head><title>쿠키</title></head>
<body>	

<h1>Cookie 정보 알아내기</h1>

<%	
	// 1. 클라이언트로부터 Cookie를 얻어옴 
	Cookie all[]=request.getCookies();

	// 2. 얻어온 쿠키의 이름과 값을 출력
	for(int i=0; all !=null && i<all.length;i++){
		out.println((i+1)+"-->"+all[i].getName()+ ":" +all[i].getValue()+"<br>");
	}
%>


</body></html>
