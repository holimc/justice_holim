<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<script type="text/javascript">
function button_click(s) {
	var url = "https://www1.president.go.kr/petitions/"+s;
	window.open(url);
}
</script>
<meta charset="UTF-8">
<title>content</title>
<jsp:include page="../member/header.jsp"/>
<jsp:include page="header.jsp"/>
<link href="<c:url value="/resources/dictionary/css/dictionaryStyle.css"/>" rel="stylesheet" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src='<c:url value="/resources/dictionary/js/dictionaryJavaScript.js"/>'></script>
</head>
<body>
<div class = "container">
<h3>${content.p_title}</h3>
<div class="alert alert-info" role="alert">
주제 : ${content.p_subject} &nbsp;&nbsp;
청원종료일 : <fmt:formatDate value="${content.p_date}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;
참여인원 : ${content.p_person}
</div>
<div class="card">
  <div class="card-body">
${content.p_content}<br/>
  </div>
</div>

<button>이전으로</button>
<button onclick="button_click(${content.p_no})">청원바로가기</button>
<c:if test="${content.p_date> now}">
<button onclick="location.href='info.ju?num=${content.p_no}'">그래프보기</button>
</c:if>


</div>

<div id="tooltip"></div>
</body>
</html>