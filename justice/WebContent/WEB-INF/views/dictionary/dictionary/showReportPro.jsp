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
<c:if test="${adminChk==0 }">
	<script>
		alert("권한이 없습니다.");
		window.location.href="list.ju";
	</script>
</c:if>
<c:if test="${adminChk==1 }">
	<table class="table">
		<tr>
			<td>신고자</td>
			<td>단어명</td>
			<td>신고사유</td>
		</tr>
	<c:forEach items="${reportContent}" var="rc">
		<tr>
			<td>${rc.user_id}</td>
			<td>${rc.wname}</td>
			<td>${rc.report_reason}</td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>