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
	
	
	
	// 검색버튼
	$(function(){
		$(document).on('click', '#searchBtn', function(){
			var url = "boardList.ju";
			var category = $("#category").val();
			url = url + "?category=" + category;
			var keyword = $("#keyword").val();
			url = url + "&keyword=" + keyword
			location.href=url;
		});
	});
	
	$(document).ready(function(){
		$(".detail_content").hide();
		$(document).on('click', '#open_content', function(){
			var tr = $(this).parent();
			var d_board_no = tr.find("#d_board_no").val();
			if($("#"+d_board_no).is(":visible")){
				$("#"+d_board_no).slideUp();
			}else{
				$("#"+d_board_no).slideDown();
			}
			
		})
	})

	//수정하기
	$(function(){
		$(document).on('click', '#updateBtn', function(){
			var btn = $(this);
			var tr = btn.parent().parent();
			var num = tr.find("#d_board_no").val();
			url = "boardUpdate.ju?d_board_no=" + num;
			location.href=url;
		})
	})
	// 삭제버튼
	$(function(){
		$(document).on('click', '#deleteBtn', function(){
			var btn = $(this);
			var tr = btn.parent().parent();
			var num = tr.find("#d_board_no").val();
			url = "boardDelete.ju?d_board_no=" + num;
			location.href=url;
		})
	})
	// 추천
	$(function(){
		$(document).on('click', '#recommendBtn', function(){
			var btn = $(this);
			var tr = btn.parent().parent();
			var num = tr.find("#d_board_no").val();
			url = "boardRecommend.ju?d_board_no=" + num;
			location.href=url;
		})
	})
	
	// 체크박스
	
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
		$(".chkPost").click(function(){
			$("#selectAll").prop("checked", false);
		})
	})
	
	$(function(){
		$(document).on('click','#selDelete', function(){
			var confirm_check = confirm("선택한 글을 지우시겠습니까?");
			
			if(confirm_check){
				var chkArr = new Array();
				$("input[id='chkPost']:checked").each(function(){
					chkArr.push($(this).attr("data-d_board_no"));
				})
				$.ajax({
					url : "deleteByAdmin.ju",
					type : "post" ,
					data : { chbox : chkArr } ,
					success : function(){
						location.href="boardList.ju";
					}
				})
			}
			
		})
	})
	
	$(function(){
		$(document).on('click','#selVote', function(){
			var confirm_check = confirm("선택한 글을 투표게시 하시겠습니까?");
			if(confirm_check){
				var chkArr = new Array();
				$("input[id='chkPost']:checked").each(function(){
					chkArr.push($(this).attr("data-d_board_no"));
				})
				$.ajax({
					url : "insertVoting.ju",
					type : "post",
					data : {chbox : chkArr},
					success : function(){
						location.href="boardList.ju";
					}
				})
			}
			
		})
	})
	$(function(){
		$(document).on('click','#releaseChk', function(){
			$("#selectAll").prop("checked", false);
			$(".chkPost").prop("checked", false);
		})
	})
</script>


</head>
<body>
<jsp:include page="../../member/header.jsp" />

<div class="container-fluid">
<div class="row">
<jsp:include page="../dictionary_view/dic_side.jsp"/>

<c:if test="${count==0 }">
	<h1>해당 게시판에 글이 존재하지 않습니다.</h1>
</c:if>
<c:if test="${count>0}">
<div id="container">
	<center>
	<table class="table">
		<tr onclick="event.cancelBubble=true">
			<c:if test="${admin!=null }">
			<td> <input type="checkbox" id="selectAll" /> </td>
			</c:if>
			<td>번호</td>
			<td>단어명</td>
			<td>제시어</td>
			<td>단어뜻</td>
			<td>추천수</td>
			<td>게시일</td>
		</tr>
		<c:forEach items="${boardList}" var="board_article" varStatus="status">
			<tr>
				<input type="hidden" value="${board_article.d_board_no}" id="d_board_no" onclick="event.cancelBubble=true"/>
				<c:if test="${admin!=null}">
					<td><input type="checkbox" id="chkPost" class="chkPost" value="${board_article.d_board_no}" data-d_board_no="${board_article.d_board_no}" onclick="event.cancelBubble=true"/></td>
				</c:if>
				<td onclick="event.cancelBubble=true">${number-status.index }</td>
				<td id="open_content">${board_article.wname }</td>
				<td id="open_content">${board_article.prompt }</td>
				<td id="open_content">${board_article.meaning }</td>
				<td onclick="event.cancelBubble=true">${board_article.b_recommend }</td>
				<td onclick="event.cancelBubble=true">${board_article.board_reg }</td>
				<c:if test="${memId != null }">
				<td>
					<input type="button" value="추천" id="recommendBtn"/>
					<c:if test="${board_article.user_id == memId || admin!=null }">
					<input type="button" value="수정" id="updateBtn"/>
					<input type="button" value="삭제" id="deleteBtn"/>
					</c:if>
				</td>
				</c:if>
			</tr>
			<tr class="detail_content" id="${board_article.d_board_no}">
				<td text-align:center>${board_article.detail_content}</td>
			</tr>
		</c:forEach>
	</table>
	</center>
</c:if>
<!-- 페이징 -->
<c:if test="${count>0}">
<center>
	<c:if test="${startPage>10}">
        <a href="boardList.ju?pageNum=${startPage-10}&category=${category}&keyword=${keyword}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
        <a href="boardList.ju?pageNum=${i}&category=${category}&keyword=${keyword}">[${i}]</a>
	</c:forEach>
	<c:if test="${endPage < pageCount }">
        <a href="boardList.ju?pageNum=${startPage+10}&category=${category}&keyword=${keyword}">[다음]</a>
    </c:if>
</center>
</c:if>
<br>
<center>
<tr>
	<td><a href="boardWrite.ju">글쓰기</a></td>
	<td><a href="boardList.ju">목록</a></td>
	<c:if test="${admin!=null}">
		<td><a href="#" onclick="return false;" id="selDelete">선택 삭제</a></td>
		<td><a href="#" onclick="return false;" id="selVote">선택 투표게시</a> </td>
		<td><a href="#" onclick="return false;" id="releaseChk">선택 해제</a></td>
	</c:if>
</tr>
<div>
	<select name="category" id="category">
		<option value="wname">단어명</option>
		<option value="meaning">단어뜻</option>
		<option value="prompt">제시어</option>
		<option value="all">전체</option>
	</select>
	<input type="text" name="keyword" id="keyword" />
	<input type="button" value="검색" id="searchBtn">
</div>
</center>
</div>
</div>
</div>

</body>
</html>