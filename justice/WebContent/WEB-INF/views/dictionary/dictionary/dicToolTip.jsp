<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${fn:length(toolTipList)!=0 }">
	<table>
		<tr>${keyword}</tr>
		<c:forEach items="${toolTipList}" var="dicDTO" varStatus="status">
			<tr>
				<td>${status.count}.</td>
				<td>[${dicDTO.substitute}]</td>
				<td>= ${dicDTO.meaning}.</td>
			</tr>
		</c:forEach>
	</table>
</c:if>
<c:if test="${fn:length(toolTipList)==0 }">
	<table>
		<tr>${keyword}</tr>
		<tr>해당 단어는 아직 사전에 등재되지 않은 단어입니다.</tr>
	</table>
</c:if>
</body>
</html>