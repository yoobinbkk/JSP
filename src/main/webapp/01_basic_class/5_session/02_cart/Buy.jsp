<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="shop.cart.Goods" %> 
<%@ page import="java.util.*" %>

<%
	ArrayList<Goods> glist = null;

	request.setCharacterEncoding("utf-8");
	
	// 1. 세션에서 지정한 cart 속성값을 얻어온다
	glist = (ArrayList<Goods>) session.getAttribute("cart");
	
	// 2. 위의 값이 null 이면 리턴하고, 그렇지 않으면 glist 에 세션의 값을 지정
	if(glist == null) return;
	
	// 3. 세션에서 속성을 제거한다
	session.removeAttribute("cart");

		
%>		 
 
<html>		
<body bgcolor="white">
<table>
<tr bgcolor="#e7a068"><th>상품명</th>
<th>가격</th></tr>

<%
		int sum = 0; 
		int n = glist.size(); 
		 
		for(int i=0; i < n; i++) { 
			Goods goods = (Goods) glist.get(i); 
			int gp = goods.getPrice(); 
			sum += gp; 

%>
			<tr><td align="center"> <%= goods.getName() %></td>
				<td align="right"><%= gp %></td>
			</tr>
<%
		} 	
%>
<tr bgcolor="#e7a068"><td colspan="2" align="right"> 총액 :  <%= sum %> </td></tr>
</table>

<br><br><a href="wshop.jsp">다시 쇼핑하기</a>
</body></html>
