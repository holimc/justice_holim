<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<!-- 유효성검사 javascript 구현필요 -->
<body>
<c:if test="${check==1}">
<form action="insertDictionaryPro.ju">
	<table border="1">
		<tr><td>단어명 : <input type="text" name="wname"></td></tr>
		<tr><td>대체어 : <input type="text" name="substitute"></td></tr>
		<tr><td>단어뜻 : <input type="text" name="meaning"></td></tr>
		<tr><input type="hidden" name="user_id" value="${admin}"></td></tr>
		<tr><input type="submit" value="단어 등록" /> </tr>
	</table>
</form>
</c:if>
<c:if test="${check==0}">
	<script>
		alert("권한이 없습니다.");
		window.location.href="list.ju";
	</script>
</c:if>

</body>
</html>