<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
 
<!-- bootstrap -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src= https://code.jquery.com/jquery-3.4.1.min.js></script>   
<jsp:include page="../member/header.jsp"/>

<body>
	<center><b>${news_keword}==최신 뉴스==</b></center>	 <h4> 현재 기사 글  ${cnt} 개</h4>
	
	
	<!-- <button onclick='search("test13","&sid2=264")' id ="test13" name="field" value="청와대" class="btn btn-secondary btn-lg">청와대</button> -->	
	<br>
<br/>
<style>
	.wrap-loading{
		width : 100%;
		height: 100%;
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
		 top: 30%;
		 left: 30%;
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
			location.href="/justice/error.ju";
		}
	});
}
</script>
		${wd}
<div id = "rlist"></div>	      


<div class="container">

<div class="card" style="width: 18rem;  float: left;">
  <img src="/justice/images/test14.jpg" width=auto, height=250px class="card-img-top" alt="...">
  <div class="card-body">
    <button onclick='search("test18","&sid2=269")' id ="test18" name="field" value="정치일반" class="btn btn-secondary btn-lg">정치개혁</button>
      </div>
</div>

<div class="card" style="width: 18rem;  float: left;">
  <img src="/justice/images/test13.jpeg"width=400px, height=250px class="card-img-top" alt="...">
  <div class="card-body">
	<button onclick='search("test19","&sid2=267")' id ="test19" name="field" value="국방/외교" class="btn btn-secondary btn-lg">외교/통일/국방</button>
  </div>
</div>

<div class="card" style="width: 18rem;  float: left;">
  <img src="/justice/images/test12.jpg" width=400px, height=250px class="card-img-top" alt="...">
  <div class="card-body">
		<button onclick='search("test20","&sid2=251")' id ="test20" name="field" value="노동" class="btn btn-secondary btn-lg">일자리</button>
  </div>
</div>
</div>

<div class="container">

<div class="card" style="width: 18rem;  float: left;">
  <img src="/justice/images/test11.jpg" width=auto, height=250px class="card-img-top" alt="...">
  <div class="card-body">
		<button onclick='search("test21","&sid2=256")' id ="test21" name="field" value="지역" class="btn btn-secondary btn-lg">농산어촌</button>
  </div>
</div>

<div class="card" style="width: 18rem;  float: left;">
  <img src="/justice/images/test10.jpg" width=auto, height=250px class="card-img-top" alt="...">
  <div class="card-body">
		<button onclick='search("test22","&sid2=59b")' id ="test22" name="field" value="인권/복지" class="btn btn-secondary btn-lg">보건복지</button>
  </div>
</div>

<div class="card" style="width: 18rem;  float: left;">
  <img src="/justice/images/test9.jpg" width=400px, height=250px class="card-img-top" alt="...">
  <div class="card-body">
		<button onclick='search("test23","&sid2=250")' id ="test23" name="field" value="교육" class="btn btn-secondary btn-lg">육아/교육</button>
  </div>
</div>
</div>

<div class="container">
<div class="card" style="width: 18rem;  float: left;">
  <img src="/justice/images/test8.jpg" width=auto, height=250px class="card-img-top" alt="...">
  <div class="card-body">
		<button onclick='search("test24","&sid2=252")' id ="test24" name="field" value="환경" class="btn btn-secondary btn-lg">안전/환경</button>
  </div>
</div>

<div class="card" style="width: 18rem;  float: left;">
  <img src="/justice/images/test5.jpg" width=auto, height=250px class="card-img-top" alt="...">
  <div class="card-body">
		<button onclick='search("test25","&sid2=266")' id ="test25" name="field" value="행정" class="btn btn-secondary btn-lg">행정</button>
  </div>
</div>

<div class="card" style="width: 18rem;  float: left;">
  <img src="/justice/images/test6.jpg" width=auto, height=250px class="card-img-top" alt="...">
  <div class="card-body">
		<button onclick='search("test26","&sid2=240")' id ="test26" name="field" value="도로/교통" class="btn btn-secondary btn-lg">교통/건축/국토</button>
  </div>
</div>
</div>

<div class="container">
<div class="card" style="width: 18rem;  float: left;">
  <img src="/justice/images/test7.png" width=auto, height=250px class="card-img-top" alt="...">
  <div class="card-body">
		<button onclick='search("test27","&sid2=245")' id ="test27" name="field" value="생활/문화일반" class="btn btn-secondary btn-lg">문화/예술/체육/언론</button>
  </div>
</div>


<div class="card" style="width: 18rem;  float: left;">
  <img src="/justice/images/test4.png" width=auto, height=250px style = class="card-img-top" alt="...">
  <div class="card-body">
		<button onclick='search("test13","&sid2=264")' id ="test13" name="field" value="청와대" class="btn btn-secondary btn-lg">청와대</button>
      </div>
</div>


<div class="card" style="width: 18rem;  float: left;">
  <img src="/justice/images/test2.jpg" width=400px, height=250px class="card-img-top" alt="...">
  <div class="card-body">
	<button onclick='search("test14","&sid2=265")' id ="test14" name="field" value="국회/정당" class="btn btn-secondary btn-lg">국회/정당</button>
     </div>
</div>
</div>

<div class="container">
<div class="card" style="width: 18rem;  float: left;">
  <img src="/justice/images/test3.jpg" width=auto, height=250px class="card-img-top" alt="...">
  <div class="card-body">
		<button onclick='search("test16","&sid2=268")' id ="test16" name="field" value="북한" class="btn btn-secondary btn-lg">북한</button>
      </div>
</div>
</div>


</body>

