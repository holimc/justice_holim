var cache = [];
//드래그로 선택된 값을 가져오는 함수
function selectText() {
	var selectionText = "";
	if(document.getSelection) {
		selectionText = document.getSelection();
	}else if (document.selection) {
		selectionText = document.selection.createRange().text;
	}
	return selectionText;
}
		
//show를 닫는 함수
$(document).on('mousedown', function(e){
	if($("#tooltip").hasClass("show")){
		$("#tooltip").removeClass("show");
		
	}
});


// 메인 스크립트	
$(function(){
	$(document).mouseup(function(e){
	 	var text = selectText();
		if(text!=null && text!=""){
			var webWidth = window.innerWidth;
			var webHeight = window.innerHeight;

			var popupWidth = $('#tooltip').width();
			var popupHeight = $('#tooltip').height();
			
			var tooltipLeft = e.pageX;
			var tooltipTop = e.pageY;
			
			if(tooltipLeft + popupWidth > webWidth) { tooltipLeft -= popupWidth; }
			if(tooltipTop + popupHeight > webHeight) { tooltipTop -= popupHeight; }
			
			$('#tooltip').css({
				left: tooltipLeft,
				top: tooltipTop
			}).addClass('show').text('loading...');
			$.ajax({
				type : 'post',
				url : '/justice/dictionary/dicToolTip.ju?keyword='+text,
				success : function(data){
					$('#tooltip').html(data);
				}
			})
		}
	})
})