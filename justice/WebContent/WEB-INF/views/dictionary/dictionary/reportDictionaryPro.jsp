<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${chkLogin==0 }">
	<script>
		alert("로그인 후 사용 가능합니다.");
		window.location.href='list.ju';
	</script>	
</c:if>
<c:if test="${chkLogin==1 }">
	<c:if test="${check>=1}">
		<meta http-equiv='refresh' content='0;url=list.ju'>
	</c:if>
	<c:if test="${check==0}">
		<script>
			alert("에러가 발생했습니다. 다시시도해주세요.");
			history.go(-1);
		</script>
	</c:if>
	<c:if test="${check<0}">
		<script>
			alert("이미 신고한 게시글입니다.");
			history.go(-1);
		</script>
	</c:if>
</c:if>
