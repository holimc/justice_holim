<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<script src='./resources/js/list.js'></script>
</head>
<body>
<jsp:include page="../member/header.jsp"/>
<div class="container-fluid">
<div class="row">
<jsp:include page="side.jsp"/>
<div id="container" style="width: 70%">
<h2>실시간 청원수 증가  TOP 10</h2>
<table class="table">
<thead class="thead-light">
	<tr>
	<th>인덱스</th>
	<th>주제</th>
	<th>제목</th>
	<th>청원바로가기</th>
	<th>청원 만료일</th>
	<th>참여인원</th>
	<th>증가수</th>
	</tr>
</thead>
<c:forEach var="i" items="${list}">
<tr>
	<td>${i.p_no}</td>
	<td style="width: 10%">${i.p_subject}</td>
	<td style="width: 40%"><a href="#" onclick="url(${i.p_no})">${i.p_title}</a></td>
	<td style="width: 10%"><button onclick="button_click(${i.p_no})" class="btn btn-secondary">청원</button></td>
	<td><fmt:formatDate value="${i.p_date}" pattern="yyyy-MM-dd"/></td>
	<td>${i.p_person}명</td>
	<td>${i.p_person-i.p_data}</td>		
</tr>
</c:forEach>
</table>
</div>
</div>
</div>
</body>
</html>