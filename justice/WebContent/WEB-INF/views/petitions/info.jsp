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

<head>
<meta charset="UTF-8">
<title>Info</title>
<jsp:include page="../member/header.jsp"/>
<jsp:include page="header.jsp"/>
</head>
<body>
<div class="container" >

${lines}
</div>
</body>
</html>