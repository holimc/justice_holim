<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../member/header.jsp"/>
<jsp:include page="header.jsp"/>
</head>
<body>
변동량 : ${info.p_person-info.p_data2}<br/>
초기 데이터 : ${info.p_data}<br/>
전날 데이터 : ${info.p_data2}<br/>
현재 데이터 : ${info.p_person}<br/>
</body>
</html>