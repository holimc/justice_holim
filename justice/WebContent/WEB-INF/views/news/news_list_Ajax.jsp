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
	<strong>${method}</strong> 관련 최신 뉴스 <br/>
		
		
		
		
	<table class="table">
	  <thead class="thead-light">
	    <tr>
	      <th scope="col">기사제목</th>
	      <th scope="col">언론사</th>
	      <th scope="col">날짜</th>
	    </tr>
	  </thead>
	  <tbody>
	  <a href="/justice/news/news_categoryAll.ju">더보기</a>
	  	<c:if test="${cnt1<=0}">
		<h4> 관련 기사가 없습니다</h4>
		</c:if>
	  <c:if test="${cnt1>0}">
	  <c:forEach var="newslist" items="${rlst}">
	    <tr>
	      <td><a href="#" onclick="newPopup('${newslist.news_url}')">${newslist.news_title}</a></td>
	      <td> ${newslist.news_date}</td>
	      <td>${newslist.news_press}</td>
	    </tr>
	  </c:forEach>  
	  </c:if>
	  </tbody>
	</table>
			