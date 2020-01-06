<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$(document).on('click', '.update', function(){
			var checkBtn = $(this);
			var tr = checkBtn.parent().parent();
			var td = tr.children();
			var id = td.eq(0).text();
			$.ajax({
				type:"post",
				url : "/justice/adminUpdate.ju?id="+id,
				success : function(data){
					$("#"+id).html(data);	
				}
			})
		});
	});
	
	function refreshList(){
		location.reload();
	}
	
	function updateBtn(form_id){
		
		var input_id = document.getElementById(form_id+"_id").value;
		var input_passwd = document.getElementById(form_id+"_passwd").value;
		var input_name = document.getElementById(form_id+"_name").value;
		var input_email = document.getElementById(form_id+"_email").value;
		
		var url ="adminUpdatePro.ju?id="+input_id+
				"&passwd="+input_passwd+
				"&name="+input_name+
				"&email="+input_email;
		window.location.href=url;
				
		/* var allData = {"id":input_id, "passwd":input_passwd, "name":input_name, "email":input_email };
		$.ajax({
			cache : false,
			url : "/justice/adminUpdatePro.ju",
			type : "post",
			data : allData,
			success : function(data){
				var jsonObj = JSON.parse(data);
				
			}
		}); 
		refreshList(); */
	}
	function deleteMember(id){
		var check = confirm(id+"를 탈퇴시키겠습니까?");
		if(check){
			window.location.href="adminDeletePro.ju?id="+id;
		}else if(!check){
			return false;
		}
	}
	
</script>

</head>
<body>
<c:if test="${check==0}">
	<script>
		alert("에러가 발생했습니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${check==-1}">
	<script>
		alert("권한이 없습니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${check==1 }">
<center>
	<table class="table">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>관리자 권한</td>
			<td>email</td>
			<td></td>
		</tr>
		<c:forEach items="${memberList}" var="memData">
			<tr>
				<td>${memData.id}</td>
				<td>${memData.passwd }</td>
				<td>${memData.name }</td>
				<td>
					<c:if test="${memData.admin==0}">일반 유저</c:if>
					<c:if test="${memData.admin==1}">관리자</c:if>
				</td>
				<td>${memData.email }</td>
				<td>
				<input type="button" value="수정하기" id="update" class="update"/>
				<input type="button" value="삭제" id="delete" class="delete" onclick="deleteMember('${memData.id}')"/>
				</td>
			</tr>
				<tbody id="${memData.id}"></tbody>
		</c:forEach>
		
	</table>
	<c:if test="${count>0}">
		<c:if test="${startPage>10}">
	        <a href="adminpage.ju?pageNum=${startPage-10}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
	        <a href="adminpage.ju?pageNum=${i}">[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCount }">
	        <a href="adminpage.ju?pageNum=${startPage+10}">[다음]</a>
	    </c:if>
	</c:if>
		<table name="search">
			<tr>
				<td>
					<select name="category" id="category">
						<option value="id">아이디</option>
						<option value="name">이름</option>
						<option value="passwd">비밀번호</option>
						<option value="email">이메일</option>
					</select>
					<input type="text" name="keyword" id="keyword" />
					<input type="button" class="myButton" value="검색" id="searchBtn">
				</td>
			</tr>
		</table>
</center>

</c:if>



</body>
</html>