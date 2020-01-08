<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../member/header.jsp"/>
<div class="container-fluid">
<div class="row">
<jsp:include page="side.jsp"/>
<div id="container">
<h2>청원수 돌파/미답변</h2>
<script type="text/javascript">
function button_click(s) {
	var url = "https://www1.president.go.kr/petitions/"+s;
	window.open(url);
}
</script>
<table class="table">
<tr>
	<td>인덱스</td>
	<td>주제</td>
	<td>제목</td>
	<td>청원바로가기</td>
	<td>청원 만료일</td>
	<td>참여인원</td>
	<td>답변여부</td>	
	<td>경과</td>
</tr>
<fmt:parseNumber var ="now" value="${Time.time/(1000*60*60*24)}" integerOnly="true"/>
<c:forEach var="i" items="${list}">
<fmt:parseNumber var="day" value="${i.p_date.time/(1000*60*60*24)}" integerOnly="true" />
<tr>
	<td>${i.p_no}</td>
	<td>${i.p_subject}</td>
	<td style="width: 40%"><a href="info.ju?num=${i.p_no}">${i.p_title}</a></td>
	<td style="width: 10%"><button onclick="button_click(${i.p_no})" class="btn btn-secondary">청원</button></td>
	<td><fmt:formatDate value="${i.p_date}" pattern="yyyy-MM-dd"/></td>
	<td>${i.p_person}명</td>
	<td>
		<c:if test="${i.p_check==1}">답변완료</c:if>
		<c:if test="${i.p_check==0}">답변미완료</c:if>
	</td>
	<td>${now-day}일</td>
</tr>
</c:forEach>
</table>
</div>
</div>
</div>
</body>
</html>