<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<script src= https://code.jquery.com/jquery-3.4.1.min.js></script>    

<body>

	<center><b>${news_keword}최신 뉴스</b></center>	
		<button onclick='search("test12")' id ="test12" name="field" value="정치속보">정치속보</button>
		<button onclick='search("test12")' id ="test12" name="field" value="청와대">청와대</button>
-----------------------------------------------------<br/>
<script>
function search(v){
	var field_choice = document.getElementById(v).value;
	//alert(field_choice);
	$.ajax({
		type: "post",
		url : "/justice/news/news_list_Ajax.ju",
		data : {keyword:field_choice},
		
		success:function(data){
			data = data.trim();
			$("#rlist").html(data);			
		},
	});
}
</script>	
	<!--정치 : 청와대, 국회/정당, 행정, 국방/외교, 북한, 정치일반
		경졔 : 부동산, 금융, 증권, 산업/재계, 글로벌경제, 경제일반, 중기/벤처
		사회 : 사건사고, 교육, 노동, 환경, 언론, 인권/복지, 지역, 인물, 사회 일반
	생활/문화 : 여행/레저, 자동차/시승기, 도로/교통, 건강정보, 공연/전시, 책 , 종교, 생활/문화 일반 
		
	
	정치개혁 > 정치(정치일반) 
	외교/통일/국방 > 정치(국방외교)
	일자리 > 사회(노동)
	미래 > 사회(일반)
	성장동력 >경제(산업/재계)
	농산어촌 > 사회(지역)
	보건복지 > 사회(인권/복지)
	육아/교육 > 사회(교육)
	안전/환경 > 사회(사건사고)(환경)
	저출산/고령화 > 사회 일반)
	행정 > 정치(행정)
	반려동물 > 사회(일반)
	교통/건축/국토 > 생활/문화(도로/교통)
	경제민주화 > 경제(경제일반)
	인권/성평등> 사회(인권/복지)
	문화/생활 > 생활문화  
	
	 -->
	<!--전체 정치개혁 외교/통일/국방  일자리 미래 성장돌겨 농산어촌 보건복지 육아/교육 안전/환경 저출산/고령화대책 행정 반려동물 교통/건축/국토 경제민주화 인권/성평등 문화/예술/체육/언론 기타-->
	<button onclick='search("test01")' id ="test01" name="field" value="정치개혁">정치개혁</button>
	<button onclick="search('test02')" id ="test02" name="field" value="외교/통일/국방">외교/통일/국방</button>
	<button onclick="search('test03')" id ="test03" name="field" value="일자리">일자리</button>
	<button onclick="search('test04')" id ="test04" name="field" value="미래">미래</button>
	<button onclick="search('test05')" id ="test05" name="field" value="성장독려">성장독려</button>
	<button onclick="search('test06')" id ="test06" name="field" value="농산어촌">농산어촌</button>
	<button onclick="search('test07')" id ="test07" name="field" value="보건복지">보건복지</button>
	<button onclick="search('test08')" id ="test08" name="field" value="육아교육">육아교육</button>
	<button onclick="search('test09')" id ="test09" name="field" value="안전/환경">안전/환경</button>
	<button onclick="search('test10')" id ="test10" name="field" value="저출산/고령화대책">저출산/고령화대책</button>
	<button onclick="search('test11')" id ="test11" name="field" value="화해">행정</button>
	
	


<div id = "rlist"></div>	      
	
<br/>-----------------------------------------------------

	
	 	<table border="1">
		<tr>
			<td>title</td> <!-- news_url -->
			<td>news_date</td> <!-- news_date -->
			<td>언론사</td> <!--news_press  -->
		</tr>	
		
		<h4> 전체 기사 글 갯수 ${cnt} </h4>
		<c:if test="${cnt<=0}">
			<h4> 관련 기사가 없습니다</h4>
		</c:if>
		<c:if test="${cnt>0}">
		<c:forEach var="newslist" items="${lst}">
			<tr>
				<td>
					 <a href="${newslist.news_url}">${newslist.news_title}</a> <!-- redirect로 변경 -->
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
</body>