<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${adminChk==0 }">
	<script>
		alert("권한이 없습니다.");
		window.location.href="list.ju";
	</script>
</c:if>
<c:if test="${adminChk==1 }">
	<c:if test="${check==0}">
		<script>
			alert("삭제에 실패했습니다. 다시 접근해주세요");
			history.go(-1);
		</script>
	</c:if>
	<c:if test="${check>=1}">
		<meta http-equiv='refresh' content='0;url=list.ju'>
	</c:if>
</c:if>