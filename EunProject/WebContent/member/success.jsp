<%@page import="com.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Dialog - Animation</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#dialog").dialog({
			autoOpen : false,
			show : {
				effect : "blind",
				duration : 1000
			},
			hide : {
				effect : "explode",
				duration : 1000
			}
		});

		$("#opener").on("click", function() {
			$("#dialog").dialog("open");
		});
	});
</script>
</head>
<body>
	<%
		// 		MemberVO member = (MemberVO) request.getAttribute("uinfo");
	String path = application.getContextPath();
	String nick = (String) session.getAttribute("nick");
	String id = (String) session.getAttribute("id");
	%>
	<h1><%=nick%>! WELCOME MY PAGE
	</h1>
	<div style="margin: 100px 100px 100px 100px; font-size: 1.5em">
		<a href='<%=path%>/list'>BOARDLIST</a><br /> <a
			href='<%=path%>/board/write.jsp'>BOARD WRITE</a>
	</div>
	<div id="dialog" title="Basic dialog">
		<p>This is Eunhyes WEBPAGE.</p>
	</div>

	<button id="opener">Open Dialog</button>

</body>
</html>