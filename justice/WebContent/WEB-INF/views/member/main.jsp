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
<jsp:include page="header.jsp"></jsp:include>
<div class="container-fluid">

<div class="row">
<jsp:include page="side.jsp"/>
<div>
<h2>국민청원 한눈에보기</h2>
<h4>전날 대비 증가된 청원수  TOP 5</h4>
<table class="table">
<tr>
	<td>인덱스</td>
	<td>주제</td>
	<td>제목</td>
	<td>청원바로가기</td>
	<td>청원 만료일</td>
	<td>참여인원</td>
	<td>답변여부</td>	
</tr>
<c:forEach var="i" items="${list}">
<tr>
	<td>${i.p_no}</td>
	<td>${i.p_subject}</td>
	<td style="width: 40%"><a href="petitions/info.ju?num=${i.p_no}">${i.p_title}</a></td>
	<td style="width: 10%"><button onclick="button_click(${i.p_no})" class="btn btn-secondary">청원</button></td>
	<td><fmt:formatDate value="${i.p_date}" pattern="yyyy-MM-dd"/></td>
	<td>${i.p_person}명</td>
	<td>
		<c:if test="${i.p_check==1}">답변완료</c:if>
		<c:if test="${i.p_check==0}">답변미완료</c:if>
	</td>	
</tr>
</c:forEach>
</table>
</div>
</div>
</div>
</body>
</html>