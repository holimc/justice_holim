<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<c:if test="${check==0 }">
	<script>
		alert("에러가 발생했습니다.");
		location.href="boardList.ju";
	</script>
</c:if>
<c:if test="${check==-1 }">
	<script>
		alert("잘못된 접근입니다.");
		location.href="boardList.ju";
	</script>
</c:if>
<c:if test="${check==1 }">
	<c:if test="${updateChk==1 }">
		<script>
			alert("수정 완료");
			location.href="boardList.ju";			
		</script>
	</c:if>
	<c:if test="${updateChk!=1 }">
		<script>
		alert("수정 도중 에러가 발생했습니다.");
		history.go(-1);
	</script>
	</c:if>
</c:if>
</body>
</html>