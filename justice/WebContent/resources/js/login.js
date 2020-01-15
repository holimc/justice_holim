// login 버튼을 누를때 동작시킬 펑션
function loginURL(){
	var now = window.location.href;
	var url = "/justice/login.ju?path="+now;
	window.location.href=url;
}
//로그아웃 버튼
function logoutURL(){
	var now = window.location.href;
	var url = "/justice/logout.ju?path="+now;
	window.location.href=url;
}

// 로그인 Pro 페이지에서 원래 페이지로 보내기 위해 redirect의 주소값을 빼낼 펑션
function getRedirect(){
	var params = location.search.substr(location.search.indexOf("?") + 1);
	var sval = params.split("path=");
	return sval[1];
}
// getRedirect로 주소값을 빼낸후, 그곳으로 보내는 펑션
function redirect(){
	var url = getRedirect();
	if(url!=null&&url!=""){
		window.location.href=url;
	}else{
		window.location.href="/justice/list.ju";
	}
}
