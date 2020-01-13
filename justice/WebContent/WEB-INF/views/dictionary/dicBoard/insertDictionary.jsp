<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${check == -2 }">
	<script>
		alert("비정상적인 접근입니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${check == -1 }">
	<script>
		alert("에러가 발생했습니다.");
		location.href="boardList.ju";
	</script>
</c:if>
<c:if test="${check == 0 }">
	<script>
		alert("이미 등재된 단어입니다.");
		location.href="boardList.ju";
	</script>
</c:if>
<c:if test="${check == 1 }">
	<script>
		alert("정상 처리되었습니다.");
		location.href="boardList.ju";
	</script>
</c:if>
