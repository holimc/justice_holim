<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../member/header.jsp"></jsp:include>
<jsp:include page="header.jsp"/>
<h2>주제별 조회</h2>
<h4>${subject}</h4>
<c:forEach var="i" items="${list}">
	<a href="#">${i.p_subject}</a>
	<c:if test="${i.s_id%5==4}"><br/></c:if>
</c:forEach>
</body>
</html>