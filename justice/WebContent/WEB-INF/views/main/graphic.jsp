<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<script src="/justice/views/htmlwidgets.js"></script>
<script src='/justice/views/lib/jquery.min.js'></script>
<link href='/justice/views/lib/crosstalk.css'rel="stylesheet">
<script src="/justice/views/plotly.js"></script>
<script src="/justice/views/lib/crosstalk.min.js"></script>
<script src='/justice/views/lib/plotly-latest.min.js'></script>
<script src='/justice/views/lib/typedarray.min.js'></script>
<link href='/justice/views/lib/plotly-htmlwidgets.css'rel="stylesheet">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../member/header.jsp"/>
<div class="container-fluid">
<div class="row">
<jsp:include page="side.jsp"></jsp:include>
<div>
<h2>국민청원 한눈에보기</h2>
<h4>한달간 등록된 청원 주제</h4>
<div style="width: 800px">
${pie}
</div>
</div>
</div>
</div>
</body>
</html>