<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(document).on('click','#registBtn', function(){
			var wname = $("#wname").val();
			var meaning = $("#meaning").val();
			var prompt = $("#prompt").val();
			var detail_content = $("#detail_content").val();
			
			if(wname==null || wname==""){
				alert("단어 명을 입력하지 않았습니다.");
				$("#wname").focus();
				return false;
			}
			if(meaning == null || meaning ==""){
				alert("단어 의미를 입력하지 않았습니다.");
				$("#meaning").focus();
				return false;
			}
			if(prompt == null|| prompt == ""){
				alert("제시어를 입력하지 않았습니다.");
				$("#prompt").focus();
				return false;
			}
			if(detail_content == null|| detail_content == ""){
				alert("설명을 입력하지 않았습니다.");
				$("#detail_content").focus();
				return false;
			}
		})	
	})
</script>

</head>
<body>
<c:if test="${user_id== null}">
	<script>
		alert("로그인후 이용해주세요");
		location.href="boardList.ju";
	</script>
</c:if>
<c:if test="${user_id!=null}">
<center>
<form action="boardWritePro.ju" method="post">
<table>
	<input type="hidden" value="${user_id}" name="user_id" id="user_id"/>
	<tr>
		<td>단어 명 : </td>
		<c:if test="${word_no==null }"> <td> <input type="text" name="wname" id="wname"/> </td> </c:if>
		<c:if test="${word_no!=null }"> 
		<td> <input type="text" name="wname" id="wname" value="${wname}" readonly/> <input type="hidden" value="${word_no}" name="word_no"/></td>
		</c:if>
	</tr>
	<tr>
		<td>단어 뜻 : </td>
		<td><input type="text" name="meaning" id="meaning" placeholder="원 단어의 사전적 뜻을 입력해주세요." size="10"/></td>
	</tr>
	<tr>
		<td>제시 어 : </td>
		<td><input type="text" name="prompt" id="prompt" placeholder="해당 단어의 대체어를 입력해주세요." size="10"/></td>
	</tr>
	<tr>
		<td>내용 : </td>
		<td><textarea rows="4" cols="30" name="detail_content" id="detail_content"></textarea> </td>
	</tr>
	<tr>
		<td><input type="submit" value="등록" id="registBtn"/></td>
	</tr>
</table>
</form>
</center>
</c:if>

</body>
</html>