<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD Xhtml 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<script>
		var xmlHttp;
		window.onload=function(){
			// 1. 브라우저에 따른 XMLHttpRequest생성하기.
			xmlHttp = new XMLHttpRequest();
			
			// 2. 요청에 대한 응답처리 이벤트 리스너 등록.
			xmlHttp.onreadystatechange=on_ReadyStateChange;
			
			// 3.서버로 보낼 데이터 생성.
			// 3.데이터 생성.
			var data = "cate=book&name=kim";
			
			//###########################################################
			// 4. GET방식으로 데이터 보내기, 응답은 비동기로 클라이언트<->서버간의 연결 요청준비.
			xmlHttp.open("GET", "01_server.jsp?"+data, true);			
			// 5. 실제 데이터 전송.
			xmlHttp.send(null);
			//####
			
			// T. 동기/비동기 실행 테스트를 위한 부분.
			alert("전송 시작!");
		}
		
			
		// 6.응답처리.
		function on_ReadyStateChange(){
			// 4=데이터 전송 완료.(0=초기화전,1=로딩중,2=로딩됨,3=대화상태)
			if(xmlHttp.readyState==4){
				//200은 에러 없음.(404=페이지가 존재하지 않음)
				if(xmlHttp.status==200){
					// 서버에서 받은 값.
					alert("서버에서 받은 원본 데이터 : "+xmlHttp.responseText);
					
					//7. 데이터 파싱처리.
					parseData(xmlHttp.responseText);
				}
				else{
					alert("처리 중 에러가 발생했습니다.");
				}
			}
		}
		
		//##################################################
		//7. CSV포맷  데이터 처리.
		function parseData(strText){
			
			// alert( strText );
			
			var aryData = strText.split("|");
						
			for(var i=0;i<aryData.length;i++){
				var param  = aryData[i].split("=");				
				if( param[0].trim() == 'cate'){  // 공백제거를 하지 않으면 처음에 공백에 들어와서 cate를 찾지 못함
					 document.getElementById("cate").value = param[1];
				}
				
				if( param[0].trim() == 'name'){
					document.getElementById("name").value = param[1];
				}
			
			}
			
		}
	</script>
</head>

<body>
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
</body>
</html>


