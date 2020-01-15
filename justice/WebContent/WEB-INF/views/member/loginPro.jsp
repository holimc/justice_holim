<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src='<c:url value="/resources/js/login.js"/>'></script>
<c:if test="${check==1}">
	<script>
	redirect();
	</script>
</c:if>
<c:if test="${check!=1}">
	<script>
		alert("로그인 실패");
		history.go(-1);
	</script>
</c:if>