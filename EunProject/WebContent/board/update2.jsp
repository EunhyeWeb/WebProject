<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.*, com.vo.BoardVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String nick =(String)session.getAttribute("nick");
	BoardVO binfo = (BoardVO)request.getAttribute("board");
%>
<div style="margin: 100px 100px 100px 100px">
		<h3>WRITE</h3>
		<form action="/EunProject/update" method="post">
			<select name="bnum">
				<option>1</option>
			</select>
			 <input type="hidden" name="num" value ="<%=binfo.getNum() %>" ><br/>
			게시판 이름<input type="text" name="bname" value ="<%=binfo.getBname() %>" readonly="readonly"><br/>
			*TITLE 	: <input type="text" name="title" value="<%=binfo.getBtitle()%>"><br /> 
			*CONTENT  <textarea rows="" cols="" name="content"><%=binfo.getContent() %></textarea><br /> 
			 fname 	 <input type="text" name="fname" value="<%=binfo.getFname()%>"><br /> 
			 fpath 	 <input type="text" name="fpath" value="<%=binfo.getFpath()%>"><br /> 
			 notice  <input type="text" name="notice" value="<%=binfo.getNotice()%>"><br />
			 NICKNAME  <input type="text" name="nickname" value="<%=nick%>" readonly="readonly"><br /> 
			<input type="submit" value="ok"> 
			<input type="reset" value="reset">
		</form>
	</div>
</body>
</html>