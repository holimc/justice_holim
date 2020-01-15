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
<script src='../resources/js/list.js'></script>

<script type="text/javascript">
function url3(s){
	var now = window.location.href;
	var url = "ansContent.ju?num="+s+"&redirect="+now;
	window.location.href=url;
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
	<td style="width: 50%"><a href="#" onclick="url3(${i.p_no})">${i.p_title}</a></td>
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
<nav aria-label="Page navigation example">
<ul class="pagination">
	<li class="page-item">
		<c:if test="${startPage!=1}">
      		<a class="page-link" href="answer.ju?num=${startPage-10}" aria-label="Previous">
        	<span aria-hidden="true">&laquo;</span>        
      		</a>
      	</c:if>
    </li>

<c:forEach begin="${startPage}" end="${lastPage}" var="i">
<c:if test="${page!= i}">
<li class="page-item">
		<a href="answer.ju?num=${i}" class="page-link">${i}</a>
	</li>
</c:if>
<c:if test="${page==i}">
	<li class="page-item active" aria-current="page">
      <span class="page-link">${i}        
        <span class="sr-only">(current)</span>
      </span>
    </li>
</c:if>
</c:forEach>
<c:if test="${lastPage!=pageAll}">
	<li class="page-item">
		<a class="page-link" href="answer.ju?num=${lastPage+1}" aria-label="Next">
        	<span aria-hidden="true">&raquo;</span>
      	</a>
	</li>
</c:if>
</ul>
</nav>
</body>
</html>