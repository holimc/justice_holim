<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<style>

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    overflow: auto;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown a:hover {background-color: #f1f1f1}

.show {display:block;}
</style>
<link href="<c:url value="/resources/dictionary/css/dictionaryStyle.css"/>" rel="stylesheet" />
<script type="text/javascript" src="https://code.jquery	.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
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
	$(function(){
		$(document).on('click','.dropbtn',function(){
			$(this).parent().find('.dropdown-content').toggleClass('show');
		})
	})

	window.onclick = function(event) {
  		if (!event.target.matches('.dropbtn')) {

    		var dropdowns = document.getElementsByClassName("dropdown-content");
    		var i;
    		for (i = 0; i < dropdowns.length; i++) {
	      		var openDropdown = dropdowns[i];
      			if (openDropdown.classList.contains('show')) {
	        		openDropdown.classList.remove('show');
      			}
    		}
  		}
	}
</script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="../../member/header.jsp" />

<div class="container-fluid">
<div class="row">
<jsp:include page="../dictionary_view/dic_side.jsp"/>
<body>
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
<div id="container">
<table class="table">
	<thead class="thead-light">
	<tr>
		<c:if test="${admin!=null}">
		<td>▼</td>
		</c:if>
		<td>번호</td>
		<td>단어</td>
		<td>순화어</td>
		<td>단어뜻</td>
		<td>추천수</td>
		<td></td>
	</tr>
	</thead>
	
	<c:forEach items="${dictionaryList}" var="dictionary">
		<tr>
			<!-- 드롭다운 구현예정 -->
			<c:if test="${admin!=null }">
			<td>
			<div class="dropdown">
				<a onclick="myFunction()" class="dropbtn">▼</a>
				<div id="myDropdown" class="dropdown-content">
					<a href="updateDictionary.ju?word_no=${dictionary.word_no}&pageNum=${pageNum}">단어 수정</a>
					<a href="deleteDictionary.ju?word_no=${dictionary.word_no}&pageNum=${pageNum}">단어 삭제</a>
				</div>
			</div>
			</td>
			</c:if>
			<td><span id="sp_word_no">${dictionary.word_no}</span></td>
			<td>${dictionary.wname}</td>
			<td>${dictionary.substitute}</td>
			<td>${dictionary.meaning}</td>
			<td>${dictionary.dic_recommend}</td>
			<td><input type="button" class="myButton" onclick="window.location.href='recommendDictionary.ju?word_no=${dictionary.word_no}&pageNum=${pageNum}'" value="추천"/>
				<input type="button" class="myButton" onclick="window.location.href='reportDictionary.ju?word_no=${dictionary.word_no}&pageNum=${pageNum}'" value="신고"/>
				<input type="button" class="myButton" value="제안하기" onclick="window.location.href='../dboard/boardWrite.ju?word_no=${dictionary.word_no}'"/>
			</td>
		</tr>
	</c:forEach>
</table>
</c:if>
<center>
<c:if test="${count>0}">
	<c:if test="${startPage>10}">
        <a href="list.ju?pageNum=${startPage-10}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
        <a href="list.ju?pageNum=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${endPage < pageCount }">
        <a href="list.ju?pageNum=${startPage+10}">[다음]</a>
    </c:if>
</c:if>
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
				<input type="button" class="myButton" value="검색" id="searchBtn">
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
</div>
</body>
</div>
</div>
</html>