<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<script src= https://code.jquery.com/jquery-3.4.1.min.js></script>   
<script>
	function newPopup(url){
		var pop_url = url
		var pop_option = "top=10,left=10,width=500,height=600, status=no, menubar=no, toolbar=no, resizable=no"
		window.open(pop_url,pop_option);
	}
</script>

	<strong>${method}</strong> 관련 뉴스 <br/>
		<table border="1">
		<tr>
			<td>기사 제목</td> <!-- news_url -->
			<td>언론사</td> <!-- news_date -->
			<td>시간</td> <!--news_press  -->
		</tr>	
		
		<h4> 관련 기사 글 갯수 ${cnt1} </h4>
		<c:if test="${cnt1<=0}">
			<h4> 관련 기사가 없습니다</h4>
		</c:if>
		<c:if test="${cnt1>0}">
		<c:forEach var="newslist" items="${rlst}">
			<tr>
				<td>
					<a href="#" onclick="newPopup('${newslist.news_url}')">${newslist.news_title}</a>
				</td>
				<td>
					 ${newslist.news_date}
				</td>			
				<td>
					 ${newslist.news_press}
				</td>
			</tr>
		</c:forEach>
		</c:if>
		</table>