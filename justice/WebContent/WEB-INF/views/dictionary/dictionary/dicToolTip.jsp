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
		<c:forEach items="toolTipList" var="dicDTO" status="count">
		<tr></tr>
		</c:forEach>
	</table>
</c:if>
<c:if test="${fn:length(toolTipList)==0 }">
없
</c:if>
</body>
</html>