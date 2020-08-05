<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="RSS.jsp"></script>
<script>
	$(function() {
		$('#info').load("RSS.jsp");
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
	<%@include file="/view/header.jsp"%>
	<%
		//java 코드
	String path = application.getContextPath();
	%>

	<div class="w3-content" style="max-width: 1100px">
		<div class="w3-row w3-padding-64" id="about">
			<div class="w3-col m6 w3-padding-large w3-hide-small" style="margin-top: 120px">
				<img src="image/go.png" class="w3-round w3-image w3-opacity-min"
					alt="Table Setting" width="600" height="750">
			</div>

			<div class="w3-col m6 w3-padding-large" style="margin-top: 80px">
				<h2 class="w3-center">This is Eunhye page</h2>
				<br>
				<h4 class="w3-center"> WHERE YOU GO?</h4>
				<p class="w3-large w3-text-grey w3-hide-medium">Todays PICK : JEJU</p>
				<div class="w3-large" id="info"></div>
<!-- 				<p class="w3-large"> -->
<!-- 					The Catering was founded in blabla by Mr. Smith in lorem ipsum -->
<!-- 					dolor sit amet, consectetur adipiscing elit consectetur adipiscing -->
<!-- 					elit, sed do eiusmod tempor incididunt ut labore et dolore magna -->
<!-- 					aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco -->
<!-- 					laboris nisi ut aliquip ex ea commodo consequat. Duis aute -->
<!-- 					iruredolor in reprehenderit in voluptate velit esse cillum dolore -->
<!-- 					eu fugiat nulla pariatur.We only use <span -->
<!-- 						class="w3-tag w3-light-grey">seasonal</span> ingredients. -->
<!-- 				</p> -->
<!-- 				<p class="w3-large w3-text-grey w3-hide-medium">Excepteur sint -->
<!-- 					occaecat cupidatat non proident, sunt in culpa qui officia deserunt -->
<!-- 					mollit anim id est laborum consectetur adipiscing elit, sed do -->
<!-- 					eiusmod temporincididunt ut labore et dolore magna aliqua. Ut enim -->
<!-- 					ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut -->
<!-- 					aliquip ex ea commodo consequat.</p> -->
			</div>
		</div>
	</div>
	<!-- 원래뷰 -->
<!-- 	<div> -->
<!-- 		<img alt="go" src="image/go.png" class="w3-image w3-greyscale-min" -->
<!-- 			style="width: 500px; height: 500px; margin-top: 60px; margin-left: 100px"> -->
<!-- 	</div> -->
<!-- 	<div class="w3-display-right w3-container" id="info"></div> -->
	<!-- 원래 뷰 끝 -->

	<!-- 		<p class="w3-xlarge">monday - friday 10-23 | saturday 14-02</p> -->
	<!-- 		<p class="w3-large">42 village St, New York</p> -->
	<!-- 		<p> -->
	<!-- 			powered by <a href="https://www.w3schools.com/w3css/default.asp" -->
	<!-- 				target="_blank">w3.css</a> -->
	<!-- 		</p> -->


	<!-- 	<div id="info"></div> -->
	<!-- 	<div style=" font- size: 1.5em; align-content: center"> -->
	<!-- 	<input type="button" value="JOIN" onclick="location.href='/EunProject/member/join.jsp'"> -->
	<!-- 	<input type="button" value="LOGIN" onclick="location.href='/EunProject/member/login.jsp'"> -->
	<!-- 	<input type="button" value="LOGOUT" onclick="location.href='/EunProject/logout'"> -->
	<!-- 	<div id="dialog" title="Basic dialog"> -->
	<!-- 		<p>This is Eunhyes WEBPAGE.</p> -->
	<!-- 	</div> -->
	<!-- 	<button id="opener">Open Dialog</button> -->
	<!-- 		<img alt="go" src="go1.png" style="width: 95%; height: 95%"> -->
	<!-- 	</div> -->

	<%-- 		<a href='<%=path%>/member/join.jsp'>1. 회원가입 </a><br/> --%>
	<%-- 		<a href='<%=path%>/member/login.jsp'>2. 로그인</a><br/> --%>
</body>
</html>