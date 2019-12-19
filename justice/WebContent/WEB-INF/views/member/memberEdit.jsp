<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
<h2>비밀번호 확인</h2>
<form action="changeMember.ju" method="post">
	<input type="hidden" name="id" value="${memId}" />
	<div class="row">
		<div>
			<input type="password" name="passwd" class="form-control" />
		</div>
	</div>
	<input type="submit" value="확인" /> 
	<input type="button" id="main" value="메인으로" />
</form>
</div>
<body>
</body>
</html>
