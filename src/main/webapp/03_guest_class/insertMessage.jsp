<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 </title>

<script type="text/javascript" src="./js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">

$(function(){
	
	// 클릭을 했을 때 동작
	$('#submitBtn').click(function(){
		
		// 버튼을 클릭했을 때부터 값을 가져오기
		let name = $('input[name="guestName"]').val()
		let password = $('input[name="password"]').val()
		let message = $('textarea[name="message"]').val()
		
		// 유효성 검사
		if (name == "" || name == null) {
			alert("이름 넣으소");
		} else if (password == "" || password == null) {
			alert("비밀번호 넣으소");
		} else if (message == "" || message == null) {
			alert("메세지 넣으소");
		} else {
			$('form[name=frm]').submit();
		}
		
	});
	
	/*
	$('#submitBtn').click(function(){
		$('form[name=frm]').submit();
	});
	*/
	
});

</script>
</head>

<body>

	<form action="saveMessage.jsp" name="frm" method="post">
		이름 : <input type="text" name="guestName" required /><br/><br/>
		암호 : <input type="password" name="password" required /><br/><br/>
		메세지 : <textarea name="message" rows="3" cols="30" required></textarea><br/><br/>
		<input id='submitBtn' type="button" value="메세지 남기기">
	</form>

</body>
</html>