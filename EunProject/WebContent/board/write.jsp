<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
	$().ready(function() {
	});

	function check() {
		var title = document.getElementById("title").value;
		var con = document.getElementById("content").value;
		if (title == "" || title == null) {
			alert("제목을 입력해주세요.");
		} else if (con == "" || con == null) {
			alert("내용을 입력해주세요");
		} else {
			$('#writeform').submit();
		}
	}
</script>
</head>
<body>
	<%@include file="/view/header.jsp"%>
	<%
		String nick = (String) session.getAttribute("nick");
	%>
	<!-- 	<div class="container" -->
	<!-- 		style="height: 100px; background-color: #FFFFF0; align-content: center;"> -->
	<!-- 		<h3 style=>WRITE</h3> -->
	<!-- 	</div> -->
	<div style="margin: 80px 30px 30px 30px;">

		<form action="/EunProject/write	" method="post" id="writeform">
			<pre style="font-family: bold">
									<select name="bnum" style="width: 50px">
										<option>1</option>
									</select>
								
						BOARD NAME	<input type="text" name="bname" value="basic"
								readonly="readonly" style="width: 50%;">
						
						*TITLE		<input type="text" id="title" name="title"
								style="width: 50%;">
								
						*CONTENT		<textarea rows="" id="content" cols="" name="content"
								style="width: 50%; height: 400px"></textarea>
						
						 FNAME		<input type="text" name="fname" style="width: 50%;">
						 
						 FPATH		<input type="text" name="fpath" style="width: 50%;"> 
						 
						 NOTICE		<input type="text" name="notice" style="width: 50%;">
						 
						 NICKNAME	<input type="text" name="nickname" value="<%=nick%>"
								readonly="readonly" style="width: 50%;">
			 
			</pre>
			<div style="margin-left: 40%;">
				<input type="button" value="OK" id="ok" style="width: 100px"
					onclick="return check()"> 
					<input type="reset" value="RESET"
					style="width: 100px"> 
					<input type="button" value="LIST"
					style="width: 100px" onclick="location.href='/EunProject/list'";>
			</div>
		</form>
	</div>
</body>
</html>