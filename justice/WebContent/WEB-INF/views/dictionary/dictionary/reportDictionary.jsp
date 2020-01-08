<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="<c:url value="/resources/dictionary/css/dictionaryStyle.css"/>" rel="stylesheet" />
<jsp:include page="../../member/header.jsp" />
<div class="container-fluid">
<div class="row">
<jsp:include page="../dictionary_view/dic_side.jsp"/>

<c:if test="${chkLogin==0 }">
	<script>
		alert("로그인 후 사용 가능합니다.");
		location.href='list.ju';
	</script>
</c:if>


<c:if test="${chkLogin==1 }">
	<div id="container">
	<form action="reportDictionaryPro.ju" method="post">
		<table class="table">
			<input type="hidden" name="wname" value="${dicDTO.wname}"/>
			<input type="hidden" name="word_no" value="${dicDTO.word_no}"/>
			<input type="hidden" name="user_id" value="${user_id}" />
			<tr><td>신고할 단어 : ${dicDTO.wname} (번호 : ${dicDTO.word_no}) </td></tr>
			<tr><td>신고 사유 </td></tr>
			<tr><td><textarea name="report_reason" rows="10" cols="50"></textarea> </td></tr>
			<tr><td><input type="submit" class="myButton" value="신고"> </td></tr>
		</table>
	</form>
	</div>
</c:if>
</div>
</div>
