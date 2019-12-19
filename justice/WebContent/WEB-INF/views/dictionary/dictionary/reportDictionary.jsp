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
	<form action="reportDictionaryPro.ju" method="post">
		<table>
			<input type="hidden" name="wname" value="${dicDTO.wname}"/>
			<input type="hidden" name="word_no" value="${dicDTO.word_no}"/>
			<input type="hidden" name="user_id" value="${user_id}" />
			<tr><td>신고할 단어 : ${dicDTO.wname} (번호 : ${dicDTO.word_no}) </td></tr>
			<tr><td>신고 사유 </td></tr>
			<tr><td><textarea name="report_reason" rows="10" cols="20"></textarea> </td></tr>
			<tr><td><input type="submit" value="신고"> </td></tr>
		</table>
	</form>
</c:if>
