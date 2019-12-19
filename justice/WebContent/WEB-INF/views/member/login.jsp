<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="header.jsp"/>
<body>
	<div class="container">
		<form action="loginPro.ju" method="post">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="id" name="id" class="form-control" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="passwd" class="form-control" /></td>
				</tr>
			</table>
			<input type="submit" value="로그인" />
		</form>
	</div>
</body>
</html>