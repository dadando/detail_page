<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.spring.alltion.hongsub.BoardVO" %>
<%
	String id = null;
	if(session.getAttribute("userId")!=null){
		id = (String)session.getAttribute("userId");
	}
	ArrayList<BoardVO> boardList = (ArrayList<BoardVO>)request.getAttribute("boardlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
현재 접속중인 사용자: <%=id %>

<form>
	<div align="center">
	<fieldset style="width:300px;">
	<legend>경매 리스트</legend>
		<ul>
		<%for(int i=0;i<boardList.size();i++){
			BoardVO bvo = (BoardVO)boardList.get(i);
		%>
			<li>
				<a href="./boarddetail.hs?product_number=<%=bvo.getProduct_number() %>">
				<%=bvo.getProduct_subject() %></a>
			</li>
		<%
		}
		%>
		</ul>
	</fieldset>
	<a href="./logout.hs">[로그아웃]</a>
	</div>
	
</form>
</body>
</html>