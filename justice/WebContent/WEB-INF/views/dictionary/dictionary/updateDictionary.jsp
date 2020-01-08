<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<body>
<jsp:include page="../../member/header.jsp" />
<div class="container-fluid">
<div class="row">
<jsp:include page="../dictionary_view/dic_side.jsp"/>
<c:if test="${adminChk==0}">
	<script>
		alert("권한이 없습니다.");
		window.location.href="list.ju";
	</script>
</c:if>
<c:if test="${adminChk==1}">
<div id="container">
	<form action="updateDictionaryPro.ju" method="post" onclick="return chkForm();">
		<table class="table">
		<input type="hidden" name="word_no" id="word_no" value="${dicDTO.word_no}" readonly/>
		<tr><td>단어명 : <input type="text" style="width:500px" name="wname" id="wname" value="${dicDTO.wname}"/> <br/></td></tr>
		<tr><td>순화어: <input type="text" style="width:500px" name="substitute" id="substitute" value="${dicDTO.substitute }"/></td></tr>
		<tr><td>단어 뜻 : <input type="text" style="width:500px" name="meaning" id="meaning" value="${dicDTO.meaning }"/><br/></td></tr>
		<tr><td><input type="submit" class="myButton" value="수정"/></td></tr>
		</table>
	</form>
</div>
</c:if>
</div>
</div>

</body>
</html>