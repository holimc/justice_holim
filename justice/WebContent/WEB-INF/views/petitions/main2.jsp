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
<jsp:include page="../member/header.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript">
function button_click(s) {
	var url = "https://www1.president.go.kr/petitions/"+s;
	window.open(url);
}
function button_click2(s) {	
	var tmp = s.substring(30);
	var url ="https://www.youtube.com/watch?v="+tmp
	window.open(url)
	
}
</script>
<body>
<h2>${title}</h2>
<table class="table">
<thead>
	<tr>
		<td>인덱스</td>
		<td>주제</td>
		<td>제목</td>
		<td></td>
		<td></td>
		<td>청원 만료일</td>
		<td>청원 답변일</td>
		<td>참여인원</td>
		<td>답변여부</td>	
	</tr>
</thead>
<c:forEach var="i" items="${list}">
<tr>
	<td>${i.a_no}</td>
	<td>${i.p_subject}</td>
	<td style="width: 50%">${i.p_title}</td>
	<td style="width: 10%"><button onclick="button_click(${i.p_no})" class="btn btn-secondary">청원바로가기</button></td>
	<td><button onclick="button_click2('${i.a_link}')">유튜브링크</button></td>	
	<td><fmt:formatDate value="${i.p_date}" pattern="yyyy-MM-dd"/></td>
	<td><fmt:formatDate value="${i.a_date}" pattern="yyyy-MM-dd"/></td>
	<td>${i.p_person}명</td>
	<td>
		<c:if test="${i.p_check==1}">답변완료</c:if>
		<c:if test="${i.p_check==0}">답변미완료</c:if>
	</td>
	
</tr>
</c:forEach>
</table>
<c:if test="${startPage!=1}">
	<a href="answer.ju?num=${startPage-10}">이전</a>
</c:if>
<c:forEach begin="${startPage}" end="${lastPage}" var="i">
	<a href="answer.ju?num=${i}">${i}</a>
</c:forEach>
<c:if test="${lastPage!=pageAll}">
	<a href="answer.ju?num=${lastPage+1}">다음</a>
</c:if>
</body>
</html>