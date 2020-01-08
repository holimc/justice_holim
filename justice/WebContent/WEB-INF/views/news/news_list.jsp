<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<script src= https://code.jquery.com/jquery-3.4.1.min.js></script>    
<body>
	<center><b>${news_keword}최신 뉴스</b></center>	 <h4> 현재 기사 글  ${cnt} 개</h4>
	<!-- <button onclick='search("test12")' id ="test12" name="field" value="정치속보">정치속보</button> -->
		<button onclick='search("test13","&sid2=264")' id ="test13" name="field" value="청와대">청와대</button>
		<button onclick='search("test14","&sid2=265")' id ="test14" name="field" value="국회/정당">국회/정당</button>
		<button onclick='search("test15","&sid2=267")' id ="test15" name="field" value="국방/외교">국방/외교</button>
		<button onclick='search("test16","&sid2=268")' id ="test16" name="field" value="북한">북한</button>
		<button onclick='search("test17","&sid2=269")' id ="test17" name="field" value="정치일반">정치/일반</button>
	<br>
		<button onclick='search("test18","&sid2=269")' id ="test18" name="field" value="정치일반">정치개혁</button>
		<button onclick='search("test19","&sid2=267")' id ="test19" name="field" value="국방/외교">외교/통일/국방</button>
		<button onclick='search("test20","&sid2=251")' id ="test20" name="field" value="노동">일자리</button>
		<button onclick='search("test21","&sid2=256")' id ="test21" name="field" value="지역">농산어촌</button>
		<button onclick='search("test22","&sid2=59b")' id ="test22" name="field" value="인권/복지">보건복지</button>
		<button onclick='search("test23","&sid2=250")' id ="test23" name="field" value="교육">육아/교육</button>
		<button onclick='search("test24","&sid2=252")' id ="test24" name="field" value="환경">안전/환경</button>
		<button onclick='search("test25","&sid2=266")' id ="test25" name="field" value="행정">행정</button>
		<button onclick='search("test26","&sid2=240")' id ="test26" name="field" value="도로/교통">교통/건축/국토</button>
		<button onclick='search("test27","&sid2=245")' id ="test27" name="field" value="생활/문화일반">문화/예술/체육/언론</button>
		
		${wd}
<br/>
<style>
	.wrap-loading{
		width : 65%;
		height: 65%;
		top : 0px;
		left: 0px;
		position: fixed;
	    display: block;
		opacity: 0.7;
		background-color: #fff;
		z-index: 99;
		text-align: center; 
	}
	.wrap-loading div{
		 position: absolute;
		 top: 50%;
		 left: 50%;
		 z-index:100;
	}
	.display-none{
		display:none;
	}
</style>

<div class="wrap-loading display-none">
	<div><img src="https://trello-attachments.s3.amazonaws.com/5db12affa0b2ce123ce89f59/5e0ee2c50145582c43ac5b5b/77b5611f4d74c48d0dc036ff8c8b2ebd/loading2.gif"/></div>
</div>

<script>
function search(v,add_url){
	var field_choice = document.getElementById(v).value;

	$.ajax({
		type: "post",
		url : "/justice/news/news_list_Ajax.ju", 
		data : {keyword:field_choice, add_url:add_url},
		success:function(data){
			data = data.trim();
			$("#rlist").html(data);			
		},
		beforeSend: function(){
			//이미지 보여주기 처리 
			$('.wrap-loading').removeClass('display-none');
		}
		,complete: function(){
			//이미지 감추기 처리 
			$('.wrap-loading').addClass('display-none');
		}
		,error:function(e){
			//에러일때 처리 
		}
	});

	
}
</script>

<div id = "rlist"></div>	      

</body>