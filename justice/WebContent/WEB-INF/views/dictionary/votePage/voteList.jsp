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
		$("#selectAll").click(function(){
			if($("#selectAll").prop("checked")){
				$("input[type=checkbox]").prop("checked",true);
			}else{
				$("input[type=checkbox]").prop("checked",false);
			}
		})
	})
	$(function(){
		$("#chkPost").click(function(){
			$("#selectAll").prop("checked", false);
		})
	})
	// 선택 삭제, 선택 마감
	
	$(function(){
		$(document).on('click','#selVoteDelete', function(){
			var confirm_check = confirm("선택한 글을 지우시겠습니까?");
			
			if(confirm_check){
				var chkArr = new Array();
				$("input[id='chkPost']:checked").each(function(){
					chkArr.push($(this).attr("data-vote_no"));
				})
				$.ajax({
					url : "voteDelete.ju",
					type : "post" ,
					data : { chbox : chkArr } ,
					success : function(){
						location.href="voteList.ju";
					}
				})
			}
			
		})
	})
	
	$(function(){
		$(document).on('click','#selVoteClosing', function(){
			var confirm_check = confirm("선택한 투표를 마감 하시겠습니까?");
			if(confirm_check){
				var chkArr = new Array();
				$("input[id='chkPost']:checked").each(function(){
					chkArr.push($(this).attr("data-vote_no"));
				})
				$.ajax({
					url : "voteClose.ju",
					type : "post",
					data : {chbox : chkArr},
					success : function(){
						location.href="voteList.ju";
					}
				})
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
<div id="container">

<c:if test="${count==0 }">
	<h1>현재 진행중인 투표가 없습니다.</h1>
</c:if>
<c:if test="${count>0}">
	<center>글 개수 : ${count}</center>
	<center>
	<table id="vote_table" class="table" style="width:1300px">
		<tr onclick="event.cancelBubble=true">
			<c:if test="${admin!=null }">
			<td> <input type="checkbox" id="selectAll" /> </td>
			</c:if>
			<td>번호</td>
			<td>단어명</td>
			<td>찬성</td>
			<td>반대</td>
			<td>게시일</td>
		</tr>
		<c:forEach items="${voteList}" var="vote" varStatus="status">
			<tr>
				<c:if test="${admin!=null}">
					<td><input type="checkbox" id="chkPost" value="${vote.vote_no}" data-vote_no="${vote.vote_no}" onclick="event.cancelBubble=true"/></td>
				</c:if>
				<td onclick="event.cancelBubble=true">${number-status.index }</td>
				<td id="open_content">
				<c:if test="${vote.vote_close=='close'}">[종료]</c:if>
				<a href="voteContent.ju?vote_no=${vote.vote_no}">${vote.wname }</a></td>
				<td>${vote.agree }</td>
				<td>${vote.disagree }</td>
				<td onclick="event.cancelBubble=true">${vote.vote_reg }</td>
			</tr>
		</c:forEach>
	</table>
	</center>
</c:if>
<!-- 페이징 -->
<c:if test="${count>0}">
<center>
	<c:if test="${startPage>10}">
        <a href="voteList.ju?pageNum=${startPage-10}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
        <a href="voteList.ju?pageNum=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${endPage < pageCount }">
        <a href="voteList.ju?pageNum=${startPage+10}">[다음]</a>
    </c:if>
</center>
</c:if>
<br>
<center>
<tr>
	<td><a href="voteList.ju" class="text_button">목록</a></td>
	<c:if test="${admin!=null}">
		<td><a href="#" onclick="return false;" id="selVoteClosing" class="text_button">선택 투표 마감</a></td>
		<td><a href="#" onclick="return false;" id="selVoteDelete" class="text_button">선택 투표 삭제</a> </td>
		<td><input type="button" value="선택해제" class="myButton"/></td>
	</c:if>
</tr>
</center>
</div>

</body>
</html>