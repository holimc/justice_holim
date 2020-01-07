<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/dictionary/css/dictionaryStyle.css"/>" rel="stylesheet" />
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
<jsp:include page="../../member/header.jsp" />

<div class="container-fluid">
<div class="row">
<jsp:include page="../dictionary_view/dic_side.jsp"/>
<div id="container">
	<table class="table">
		<tr>
			<td>단어명 : ${brdDTO.wname} </td>
		</tr>
		<tr>
			<td>순화어 : ${brdDTO.prompt }</td>
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
			<td><input type="button" value="추천" id="agree" class="myButton"/> ${vtDTO.agree }
				<input type="button" value="비추천" id="disagree" class="myButton"/> ${vtDTO.disagree }</td>
			</c:if>
			<c:if test="${vtDTO.vote_close=='close'}">
				<td> <input type="button" value="추천수" class="myButton"/> : ${vtDTO.agree} / <input type="button" value="비추천" class="myButton"/> : ${vtDTO.disagree } </td>
			</c:if>
		</tr>
	</table>
</div>
</body>
</html>