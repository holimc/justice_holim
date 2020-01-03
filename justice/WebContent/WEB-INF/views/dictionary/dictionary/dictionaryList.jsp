<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<style>
	ul.menu{
		margin:0;
		padding:0;
		list-style:none;
	}
	ul.menu li{
		display: block;
		padding: 5px 40px;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".menu>a").click(function(){
			var submenu = $(this).next("ul");
			if(submenu.is(":visible")){
				submenu.slideUp();
			}else{
				submenu.slideDown();
			}
		})
	})
	
	$(function(){
		$(document).on('click','#searchBtn',function(){
			var url = "list.ju";
			var category = $("#category").val();
			url = url + "?category=" + category;
			var keyword = $("#keyword").val();
			url = url + "&keyword=" + keyword
			location.href=url;
		})
	})
</script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .menu a{cursor:pointer;}
    .menu .hide{display:none;}
    li { list-style: none }
    ul { list-style: none }
</style>
</head>
<jsp:include page="../../member/header.jsp" />
<body>
	<center>단어 리스트 : ${count}</center>
<c:if test="${count == 0 }">
<center>
	<table>
		<tr>
			<td>사전에 저장된 단어가 없습니다.</td>
		</tr>
	</table>
</center>
</c:if>
<c:if test="${count>0}">
<center>
	<table>
		<tr>
			<c:if test="${admin!=null}">
			<td>▼</td>
			</c:if>
			<td>번호</td>
			<td>단어</td>
			<td>대체어</td>
			<td>단어뜻</td>
			<td>추천수</td>
			<td></td>
		</tr>
		
		<c:forEach items="${dictionaryList}" var="dictionary">
			<tr>
				<!-- 드롭다운 구현예정 -->
				<c:if test="${admin!=null }">
				<td>
				<ul>
					<li class="menu"><a>▼</a>
					<ul class="hide">
						<li><a href="updateDictionary.ju?word_no=${dictionary.word_no}&pageNum=${pageNum}">단어 수정</a></li>
						<li><a href="deleteDictionary.ju?word_no=${dictionary.word_no}&pageNum=${pageNum}">단어 삭제</a></li>
					</ul>
					</li>
				</ul>
				</td>
				</c:if>
				<td><span id="sp_word_no">${dictionary.word_no}</span></td>
				<td>${dictionary.wname}</td>
				<td>${dictionary.substitute}</td>
				<td>${dictionary.meaning}</td>
				<td>${dictionary.dic_recommend}</td>
				<!-- 매개변수 id 추가 -->
				<td><input type="button" onclick="window.location.href='recommendDictionary.ju?word_no=${dictionary.word_no}&pageNum=${pageNum}'" value="추천"/> &nbsp;
					<input type="button" onclick="window.location.href='reportDictionary.ju?word_no=${dictionary.word_no}&pageNum=${pageNum}'" value="신고"/>
					<input type="button" value="제안하기" onclick="window.location.href='../dboard/boardWrite.ju?word_no=${dictionary.word_no}'"/>
				</td>
			</tr>
		</c:forEach>
	</table>
</center>
</c:if>
<c:if test="${count>0}">
<center>
	<c:if test="${startPage>10}">
        <a href="list.ju?pageNum=${startPage-10}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
        <a href="list.ju?pageNum=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${endPage < pageCount }">
        <a href="list.ju?pageNum=${startPage+10}">[다음]</a>
    </c:if>
</center>
</c:if>
<center>
	<table name="search">
		<tr>
			<td>
				<select name="category" id="category">
					<option value="wname">단어명</option>
					<option value="substitute">대체어</option>
					<option value="meaning">뜻</option>
					<option value="all">전체</option>
				</select>
				<input type="text" name="keyword" id="keyword" />
				<input type="button" value="검색" id="searchBtn">
			</td>
		</tr>
	</table>
<c:if test="${admin!=null}">
<table>
	<tr>
		<td><a href="insertDictionary.ju">단어 추가</a> &nbsp; <a href="showReport.ju">신고 리스트 확인</a></td>
	</tr>
</table>
</c:if>
</center>
	
	

</body>
</html>