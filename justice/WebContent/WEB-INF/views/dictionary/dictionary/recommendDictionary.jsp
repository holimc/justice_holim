<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!-- 로그인 체크 -->
<c:if test="${chkLogin==0}">
	<script>
		alert("로그인 후 사용 가능합니다.");
		window.location.href='list.ju';
	</script>
</c:if>
<c:if test="${chkLogin==1 }">
	<!-- 메서드 실행중 에러발생 -->
	<c:if test="${check==0}">
		<script>
			alert("에러가 발생했습니다. 다시시도해주세요");
			history.go(-1);
		</script>
	</c:if>
	<!-- 메서드 실행중 이미 추천한 사람 처리 -->
	<c:if test="${check==-1}">
		<script>
			alert("이미 추천한 단어입니다.");
			history.go(-1);
		</script>
	</c:if>
	<!-- 메서드 정상 작동. -->
	<c:if test="${check>=1}">
		<meta http-equiv='refresh' content='0;url=list.ju?pageNum=${pageNum}'>
	</c:if>
</c:if>