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
		$(document).on('click','#agree',function(){
			var confirm_check = confirm("해당 단어를 추천하시겠습니까?");
			if(confirm_check){
				var url = "votePro.ju";
				url += "?type=agree";
				url += "&vote_no="+$('#vote_no').val();
				location.href=url;
			}
		})
	})
	$(function(){
		$(document).on('click','#disagree',function(){
			var confirm_check = confirm("해당 단어를 비추천하시겠습니까?");
			if(confirm_check){
				var url = "votePro.ju";
				url += "?type=disagree";
				url += "&vote_no="+$('#vote_no').val();
				location.href=url;
			}
		})
	})
</script>
</head>
<input type="hidden" value="${vtDTO.vote_no}" id="vote_no"/>
<body>
	<table>
		<tr>
			<td>단어 명 : ${brdDTO.wname} </td>
		</tr>
		<tr>
			<td>대체 어 : ${brdDTO.prompt }</td>
		</tr>
		<tr>
			<td>뜻 : ${brdDTO.meaning}</td>
		</tr>
		<tr>
			<td>작성자 :  ${brdDTO.user_id }</td>
		</tr>
		<tr>
			<td>세부 설명 : ${brdDTO.detail_content}</td>
		</tr>
		<tr>
			<c:if test="${vtDTO.vote_close=='open'}">
			<td><input type="button" value="추천" id="agree"/> ${vtDTO.agree }
				<input type="button" value="비추천" id="disagree"/> ${vtDTO.disagree }</td>
			</c:if>
			<c:if test="${vtDTO.vote_close=='close'}">
				<td> 추천수 : ${vtDTO.agree} / 비추천수 : ${vtDTO.disagree } </td>
			</c:if>
		</tr>
	</table>
</body>
</html>