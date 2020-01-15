//드래그로 선택된 값을 가져오는 함수
function selectText() {
	// 변수 선언
	var selectionText = "";
	// 드래그로 설정된 텍스트를 읽어옴
	if(document.getSelection) {
		selectionText = document.getSelection();
	}else if (document.selection) {
		// 드래그시 읽어오지 못한 경우, 선택된 영역의 텍스트를 읽어온다.
		selectionText = document.selection.createRange().text;
	}
	// 이후 변수에 저장된 값 리턴
	return selectionText;
}
		
// 툴팁을 닫는 함수. mousedown (클릭 누를시) 실행
$(document).on('mousedown', function(e){
	// 툴팁이 하위 클래스 show를 가지고 있을 경우
	if($("#tooltip").hasClass("show")){
		// 하위 클래스 show를 지운다. setTimeout으로 딜레이 0.1초를 준다.
		setTimeout(function(){
			$("#tooltip").removeClass("show");
		},100);
	}
});


// 툴팁 기능 메인 스크립트	
$(function(){
	// function의 조건을 mouseup으로 하여, 드래그 후 마우스를 땔때 작동한다.
	$(document).mouseup(function(e){
		// 서브 function을 통해 변수 text에 값을 저장
	 	var text = selectText();
	 	// setTimeout을 0.1초로 설정한다.
	 	// setTimeout을 설정시, 툴팁 내부의 a태그를 클릭할 수 있으나 지연시간이 없을시 툴팁이 바로 지워지고 다시 생성되기 때문에 설정한다.
	 	setTimeout(function(){
	 		// 그냥 아무곳이나 클릭시 실행이 되지 않도록 유효성검사를 한다. 
			if(text!=null && text!=""){
				
				// webWidth, webHeight는 현재 인터넷 창의 크기를 받아온다.
				var webWidth = window.innerWidth;
				var webHeight = window.innerHeight;
				
				// popupWidth, poupHeight는 생성 될 툴팁 창의 크기를 받아온다.
				var popupWidth = $('#tooltip').width();
				var popupHeight = $('#tooltip').height();
				
				// e는 현재 마우스의 위치 좌표를 받아온다.
				var tooltipLeft = e.pageX;
				var tooltipTop = e.pageY;
				
				// 툴팁이 열릴 위치인 left에서부터 popup의 가로 길이가 현재 인터넷 창의 크기보다 클시, 툴팁이 열릴 위치를 -=로 조정한다.
				// Top, Height 역시 세로 길이를 조정하는 if문.
				if(tooltipLeft + popupWidth > webWidth) { tooltipLeft -= popupWidth; }
				if(tooltipTop + popupHeight > webHeight) { tooltipTop -= popupHeight; }
				
				// 툴팁 생성 메서드. css로 저장한 형식과 위에서 조정한 위치에 툴팁을 만든다.
				// 또한 툴팁을 만든 이후 지우고 관리하기 위한 하위 클래스 show를 만들고, ajax로 페이지 불러오기전에 출력될 loading이 먼저뜨게한다. 
				$('#tooltip').css({
					left: tooltipLeft,
					top: tooltipTop
				}).addClass('show').text('loading...');
				// ajax를 이용한 비동기 통신으로, 드래그한 데이터를 Action으로 보내서 유효성 검사 및 전처리 후 DB조회
				// 이후 ajax를 통해 dicToolTip 페이지에 출력될 데이터를 Tooltip의 안에 넣는다.  
				$.ajax({
					type : 'post',
					url : '/justice/dictionary/dicToolTip.ju?keyword='+text,
					success : function(data){
						$('#tooltip').html(data);
					}
				})
			}
	 	},100);
	})
})