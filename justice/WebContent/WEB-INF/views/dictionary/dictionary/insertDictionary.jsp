<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<c:url value="/resources/dictionary/css/dictionaryStyle.css"/>" rel="stylesheet" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function chkForm(){
		if($("#wname").val()==""){
			alert("단어 명을 써주세요");
			$("#wname").focus();
			return false;
		}
		if($("#substitute").val()==""){
			alert("대체어를 써주세요");
			$("#substitute").focus();
			return false;
		}
		if($("#meaning").val()==""){
			alert("뜻을 써주세요");
			$("#meaning").focus();
			return false;
		}
	}
</script>
</head>
<jsp:include page="../../member/header.jsp" />

<div class="container-fluid">
<div class="row">
<jsp:include page="../dictionary_view/dic_side.jsp"/>
<body>
<c:if test="${check==1}">
	<div id="container">
	<table class="table" style="width:600px">
		<form action="insertDictionaryPro.ju" onsubmit="return chkForm()">
				<tr><td>단어명 : <input type="text" name="wname" id="wname" style="width:500px"></td></tr>
				<tr><td>순화어 : <input type="text" name="substitute" id="substitute" style="width:500px"></td></tr>
				<tr><td>단어뜻 : <input type="text" name="meaning" id="meaning" style="width:500px"></td></tr>
				<input type="hidden" name="user_id" value="${admin}">
				<tr><td><input type="submit" class="myButton" value="단어 등록" /></td></tr>
		</form>
	</table>
	</div>
</c:if>
<c:if test="${check==0}">
	<script>
		alert("권한이 없습니다.");
		window.location.href="list.ju";
	</script>
</c:if>
</div>
</div>

</body>
</html>