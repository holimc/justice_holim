<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<c:if test="${check==0 }">
	<script>
		alert("에러가 발생했습니다.");
		location.href="boardList.ju";
	</script>
</c:if>
<c:if test="${check==-1 }">
	<script>
		alert("잘못된 접근입니다.");
		location.href="boardList.ju";
	</script>
</c:if>
<c:if test="${check==1 }">
	<c:if test="${delChk == 0 }">
		<script>
		alert("에러가 발생했습니다.");
		location.href="boardList.ju";
	</script>
	</c:if>
	<c:if test="${delChk == -1 }">
		<script>
		alert("비밀 번호가 틀렸습니다.");
		history.go(-1);
	</script>
	</c:if>
	<c:if test="${delChk == 1 }">
		<script>
			alert("정상적으로 처리되었습니다.");
			location.href="boardList.ju";
		</script>
	</c:if>
</c:if>

</body>
</html>