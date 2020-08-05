<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/w3.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#idcheck').click(function() {
			$.ajax({
				type : "POST",
				url : "http://localhost:5284/EunProject/idcheck",
				data : {
					id : document.join.id.value
				},
				success : function(data) {
					if (data == "-1") {
						$("#idresult").html('사용 가능한 ID 입니다.');
					} else if (data == "1") {
						$("#idresult").html('이미 존재 하는 ID 입니다.');
					}
				},
				dataType : "text"
			});
		});
		$('#nickcheck').click(function() {
			$.ajax({
				type : "POST",
				url : "http://localhost:5284/EunProject/nickcheck",
				data : {
					nick : document.join.nick.value
				},
				success : function(data) {
					if (data == "-1") {
						$("#nickresult").html('사용 가능한 닉네임 입니다.');
					} else if (data == "1") {
						$("#nickresult").html('이미 존재 하는 닉네임 입니다.');
					}
				},
				dataType : "text"
			});
		});
	});

	function checkpw() {
		var pw = document.getElementById("pw");
		if (pw.value == "" || pw.value == null) {
			alert("enter your password");
		} else {
			$('#joinform').submit();
		}
	}
</script>
<style type="text/css">
.common {
	display: inline-block;
	width: 22%;
}

.w3-row-padding {
	padding: 0 500px;
	margin-top: 80px
}
</style>
</head>
<body>
	<div class="w3-row-padding">
		<div class="w3-col">
			<h4>JOIN</h4>
			<p>Enter your ID & PASSWORD</p>
			<form action="/EunProject/join" method="post" id="joinform" id="join" name="join">
				<p>
				<div class="t common">
<!-- 					<input class="w3-input w3-border" type="text" placeholder="id" -->
<!-- 						name="id" id="id"> -->
						<input class="w3-input w3-border" type="text" name="id"
						id="id" placeholder="id">
				</div>
				<div class="t2 common">
					<input class="w3-input w3-border" type="button" 
						id="idcheck" value="중복체크">
				</div>
				<div class="t3 common" id="idresult"></div>

				</p>
				<p>
				<input type="text" name="pw" id="pw" class="w3-input w3-border" type="text"
						placeholder="password">
<!-- 					<input class="w3-input w3-border" type="text" -->
<!-- 						placeholder="password" name="pw" id="pw"> -->
				</p>
				<p>
				<div class="t common" > <input type="text"
						name="nickname" id="nick" class="w3-input w3-border" placeholder="nickname">
				</div>
				<div class="t1 common" style="width: 80px">
					<input type="button" id="nickcheck" value="중복체크" class="w3-input w3-border">
				</div>
				<div id="nickresult" class="t2 common" class="w3-input w3-border"></div>
				</p>
				<p>
					<input class="w3-input w3-border" type="text" name="birth" placeholder="birth">
<!-- 					<input class="w3-input w3-border" type="text" -->
<!-- 						placeholder="password" name="pw" id="pw"> -->
				</p>
				<p>
				<input class="w3-input w3-border" type="text" name="email" placeholder="email">
<!-- 					<input class="w3-input w3-border" type="text" -->
<!-- 						placeholder="password" name="pw" id="pw"> -->
				</p>
				<p>
				 woman<input class="w3-input w3-border" type="radio" name="gender" value="woman">  man<input class="w3-input w3-border" type="radio" name="gender" value="man">
<!-- 					<input class="w3-input w3-border" type="text" -->
<!-- 						placeholder="password" name="pw" id="pw"> -->
				</p>
				<p>
					<input class="w3-input w3-border" type="text"  type="text" name="phone" placeholder="phone">
				</p>
				<input type="button" class="w3-button w3-block w3-black"
					onclick="return checkpw()" value="SEND"> <br />
				<button type="reset" class="w3-button w3-block w3-black">RESET</button>
				<!--           <input type="reset" value="reset"> -->
			</form>
		</div>
	</div>
	<!-- 원래 뷰 -->
<!-- 	<div style="margin: 100px 100px 100px 100px"> -->
<!-- 		<h3>JOIN</h3> -->
<!-- 		<h4>*는 필수 입력 항목입니다.</h4> -->
<!-- 		<form action="/EunProject/join" method="post" name="join" -->
<!-- 			id="joinform"> -->
<!-- 			<div class="t common">* ID 		: <input type="text" name="id" -->
<!-- 						id="id"> -->
<!-- 				</div> -->
<!-- 				<div class="t1 common" style="width: 80px"> -->
<!-- 					<input type="button" id="idcheck" value="중복체크"> -->
<!-- 				</div> -->
<!-- 				<div id="idresult" class="t2 common"></div> -->
<!-- 				<br />  -->
<!-- 			* PW 		: <input type="text" name="pw" id="pw"><br />  -->
<!-- 			<div class="t common">* NICKNAME 	: <input type="text" -->
<!-- 						name="nickname" id=nick> -->
<!-- 				</div> -->
<!-- 				<div class="t1 common" style="width: 80px"> -->
<!-- 					<input type="button" id="nickcheck" value="중복체크"> -->
<!-- 				</div> -->
<!-- 				<div id="nickresult" class="t2 common"></div> -->
<!-- 				<br />  -->
<!-- 			 birthday 	: <input type="text" name="birth"><br />  -->
<!-- 			 email 		: <input type="text" name="email"><br />  -->
<!-- 			 gender 	: woman<input type="radio" name="gender" value="woman"> man<input -->
<!-- 					type="radio" name="gender" value="man"><br /> -->
<!-- 			 phone 		: <input type="text" name="phone"><br /> -->
<!-- 			<input type="button" value="ok" onclick="return checkpw()">  <input -->
<!-- 					type="reset" value="reset"> -->
<!-- 		</form> -->
<!-- 	</div> -->
	<!-- 원래 뷰 끝 -->
</body>
</html>