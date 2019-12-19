<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function() {
		$("#next").click(function() {
			var check = confirm("탈퇴하시겠습니까?");
			var pw = $("#pw").val();
			if (check) {
				location.href = "deleteMemberPro.ju?passwd=" + pw;
			} else {
				alert("취소되었습니다.");
				location.href = "main.ju"
			}
		})

	})
</script>
</head>

<body>
	<div class="container">
		<h2>비밀번호 입력</h2>
		<input type="password" name="passwd" id="pw" /> <input type="button"
			id="next" value="탈퇴" />
	</div>
</body>

</html>