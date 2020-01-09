<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
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
<div>
주제 : ${content.p_subject}
청원종료일 : <fmt:formatDate value="${content.p_date}" pattern="yyyy-MM-dd"/>


</div>
${content.p_content}
</div>
<div id="tooltip"></div>
</body>
</html>