<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주제별 조회</title>
</head>
<body>
<script src='../resources/js/list.js'></script>
<script type="text/javascript">
function orderChange(){
	var order = document.getElementById("order");
	var orderValue = order.options[order.selectedIndex].value;	
	var subject = getParam("cg");
	if(subject==""){
		subject=0;
		}
	window.location.href="subject.ju?&cg="+subject+"&order="+orderValue
}
</script>
<script>
	function newPopup(url){
		var pop_url = url
		var pop_option = "top=10,left=10,width=500,height=600, status=no, menubar=no, toolbar=no, resizable=no"
		window.open(pop_url,pop_option);
	}
</script>
<jsp:include page="../member/header.jsp"></jsp:include>
<jsp:include page="header.jsp"/>
<div class="container">
<h2>주제별 조회</h2>


<c:forEach var="i" items="${list}">
	<c:if test="${i.s_id%5==0}"></c:if>
	<button class="btn btn-light" onclick="window.location.href='subject.ju?cg=${i.s_id}'" style="width: 200px; text-align: left">${i.p_subject}</button>
	<c:if test="${i.s_id%5==4}"><br/></c:if>
</c:forEach><br/>
</div>

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
	<td style="width: 10%">${i.p_subject}</td>
	<td style="width: 40%"><a href="#" onclick="url2(${i.p_no})">${i.p_title}</a></td>
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
<c:if test="${page!= i}">
<li class="page-item">
		<a href="subject.ju?pg=${i}&cg=${cg}&order=${order}" class="page-link">${i}</a>
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
		<a class="page-link" href="subject.ju?pg=${lastPage+1}&cg=${cg}&order=${order}" aria-label="Next">
        	<span aria-hidden="true">&raquo;</span>
      	</a>
	</li>
</c:if>
</ul>
</nav>
</body>
</html>