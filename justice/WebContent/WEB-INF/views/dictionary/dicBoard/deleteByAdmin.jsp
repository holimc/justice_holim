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
<c:if test="${check==0}">
<script>
	alert("삭제에 실패했습니다.");
</script>
</c:if>
<c:if test="${check==1 }">
<script>
	alert("성공적으로 삭제했습니다.");
</script>
</c:if>

</body>
</html>