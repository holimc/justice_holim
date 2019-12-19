<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${adminChk==0 }">
	<script>
		alert("권한이 없습니다.");
		window.location.href="list.ju";
	</script>
</c:if>
<c:if test="${adminChk==1 }">
	<c:if test="${check==0 || empty check}">
		<script>
			alert("단어를 등록할 수 없습니다.");
			history.go(-1);
		</script>
	</c:if>
	<c:if test="${check>=0}">
		<meta http-equiv='refresh' content='0;url=list.ju'>
	</c:if>
</c:if>
</body>
</html>