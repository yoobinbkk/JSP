<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoardInputForm</title>
</head>
<body>

<h4> 게시판 글 쓰기 </h4><br/>

<form name='frm' method='post' action="BoardControl?cmd=input-doo">
	작성자 : <input type='text' name='writer'><br/><br/>
	제  목 : <input type='text' name='title'><br/><br/>
	내  용 : <textarea rows='10' cols='40' name='content'></textarea><br/><br/>
	비밀번호 : <input type='password' name='pass'><br/><br/>
<input type='submit' value='작성'>
<input type='reset' value='취소'>
</form>

</body>
</html>