function getParam(sname) {
    var params = location.search.substr(location.search.indexOf("?") + 1);
    var sval = "";
    params = params.split("&");
    for (var i = 0; i < params.length; i++) {
        temp = params[i].split("=");
        if ([temp[0]] == sname) { sval = temp[1]; }
    }
    return sval;
}
function getRedirect(){
	var params = location.search.substr(location.search.indexOf("?") + 1);
	var sval = params.split("redirect=");
	return sval[1];
	 
}
function redirect(){
	var url = getRedirect();
	if(url!=null&&url!=""){
		window.location.href=url;
	}else{
		window.location.href="/justice/list.ju";
	}
}
function button_click(s) {
	var url = "https://www1.president.go.kr/petitions/"+s;
	window.open(url);
}
function url(s){
	var now = window.location.href;
	var url = "petitions/content.ju?num="+s+"&redirect="+now;
	window.location.href=url;
}
function url2(s){
	var now = window.location.href;
	var url = "content.ju?num="+s+"&redirect="+now;
	window.location.href=url;
}