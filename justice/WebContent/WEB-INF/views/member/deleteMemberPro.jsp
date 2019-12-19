<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result==0}">
<script>
	alert("삭제완료")
	location.href="main.ju"
</script>
</c:if>
<c:if test="${result!=0}">
<script>
	alert("비밀번호가 다릅니다.");
	history.go(-1);
</script>
</c:if>
</body>
</html>