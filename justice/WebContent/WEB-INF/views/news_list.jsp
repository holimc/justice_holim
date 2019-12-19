<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<body>
	<center><b>최신 뉴스</b></center>

	 	<table>
	 	
		<tr>
			<td>title</td> <!-- news_url -->
			<td>news_date</td> <!-- news_date -->
			<td>언론사</td> <!--news_press  -->
			<td>기자</td>	<!-- news_reporter -->
		</tr>	
		<c:forEach var="newslist" items="${lst}">
				<td>
					 <a href="newlist.news_url">${newslist.news_title}</a>
				</td>
				<td>
					 ${newslist.news_date}
				</td>			
				<td>
					 ${newslist.news_press}
					 ${newslist.news_press}
				</td>
				
				
		</c:forEach>
		</table>
</body>