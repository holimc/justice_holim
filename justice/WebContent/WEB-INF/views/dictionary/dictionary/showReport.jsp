<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/dictionary/css/dictionaryStyle.css"/>" rel="stylesheet" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".btn").click(function(){
			var checkBtn = $(this);
			var tr = checkBtn.parent().parent();
			var td = tr.children();
			var word_no = td.eq(0).text();
			$.ajax({
				type:"post",
				url : "/justice/dictionary/showReportPro.ju?word_no="+word_no,
				success : function(data){
					$("#reportContent").html(data);	
				}
				
			})
			
		});
	});
</script>

</head>
<body>
<jsp:include page="../../member/header.jsp" />
<div class="container-fluid">
<div class="row">
<jsp:include page="../dictionary_view/dic_side.jsp"/>
<c:if test="${adminChk==0 }">
	<script>
		alert("권한이 없습니다.");
		window.location.href="list.ju";
	</script>
</c:if>
<c:if test="${adminChk==1 }">
	<div id="container">
	<c:if test="${reportList!=null}">
		<table id="reportTable" class="table">
				<tr>
					<td> 번호 </td>
					<td> 단어 뜻 </td>
					<td> 신고 횟수 </td> 
					<td></td>
				</tr>
			<c:forEach items="${reportList}" var="report">
				<tr>
					<td id="word_no" class="word_no">${report.word_no}</td>
					<td>${report.wname }</td>
					<td>${report.rpt_count }</td>
					<td><button id="btn" class="btn">내용확인</button></td>
				</tr>
			</c:forEach>
		</table>
		<div class="reportContent" id="reportContent"></div>
		<br>
		<input type="button" class="myButton" value="돌아가기" onclick="location.href='list.ju'"/>
	</c:if>
	</div>
</c:if>
</body>
</html>