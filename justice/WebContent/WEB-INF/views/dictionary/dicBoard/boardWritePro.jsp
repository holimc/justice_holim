<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${check==0 }">
<!-- check==0, if문 에러 -->
	<script>
		alert("에러가 발생했습니다. 다시시도해주세요.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${check==-1 }">
<!-- check == -1, 세션없음 -->
	<script>
		alert("로그인 후 이용해주세요.");
		location.href="../justice/login.ju";
	</script>	
</c:if>
<c:if test="${check==-2 }">
<!-- 넘어온값에서 null값 존재. -->
	<script>
		alert("입력시 에러가 발생했습니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${check==1 }"></c:if>
	<script>
		alert("정상 처리되었습니다.");
		location.href="boardList.ju";
	</script>
</body>
</html>