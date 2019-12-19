<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="header.jsp" />
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#pw2").keyup(function(){
			var pw = $("#pw").val();
			var pw2 = $("#pw2").val();
			if(pw==pw2){
				$("#checkPw").html("비밀번호가 동일합니다.")
				}
			else{
				$("#checkPw").html("비밀번호가 다릅니다.")
				}
			})
	})
</script>
<body>
	<div class="container">
		<h3>회원가입</h3>
		<form action="registPro.ju" method="post">
			<table class="table">
				<tr>
					<td>아이디</td>
					<td>
						<div class="row">
							<div class="col-xs-4">
								<input type="text" name="id" class="form-control">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<div class="row">
							<div class="col-xs-4">
								<input type="password" name="passwd" id="pw"
									class="form-control">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>비밀번호확인</td>
					<td>
						<div class="row">
							<div class="col-xs-4">
								<input type="password" name="passwd2" id="pw2"
									class="form-control"> <label id=checkPw></label>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<div class="row">
							<div class="col-xs-4">
								<input type="text" name="name" class="form-control">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<div class="row">
							<div class="col-xs-4">
								<input type="text" name="email" class="form-control">
							</div>
						</div>
					</td>
				</tr>

			</table>
			<input type="submit" value="전송">
		</form>
	</div>
</body>
</html>