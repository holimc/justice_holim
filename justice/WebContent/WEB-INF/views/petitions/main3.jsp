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
<jsp:include page="../member/header.jsp"/>
<jsp:include page="header.jsp"/>
<body>
<h2>${title}</h2>
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
</tr>
<c:forEach var="i" items="${list}">
<tr>
	<td>${i.p_no}</td>
	<td>${i.p_subject}</td>
	<td style="width: 60%">${i.p_title}</td>
	<td style="width: 10%"><button onclick="button_click(${i.p_no})" class="btn btn-secondary">청원바로가기</button></td>
	<td><fmt:formatDate value="${i.p_date}" pattern="yyyy-MM-dd"/></td>
	<td>${i.p_person}명</td>
	<td>
		<c:if test="${i.p_check==1}">답변완료</c:if>
		<c:if test="${i.p_check==0}">답변미완료</c:if>
	</td>
	
</tr>
</c:forEach>
</table>
<c:if test="${startPage!=1}">
	<a href="main2.ju?page=${startPage-10}">이전</a>
</c:if>
<c:forEach begin="${startPage}" end="${lastPage}" var="i">
	<a href="main2.ju?page=${i}">${i}</a>
</c:forEach>
<c:if test="${lastPage!=pageAll}">
	<a href="main2.ju?page=${lastPage+1}">다음</a>
</c:if>
</body>
</html>