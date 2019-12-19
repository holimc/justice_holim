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
		$(document).on('click','#delBtn',function(){
			var passwd = $("#passwd").val();
			var d_board_no = $("#d_board_no").val();
			var url = "boardDeletePro.ju?d_board_no="+d_board_no+"&passwd=" + passwd;
			location.href=url;
		})
	})

</script>
</head>
<body>
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
	<center>
	<div>게시글을 삭제하시려면 비밀번호를 입력해주세요 </div>
	<input type="hidden" name="d_board_no" id="d_board_no" value="${d_board_no}"/>
	<input type="password" name="passwd" id="passwd"/> <input type="button" value="삭제" id="delBtn"/>
	</center>
</c:if>

</body>
</html>