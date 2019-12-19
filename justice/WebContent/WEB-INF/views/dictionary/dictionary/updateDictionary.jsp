<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gg</title>
</head>
<body>
<c:if test="${adminChk==0}">
	<script>
		alert("권한이 없습니다.");
		window.location.href="list.ju";
	</script>
</c:if>
<c:if test="${adminChk==1}">
	<form action="updateDictionaryPro.ju" method="post">
		<table>
		<tr><td>번호 : <input type="text" name="word_no" value="${dicDTO.word_no}" readonly /></td></tr>
		<tr><td>단어 명 : <input type="text" name="wname" value="${dicDTO.wname}"/> <br/></td></tr>
		<tr><td>단어 뜻 : <input type="text" name="meaning" value="${dicDTO.meaning }"/><br/></td></tr>
		<tr><td>대체 어: <input type="text" name="substitute" value="${dicDTO.substitute }"/></td></tr>
		<tr><td><input type="submit" value="수정"/></td></tr>
		</table>
	</form>
</c:if>
	 

</body>
</html>