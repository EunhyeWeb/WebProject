<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>로그인</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/w3.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	function check() {
		var id = document.getElementById("id");
		var pw = document.getElementById("pw");
		if (id.value == null || id.value == "") {
			alert("id 를 입력하세요");
		} else if (pw.value == null || pw.value == "") {
			alert("pw 를 입력하세요");
		} else {
			$('#loginform').submit();
		}
	}
</script>
<style type="text/css">
.w3-row-padding {
	padding: 0 500px;
	margin-top: 80px
}
</style>
</head>
<body>
	<div class="w3-row-padding">
		<div class="w3-col">
			<h4>LOGIN</h4>
			<p>Enter your ID & PASSWORD</p>
			<form action="/EunProject/login" method="post" id="loginform">
				<p>
					<input class="w3-input w3-border" type="text" placeholder="id"
						name="id" id="id">
				</p>
				<p>
					<input class="w3-input w3-border" type="text"
						placeholder="password" name="pw" id="pw">
				</p>
				<input type="button" class="w3-button w3-block w3-black"
					onclick="check()" value="SEND"> <br />
				<button type="reset" class="w3-button w3-block w3-black">RESET</button>
				<!--           <input type="reset" value="reset"> -->
			</form>
		</div>
	</div>

	<!-- 원래뷰 -->
	<!-- 	<div class="w3-container w3-padding-32 w3-padding-large" id="contact"> -->
	<!-- 		<div class="w3-content"> -->
	<!-- 			<div class="w3-center" style="font-size: 30px"> -->
	<!-- 		<form action="/EunProject/login" method="post"> -->
	<!-- 			ID : <input type="text" name="id"><br /> PW : <input -->
	<!-- 				type="text" name="pw"><br /> <input type="submit" -->
	<!-- 				value="ok"> <input type="reset" value="reset"> -->
	<!-- 		</form> -->
	<!-- 			</div> -->
	<!-- 		</div>	 -->
	<!-- 	</div> -->
</body>
</html>