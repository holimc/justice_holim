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
<script>
	function page(idx){
		var pagenum= idx;
		var contentnum = $("#contentnum option:selected").val();
		location.href="${pageContext.request.contextPath}/news/news_categoryAll.ju?pagenum="+pagenum+"&contentnum="+contentnum; 
	}
</script>
	<strong>${method}</strong> 관련 뉴스 <br/>
		<h4> 관련 기사 글 갯수 ${cnt1} </h4>
		<c:if test="${cnt1<=0}">
			<h4> 관련 기사가 없습니다</h4>
		</c:if>
		<c:if test="${cnt1>0}">
		<select name="contentnum" id="contentnum">
			<option value="10">10</option>
			<option value="20">20</option>
			<option value="30">30</option>
		</select> 
		
		<table>
			<thread>
			<table border="1">
				<tr>
					<td>기사 제목</td>  
					<td>언론사</td>
					<td>시간</td> 
					<td>연관단어</td>
				</tr>
			</thread>
			<tbody>
				<c:forEach var="k" items="${list}">
					<tr>
						<td><a href="#" onclick="newPopup('${k.news_url}')">${k.news_title}</a></td>
						<td>${k.news_date}</td>	
						<td>${k.news_press}</td>
						<td>${k.news_keyword}</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
			<tfoot>
				<tr>
					<td colspan="2">
					<c:if test="${page.prev}">
						<a style="text-decoration : none;" href="javascript:page(${page.getStartPage()-1});">&laquo;</a>
					</c:if>
					<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
						<a style="text-decoration:none;"href="javascript:page(${idx});">${idx}</a>
					</c:forEach>
					<c:if test="${page.next}">
						<a style="text-decoration:none;" href="javascript:page(${page.getEndPage()+1});">&raquo;</a>
					</c:if>
					
					</td>
				</tr>
			</tfoot>
			</c:if>