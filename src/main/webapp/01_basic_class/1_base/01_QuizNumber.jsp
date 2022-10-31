<%@ page import="java.util.*" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head><title> Number Guess </title></head>
<body>

<%! int answer=0; %>
<%! int numGuesses=0; %>

<% String guess=request.getParameter("guess");
	 	
		if( guess==null ) {
%>
			<p>Welcome to the Number Guess game. </p>

<% 			answer= (int)( Math.random()*100 )  + 1;
			numGuesses=0;
		} else {
			int value=Integer.parseInt(guess);
			
			if( value==answer ){
%>
					<p>Congratulations!!! you got it.<br/><br/>
					And after just <%= numGuesses %> tries..</p>
					
					<p>Care to <a href="01_QuizNumber.jsp"> try again </a> </p>
<%		} else {
%>
			
				Good guess, but nope. try
			
<%				numGuesses++;
				if( value < answer ) {
%>
						<b> higher </b>
<%			} else  if( value > answer ) {
%>

						<b> lower </b>
<%			} 
			}
		}		
%>
		<p>I'm thinking of a number between 1 and 100. </p>
		
		<form method='get'>
				What's your guess?
				<input type='text' name='guess'>
				<input type='submit' value="전송">
		</form>
	</body>
</html>
