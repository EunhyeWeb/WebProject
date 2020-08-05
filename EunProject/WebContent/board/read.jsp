<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.*, com.vo.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#container {
	display: table;
	width: 100%;
	height: 100%;
	text-align: center;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<%@include file="/view/header.jsp"%>
	<%
		String nick = (String) session.getAttribute("nick");
	BoardVO binfo = (BoardVO) request.getAttribute("board");
	%>
	<div style="margin: 100px 100px 100px 100px">
		<!-- 		<form action="/EunProject/update" method="post" id="updateform"> -->
		<pre style="font-family: bold">
								<select name="bnum" style="width: 50px">
									<option>1</option>
								</select>
					<input type="hidden" name="num" value="<%=binfo.getNum()%>"><br />
					BOARD NAME	<input type="text" name="bname" value="<%=binfo.getBname()%>"
							readonly="readonly" style="width: 50%;">
					
					*TITLE		<input type="text" id="title" name="title"
							style="width: 50%;" value=" <%=binfo.getBtitle()%>" readonly="readonly">
					
					*CONTENT		<textarea rows="" id="content" cols="" name="content"
							style="width: 50%; height: 400px" readonly="readonly"><%=binfo.getContent()%></textarea>
					
					 FNAME		<input type="text" name="fname" style="width: 50%;"
							value="<%=binfo.getFname()%>" readonly="readonly">
					 
					 FPATH		<input type="text" name="fpath" style="width: 50%;"
							value="<%=binfo.getFpath()%>" readonly="readonly"> 
					 
					 NOTICE		<input type="text" name="notice" style="width: 50%;"
							value="<%=binfo.getNotice()%>" readonly="readonly">
					 
					 NICKNAME	<input type="text" name="nickname" value="<%=nick%>"
							readonly="readonly" style="width: 50%;">
			 
			</pre>
		<div style="margin-left: 45%;">
			<input type="button" value="LIST" style="width: 100px"
				onclick="location.href='/EunProject/list'";>
		</div>
		<!-- 		</form> -->
	</div>
</body>
</html>