<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function() {
		$("#changeMember").click(function() {
			location.href = "memberEdit.ju"
		})
		$("#deleteMember").click(function() {
			location.href = "deleteMember.ju"
		})

	})
</script>

</head>
<body>
	<div class="container">
		<input type="button" value="회원정보수정" id="changeMember"> 
		<input type="button" value="회원탈퇴" id="deleteMember">
	</div>

</body>
</html>