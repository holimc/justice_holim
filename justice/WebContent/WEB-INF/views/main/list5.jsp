<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
<script type="text/javascript">
function button_click(s) {
	var url = "https://www1.president.go.kr/petitions/"+s;
	window.open(url);
}
</script>
<jsp:include page="../member/header.jsp"/>
<div class="container-fluid">
<div class="row">
<jsp:include page="side.jsp"/>
<div id="container" style="width: 70%">
<h2>오늘 등록된 청원</h2>
<table class="table">
<thead class="thead-light">
	<tr>
	<th>인덱스</th>
	<th>주제</th>
	<th>제목</th>
	<th>청원바로가기</th>
	<th>청원 만료일</th>
	<th>참여인원</th>
	</tr>
</thead>
<c:forEach var="i" items="${list}">
<tr>
	<td>${i.p_no}</td>
	<td>${i.p_subject}</td>
	<td style="width: 40%"><a href="petitions/info.ju?num=${i.p_no}">${i.p_title}</a></td>
	<td style="width: 10%"><button onclick="button_click(${i.p_no})" class="btn btn-secondary">청원</button></td>
	<td><fmt:formatDate value="${i.p_date}" pattern="yyyy-MM-dd"/></td>
	<td>${i.p_person}명</td>
</tr>
</c:forEach>
</table>
</div>
</div>
</div>
</body>
</html>