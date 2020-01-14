<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<script src= https://code.jquery.com/jquery-3.4.1.min.js></script>   
<!-- bootstrap -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src= https://code.jquery.com/jquery-3.4.1.min.js></script>   

<script>
	function page(idx,news_keyword){
		var pagenum= idx;		
		var contentnum = $("#contentnum option:selected").val();
		location.href="${pageContext.request.contextPath}/news/news_samekeyword.ju?keyword="+news_keyword+"&pagenum="+pagenum+"&contentnum="+contentnum; 
	}
</script>
<script>
	function newPopup(url){
		var pop_url = url
		var pop_option = "top=10,left=10,width=500,height=600, status=no, menubar=no, toolbar=no, resizable=no"
		window.open(pop_url,pop_option);
	}
</script>

	<strong>${news_keyword}</strong> 관련 뉴스 <br/>
		<h4> 관련 기사 글 갯수 ${cl_cnt} </h4>
		
		
		<c:if test="${cl_cnt<=0}">
			<h4> 관련 기사가 없습니다</h4>
		</c:if>
		<c:if test="${cl_cnt>0}">
		<select name="contentnum" id="contentnum">
			<option value="10">10</option>
			<option value="20">20</option>
			<option value="30">30</option>
		</select> 
		
		<table>
			<thread>
			<table class="table">
	 		<thead class="thead-light">
				<tr>
					<td>기사 제목</td>  
					<td>언론사</td>
					<td>시간</td> 
				</tr>
			</thread>
			<tbody>
				<c:forEach var="k" items="${list}">
					<tr>
						<td><a href="#" onclick="newPopup('${k.news_url}')">${k.news_title}</a></td>
						<td>${k.news_date}</td>	
						<td>${k.news_press}</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
			
			

			
			
			
			
			<tfoot>
				<tr>
			<td colspan="2">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			    <c:if test="${page.prev}">
			   		<li class="page-item"><a class="page-link" href="javascript:page(${page.getStartPage()-1},'${news_keyword}');">Previous</a></li>
			   	</c:if>	
			    <c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
			    	<li class="page-item"><a class="page-link" href="javascript:page(${idx},'${news_keyword}');">${idx}</a></li>
				</c:forEach>
				<c:if test="${page.next}">
			    	<li class="page-item"><a class="page-link" href="javascript:page(${page.getEndPage()+1},'${news_keyword}');">Next</a></li>
			    </c:if>	
			  </ul>
			</nav>
			</td>
			</tr>
			</tfoot>

			</c:if>
			
			
			
