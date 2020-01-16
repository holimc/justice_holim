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
			if(wname.length>20){
				alert("단어의 길이가 너무 깁니다.");
				$("wname").focus();
				return false;
			}
			if(prompt == null|| prompt == ""){
				alert("제시어를 입력하지 않았습니다.");
				$("#prompt").focus();
				return false;
			}
			if(prompt.length>20){
				alert("제시어가 너무 깁니다.");
				$("prompt").focus();
				return false;
			}
			if(meaning == null || meaning ==""){
				alert("단어 의미를 입력하지 않았습니다.");
				$("#meaning").focus();
				return false;
			}
			if(meaning.length>200){
				alert("뜻이 너무 깁니다.");
				$("meaning").focus();
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
<jsp:include page="../../member/header.jsp" />

<div class="container-fluid">
<div class="row">
<jsp:include page="../dictionary_view/dic_side.jsp"/>
<c:if test="${check==0 }">
	<script>
		alert("에러가 발생했습니다.");
		location.href="boardList.ju";
	</script>
</c:if>
<c:if test="${check==-1 }">
	<script>
		alert("잘못된 접근입니다.");
		location.href="boardList.ju";
	</script>
</c:if>
<c:if test="${check==1 }">
<div id="container">
	<center>
	<form action="boardUpdatePro.ju">
		<table class="table" style="width:600px">
			<tr>
				<input type="hidden" name="user_id" value="${brdDTO.user_id}"/>
				<input type="hidden" name="d_board_no" value="${brdDTO.d_board_no}"/>
				<td>단어명 : </td>
				<td>${brdDTO.wname }
					<input type="hidden" name="wname" value="${brdDTO.wname }"/>
				</td>
			</tr>
			<tr>
				<td>단어뜻 : </td>
				<td><input type="text" name="meaning" value="${brdDTO.meaning }" style="width:300px"/></td>
			</tr>
			<tr>
				<td>제시어 : </td>
				<td><input type="text" name="prompt" value="${brdDTO.prompt }" style="width:300px"/></td>
			</tr>
			<tr>
				<td>내용 : </td>
				<td><textarea rows="5" cols="40" name="detail_content">${brdDTO.detail_content }</textarea> </td>
			</tr>
			<tr>
				<td>
				<input type="submit" value="수정하기" class="myButton"/>
				<input type="button" value="돌아가기" class="myButton" onclick="history.go(-1);"/>
				</td>
			</tr>
		</table>
	</center>
	</form>
</div>
</c:if>
</div>
</div>

</body>
</html>