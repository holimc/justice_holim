<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="/justice/views/htmlwidgets.js"></script>
<script src='/justice/views/lib/jquery.min.js'></script>
<link href='/justice/views/lib/crosstalk.css'rel="stylesheet">
<script src="/justice/views/plotly.js"></script>
<script src="/justice/views/lib/crosstalk.min.js"></script>
<script src='/justice/views/lib/plotly-latest.min.js'></script>
<script src='/justice/views/lib/typedarray.min.js'></script>
<link href='/justice/views/lib/plotly-htmlwidgets.css'rel="stylesheet">
<script src='../resources/js/list.js'></script>

<head>
<meta charset="UTF-8">
<title>Info</title>
</head>
<body>
<jsp:include page="../member/header.jsp"/>
<jsp:include page="header.jsp"/>
<div class="container" >
${lines}
<button onclick="location.href='content.ju?num=${index}'">이전으로</button>
<button onclick="button_click(${index})">청원바로가기</button>
</div>
</body>
</html>