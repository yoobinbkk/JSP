<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
<%@ page import="shop.cart.Goods" %> 
<%
	String id="";
	String name ="";
	int price=0;

	ArrayList<Goods> glist = null;

	request.setCharacterEncoding("utf-8");
	
	if (request.getParameter("id")==null) {
		
		glist = new ArrayList<Goods> ();
		
	} else {
		
		// 1. Form의 값(hidden값) 넘겨받기 ( id, name, price )
		id = request.getParameter("id");
		name = request.getParameter("name");
		price = Integer.parseInt(request.getParameter("price"));
		  
	 	// 2. 세션의 cart 속성을 얻어와서 glist로 선언.
	 	glist = (ArrayList<Goods>) session.getAttribute("cart");
	 
	 	// 3. 만일 null이면 ArrayList 객체 새로 생성하고 그렇지 않으면 ArrayList 변수(glist)에 지정
	 	if (glist == null) {
	    	glist = new ArrayList<Goods> ();
	 	}
	 	// 4. 1번의 값들을 Goods 객체로 생성후 ArrayList 에 추가   
	    	glist.add(new Goods(id, name, price));
	    
	 	// 5. 세션에 cart 라는 이름에 ArrayList를 저장
	    	session.setAttribute("cart", glist);
		
	}
	

%>		 
		 
<html> 
<body bgcolor=white>
<%= name %> 을 구입하셨습니다.
 
<br><br><br>

<table>
<tr bgcolor="#e7a068"><th>상품명</th>
<th>가격</th></tr>

<%
		int n = glist.size(); 
		int sum = 0; 
		for(int i=0; i < n; i++) { 
			Goods goods = (Goods) glist.get(i); 
			int gp = goods.getPrice(); 
			sum += gp; 
%>
			<tr><td align="center"> <%= goods.getName() %> </td>
				<td align="right"> <%= gp %> </td></tr>
<%
		} 		 
%>

<tr bgcolor="#e7a068"><td colspan="2" align="right"> 총액 : <%= sum  %></td></tr>
</table>

<br/><br/>
[<a href="wshop.jsp">쇼핑하러 가기</a>]
[<a href="Buy.jsp">구입하기</a>]

</body></html>

