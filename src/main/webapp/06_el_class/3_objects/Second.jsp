<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title> 데이타 받는 페이지 </title>
</head>
<body>

<!-- String param = request.getParameter("data"); 
	 session.
-->
파라메터 값(전 페이지에서 넘어오는 값) : ${param.data} <br/> 

<!-- session 말고 sessionScope라고 적어야 함 -->
세션의 값 : ${sessionScope.login} <br/> <!-- ******** -->

쿠키의 값 : ${cookie.isFlag.value} <br/>


<hr>


</body>
</html>