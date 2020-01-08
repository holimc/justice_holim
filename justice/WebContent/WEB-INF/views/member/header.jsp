<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/justice/main.ju">홈</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarText" aria-controls="navbarText"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarText">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="/justice/news/news_list.ju">뉴스</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/justice/petitions/subject.ju">국민청원</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/justice/dictionary/list.ju">단어</a>
				</li>
			</ul>
			<c:if test="${memId==null}">
				<button onclick="location.href='/justice/login.ju'">로그인</button>
				<button onclick="location.href='/justice/registForm.ju'">회원가입</button>
			</c:if>
			<c:if test="${memId!=null && admin == null}">
				<button onclick="location.href='/justice/logout.ju'">로그아웃</button>
				<button onclick="location.href='/justice/memberEdit2.ju'">회원정보 수정</button>
			</c:if>
			<!-- 관리자 추가 -->
			<c:if test="${memId!=null && admin != null}">
				<button onclick="location.href='/justice/logout.ju'">로그아웃</button>
				<button onclick="location.href='/justice/adminpage.ju'">관리자페이지</button>
			</c:if>
		</div>

	</nav>
</body>
</html>