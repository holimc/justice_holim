<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<c:if test="${check==1}">
	<c:if test="${updateCheck==0}">
		<script>
			alert("수정에 실패했습니다.");
			history.go(-1);
		</script>
	</c:if>
	<c:if test="${updateCheck==1 }">
		<script>
			alert("수정완료");
			window.location.href="adminpage.ju";
		</script>
	</c:if>
</c:if>
<c:if test="${check==0}">
	<script>
		alert("에러가 발생했습니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${check==-1}">
	<script>
		alert("권한이 없습니다.");
		history.go(-1);
	</script>
</c:if>

</html>