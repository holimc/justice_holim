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
	<center>단어 리스트 : ${count}</center>
<c:if test="${count == 0 }">
	<table>
		<tr>
			<td>사전에 저장된 단어가 없습니다.</td>
		</tr>
	</table>
</c:if>
<c:if test="${count>0}">
	<table>
		<tr>
			<td>번호</td>
			<td>단어</td>
			<td>대체어</td>
			<td>단어뜻</td>
			<td>추천수</td>
		</tr>
		<c:forEach items="${dictionaryList}" var="dictionary" varStatus="index">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</c:forEach>
		
		
	</table>
</c:if>
	
	

</body>
</html>