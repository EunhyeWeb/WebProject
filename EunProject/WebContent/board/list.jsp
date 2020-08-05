<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.*, com.vo.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<title>Insert title here</title>
<style type="text/css">
.common {
	display: inline-block;
	width: 22%;
}
</style>
<script type="text/javascript">
	function edit(ret) {
		var snick = document.getElementById("snick").value;
		var wnick = ret.split(",")[0];
		var num = ret.split(",")[1];
		if (wnick == snick) {
			alert("���������մϴ�.");
			location.href = "/EunProject/find?num=" + num.trim();
		} else {
			alert("������ �� �����ϴ�.");
		}
	}

	function Read(num) {
		location.href = "/EunProject/read?num=" + num;
	}

	function wcheck() {
		var snick = document.getElementById("snick").value;
		if (snick == null || snick == "" || snick == "null") {
			alert("�α��� �� �� �ۼ� �����մϴ�.")
		} else {
			location.href = '/EunProject/board/write.jsp'
		}
	}
</script>
</head>
<body>
	<%
		String nick = (String) session.getAttribute("nick");
	List<BoardVO> blist = (List<BoardVO>) request.getAttribute("blist");
	%>
	<%@include file="/view/header.jsp"%>

	<!-- ���� -->
	<div class="w3-container">
		<hr>
		<div class="w3-center">
			<p></p>
			<br> <br>
		</div>
		<div class="w3-responsive w3-card-4">
			<table class="w3-table w3-striped w3-bordered">
				<thead>
					<tr class="w3-theme">
						<th>NUM</th>
						<th>TITLE</th>
						<th>WRITER</th>
						<th>DATE</th>
						<th>VIEW</th>
						<th>EDIT</th>
						<th>DEL</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (BoardVO content : blist) {
					%>
					<tr>
						<input type="hidden" id="snick" value="<%=nick%>">
						<td id="num"><%=content.getNum()%></td>
						<td onclick="Read('<%=content.getNum()%>')"><%=content.getBtitle()%></td>
						<td id="nickname" value="<%=content.getWname()%>"><%=content.getWname()%></td>
						<td><%=content.getWdate()%></td>
						<td><%=content.getView()%></td>
						<td><input type="button" value="EDIT"
							onclick="edit('<%=content.getWname()%>, <%=content.getNum()%>')"></td>
						<td><a href="delete?num=<%=content.getNum()%>">����</a></td>
					</tr>
					<%
						}
					%>

				</tbody>
			</table>

		</div>
	</div>
	<br>
	<hr>
	<br>
	<!-- 	<div class="w3-light-gray "> -->
	<!-- 		<button class="w3-btn w3-theme common" -->
	<!-- 			onclick="location.href='/EunProject/list'">list</button> -->
	<!-- 	</div> -->

	<div style="margin-left: 40%;" >
		<input type="button" value="LIST" style="width: 100px"
			onclick="location.href='/EunProject/list'"> <input
			type="button" value="WRITE" onclick="wcheck()" style="width: 100px">
<!-- 		<input type="button" value="LOGOUT" -->
<!-- 			onclick="location.href='/EunProject/logout'" style="width: 100px"> -->
		<input type="button" value="HOME"
			onclick="location.href='/EunProject'" style="width: 100px">
	</div>
	<!-- �� -->

	<!-- ���� �� -->
	<!-- 		<h1>BOARD</h1> -->
	<!-- 		<div style="margin: 100px 100px 100px 100px; font-size: 1.5em;"> -->
	<!-- 			<table> -->
	<!-- 				<tr> -->
	<!-- 					<th>�Խù���ȣ</th> -->
	<!-- 					<th>�Խù�����</th> -->
	<!-- 					<th>�ۼ���</th> -->
	<!-- 					<th>�ۼ���</th> -->
	<!-- 					<th>��ȸ��</th> -->
	<!-- 					<th>����</th> -->
	<!-- 					<th>����</th> -->
	<!-- 				</tr> -->
	<%-- 				<% --%>
	<%--			for (BoardVO content : blist) { --%>
	<%-- 				%> --%>
	<!-- 				<tr> -->
	<%-- 					<input type="hidden" id="snick" value="<%=nick%>"> --%>
	<%-- 					<td id="num"><%=content.getNum()%></td> --%>
	<%-- 					<td onclick="Read('<%=content.getNum()%>')"><%=content.getBtitle()%></td> --%>
	<%-- 					<td id="nickname" value="<%=content.getWname()%>"><%=content.getWname()%></td> --%>
	<%-- 					<td><%=content.getWdate()%></td> --%>
	<%-- 					<td><%=content.getView()%></td> --%>
	<!-- 					<td><input type="button" value="EDIT" -->
	<%-- 						onclick="edit('<%=content.getWname()%>, <%=content.getNum()%>')"></td> --%>

	<%-- 									<%if(nick.equals(content.getWname())) {%> --%>
	<%-- 									<td><a href="find?num=<%=content.getNum()%>">����</a> </td> --%>
	<%-- 									<%} else{%> --%>

	<!-- 									<td><a href="">����</a> </td> -->
	<%-- 									<%} %> --%>
	<!-- 									<td><input type="button" value="����" onclick="edit()" /></td> -->
	<%-- 					<td><a href="delete?num=<%=content.getNum()%>">����</a></td> --%>
	<!-- 									<td><input type="button" value="����" onclick=""></td> -->
	<!-- 				</tr> -->
	<%-- 				<% --%>
	<%--// } --%>
	<%-- 				%> --%>
	<!-- 			</table> -->
	<!-- 			<input type="button" value="list" style="width: 100px" -->
	<!-- 				onclick="location.href='/EunProject/list'"> <input -->
	<!-- 				type="button" value="write" onclick="wcheck()" style="width: 100px"> -->
	<!-- 			<input type="button" value="LOGOUT" -->
	<!-- 				onclick="location.href='/EunProject/logout'" style="width: 100px"> -->
	<!-- 			<input type="button" value="HOME" -->
	<!-- 				onclick="location.href='/EunProject'" style="width: 100px"> -->
	<!-- 		</div> -->
	<!-- ������ -->
</body>
</html>