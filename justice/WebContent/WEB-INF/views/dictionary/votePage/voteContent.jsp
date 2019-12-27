<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
			<td><input type="button" value="좋아요"/> ${vtDTO.agree }
				<input type="button" value="싫어요"/> ${vtDTO.disagree }
			</td>
		</tr>
	</table>
</body>
</html>