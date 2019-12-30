<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${check==-4 }">
	<script>
		alert("이미 마감된 투표입니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${check==-3 }">
	<script>
		alert("이미 투표하였습니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${check==-2 }">
	<script>
		alert("잘못된 접근입니다.");
		location.href="voteList.ju";
	</script>
</c:if>
<c:if test="${check==-1 }">
	<script>
		alert("로그인 후 이용 가능합니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${check==0 }">
	<script>
		alert("에러가 발생했습니다..");
		history.go(-1);
	</script>
</c:if>
<c:if test="${check==1 }">
	<script>
		alert("정상적으로 처리되었습니다.");
		history.go(-1);
	</script>
</c:if>