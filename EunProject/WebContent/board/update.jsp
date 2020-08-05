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
	function check() {
		var title = document.getElementById("title").value;
		var con = document.getElementById("content").value;
		if (title == "" || title == null) {
			alert("제목을 입력해주세요.");
		} else if (con == "" || con == null) {
			alert("내용을 입력해주세요");
		} else {
			$('#updateform').submit();
		}
	}
</script>
</head>
<body>
	<%@include file="/view/header.jsp"%>
	<%
		String nick = (String) session.getAttribute("nick");
	BoardVO binfo = (BoardVO) request.getAttribute("board");
	%>
	<div style="margin: 80px 100px 100px 100px">
		<form action="/EunProject/update" method="post" id="updateform">
			<pre style="font-family: bold">
								<select name="bnum" style="width: 50px">
									<option>1</option>
								</select>
					<input type="hidden" name="num" value="<%=binfo.getNum()%>"><br />
					BOARD NAME	<input type="text" name="bname" value="<%=binfo.getBname()%>"
							readonly="readonly" style="width: 50%;">
					
					*TITLE		<input type="text" id="title" name="title"
							style="width: 50%;" value=" <%=binfo.getBtitle()%>">
					
					*CONTENT		<textarea rows="" id="content" cols="" name="content"
							style="width: 50%; height: 400px"><%=binfo.getContent()%></textarea>
					
					 FNAME		<input type="text" name="fname" style="width: 50%;"
							value="<%=binfo.getFname()%>">
					 
					 FPATH		<input type="text" name="fpath" style="width: 50%;"
							value="<%=binfo.getFpath()%>"> 
					 
					 NOTICE		<input type="text" name="notice" style="width: 50%;"
							value="<%=binfo.getNotice()%>">
					 
					 NICKNAME	<input type="text" name="nickname" value="<%=nick%>"
							readonly="readonly" style="width: 50%;">
			 
			</pre>
			<div style="margin-left: 40%;">
				<input type="button" value="ok" id="ok" style="width: 100px"
					onclick="return check()"> <input type="reset" value="reset"
					style="width: 100px"> <input type="button" value="list"
					style="width: 100px" onclick="location.href='/EunProject/list'";>
			</div>
		</form>
	</div>
</body>
</html>