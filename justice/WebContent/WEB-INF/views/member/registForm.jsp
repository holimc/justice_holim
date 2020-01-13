<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="header.jsp" />
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	var idCheck =0;
	var pwCheck =0;
	$(function() {
			var ajaxTimeout;
		$("#pw2").keyup(function(){
			var pw = $("#pw").val();
			var pw2 = $("#pw2").val();
			if(pw==pw2){
				$("#checkPw").html("비밀번호가 동일합니다.");
				pwCheck=1;
			}
			else{
				$("#checkPw").html("비밀번호가 다릅니다.")
				pwCheck =0;
				}
			});
		$("#id").keyup(function(){
			clearTimeout(ajaxTimeout);
			ajaxTimeout = setTimeout(function(){
				if($("#id").val().length > 3){
					$.ajax({
						type : "post",
						url : "check.ju",
						data : { id : $("#id").val() },
						success : function(data){  
							var r = parseInt(data);
							if(r == 1){
								idCheck=0;								
								$("#checkId").html("사용중인 아이디 입니다.");
							}else{
								idCheck=1;													
								$("#checkId").html("사용가능한 아이디 입니다.");																	
							}
						},
						error : function(e){     }
					});
				}
			},1000);
			
		});			
	})
	function checkIt(){
		var userinput = eval("document.userinput");
		if(idCheck==0){
			alert("동일한 아이디가 존재합니다.");
			return false;
        }
        if(pwCheck==0){
            alert("비밀번호가 다릅니다.");
            return false;
        }
        if(!userinput.id.value) {
            alert("ID를 입력하세요");            
            return false;
        }if(!userinput.passwd.value) {
            alert("비밀번호를 입력하세요");
            return false;
        }if(!userinput.name.value) {
            alert("이름을 입력하세요");
            return false;
        }if(!userinput.email.value) {
            alert("이메일을 입력하세요");
            return false;
        }      
	}
</script>
<body>
	<div class="container">
		<h3>회원가입</h3>
		<form action="registPro.ju" method="post" name="userinput" onSubmit="return checkIt();">
			<table class="table">
				<tr>
					<td>아이디</td>
					<td>
						<div class="row">
							<div class="col-xs-4">
								<input type="text" name="id" id="id" class="form-control">
								<label id=checkId></label>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<div class="row">
							<div class="col-xs-4">
								<input type="password" name="passwd" id="pw" class="form-control">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>비밀번호확인</td>
					<td>
						<div class="row">
							<div class="col-xs-4">
								<input type="password" name="passwd2" id="pw2" class="form-control">
								<label id=checkPw></label>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<div class="row">
							<div class="col-xs-4">
								<input type="text" name="name" class="form-control">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<div class="row">
							<div class="col-xs-4">
								<input type="text" name="email" class="form-control">
							</div>
						</div>
					</td>
				</tr>
			</table>
			<input type="submit" value="전송">						
		</form>
	</div>
</body>
</html>