<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<jsp:include page="header.jsp"></jsp:include>
<body>
	<c:if test="${check==1 }">
		<div class="container">
			<h2>회원정보수정</h2>
			<form action="changeMemberPro.ju" method="post">
				<input type="hidden" name="id" value="${memId}"> 
				비밀번호 <input type="password" name="passwd"><br />
				이메일 <input type="text"	name="email" value="${email}"><br /> 
				<input type="submit"value="변경"> 
				<input type="button" id="main" value="메인">
			</form>
		</div>
	</c:if>
	<c:if test="${check!=1}">
		<script type="text/javascript">
			alert("비밀번호를 잘못 입력했습니다.");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>