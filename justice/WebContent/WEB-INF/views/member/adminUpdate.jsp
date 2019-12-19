<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${check>0 }">
	<form id="${vo.id}" class="${vo.id}" action="#">
		<table>
			<tr>
				<td><input type="text" value="${vo.id}" name="${vo.id}_id" id="${vo.id}_id" readonly/></td>
				<td><input type="text" value="${vo.passwd}" name="${vo.id}_passwd" id="${vo.id}_passwd" /></td>
				<td><input type="text" value="${vo.name}" name="${vo.id}_name" id="${vo.id}_name"/></td>
				<td><input type="text" value="${vo.email}" name="${vo.id}_email" id="${vo.id}_email" /></td>
				<td><input type="button" id="btn_${vo.id}" value="전송" onclick="updateBtn('${vo.id}')"/></td>
			</tr>
		</table>
	</form>
</c:if>
<c:if test="${check==0}">
	<script>
		alert("에러가 발생했습니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${check==-1}">
	<script>
		alert("권한이 없습니다.");
		history.go(-1);
	</script>
</c:if>