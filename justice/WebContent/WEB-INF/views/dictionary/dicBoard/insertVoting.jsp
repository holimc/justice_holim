<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${check==1}">
	<script>
		alert("투표 게시 완료");
		location.href="boardList.ju";
	</script>
</c:if>
<c:if test="${check!=1 }">
	<script>
		alert("에러");
		location.href="boardList.ju";
	</script>
</c:if>