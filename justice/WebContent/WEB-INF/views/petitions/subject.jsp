<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function button_click(s) {
	var url = "https://www1.president.go.kr/petitions/"+s;
	window.open(url);
}
function orderChange(){
	var order = document.getElementById("order");
	var orderValue = order.options[order.selectedIndex].value;
	var page = getParameterByName("pg");
	var subject = getParameterByName("cg");
	window.location.href="subject.ju?pg="+page+"&cg="+subject+"&order="+orderValue
}
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "1" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
</script>
<jsp:include page="../member/header.jsp"></jsp:include>
<jsp:include page="header.jsp"/>
<h2>주제별 조회</h2>

<table>
<c:forEach var="i" items="${list}">
	<c:if test="${i.s_id%5==0}"><tr></c:if>
	<td><a href="subject.ju?cg=${i.s_id}">${i.p_subject}</a></td>
	<c:if test="${i.s_id%5==4}"></tr></c:if>
</c:forEach>
</table>
<h4 style="display:inline">${subject}</h4>
<select id="order" onchange="orderChange()" style="float: right">
	<option value="1" <c:if test="${order==1}"> selected</c:if>> 오래된순 정렬</option>
	<option value="2" <c:if test="${order==2}"> selected</c:if>>추천수 정렬</option>
	<option value="3" <c:if test="${order==3}"> selected</c:if>>최신순 정렬</option>
	
</select>
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
<c:forEach var="i" items="${list2}">
<tr>
	<td>${i.p_no}</td>
	<td>${i.p_subject}</td>
	<td style="width: 60%"><a href="info.ju?num=${i.p_no}">${i.p_title}</a></td>
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
<nav aria-label="Page navigation example">
<ul class="pagination">
	<li class="page-item">
		<c:if test="${startPage!=1}">
      		<a class="page-link" href="subject.ju?pg=${startPage-10}&cg=${cg}&order=${order}" aria-label="Previous">
        	<span aria-hidden="true">&laquo;</span>        
      		</a>
      	</c:if>
    </li>

<c:forEach begin="${startPage}" end="${lastPage}" var="i">
	<li class="page-item">
		<a href="subject.ju?pg=${i}&cg=${cg}&order=${order}" class="page-link">${i}</a>
	</li>
</c:forEach>
<c:if test="${lastPage!=pageAll}">
	<li class="page-item">
		<a class="page-link" href="subject.ju?pg=${lastPage+1}&cg=${cg}&order=${order}" aria-label="Next">
        	<span aria-hidden="true">&raquo;</span>
      	</a>
	</li>
</c:if>
</ul>
</nav>
</body>
</html>