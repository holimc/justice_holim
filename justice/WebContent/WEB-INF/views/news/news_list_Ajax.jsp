<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<script src= https://code.jquery.com/jquery-3.4.1.min.js></script>   
	<strong>${method}</strong> 관련 최신 뉴스 <br/>
	
		
		<c:forEach var="newslist" items="${rlst}">
			<tr>
				<td>
					 <a href="${newslist.news_url}">${newslist.news_title}</a> 
				</td>
				<td>
					 ${newslist.news_date}
				</td>			
				<td>
					 ${newslist.news_press}
				</td>
			</tr>
			<br/>
		</c:forEach>