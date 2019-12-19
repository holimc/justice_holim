<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="header.jsp" />
</head>
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
								<input type="password" name="passwd" class="form-control">
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