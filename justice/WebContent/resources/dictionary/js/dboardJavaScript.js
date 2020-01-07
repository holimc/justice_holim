	
	
	
	// 검색버튼
	$(function(){
		$(document).on('click', '#searchBtn', function(){
			var url = "boardList.ju";
			var category = $("#category").val();
			url = url + "?category=" + category;
			var keyword = $("#keyword").val();
			url = url + "&keyword=" + keyword
			location.href=url;
		});
	});
	// 컨텐츠 열기
	$(document).ready(function(){
		$(".detail_content").hide();
		$(document).on('click', '#open_content', function(){
			var tr = $(this).parent();
			var d_board_no = tr.find("#d_board_no").val();
			if($("#"+d_board_no).is(":visible")){
				$("#"+d_board_no).slideUp();
			}else{
				$("#"+d_board_no).slideDown();
			}
			
		})
	})

	//수정하기
	$(function(){
		$(document).on('click', '#updateBtn', function(){
			var btn = $(this);
			var tr = btn.parent().parent();
			var num = tr.find("#d_board_no").val();
			url = "boardUpdate.ju?d_board_no=" + num;
			location.href=url;
		})
	})
	// 삭제버튼
	$(function(){
		$(document).on('click', '#deleteBtn', function(){
			var btn = $(this);
			var tr = btn.parent().parent();
			var num = tr.find("#d_board_no").val();
			url = "boardDelete.ju?d_board_no=" + num;
			location.href=url;
		})
	})
	// 추천
	$(function(){
		$(document).on('click', '#recommendBtn', function(){
			var btn = $(this);
			var tr = btn.parent().parent();
			var num = tr.find("#d_board_no").val();
			url = "boardRecommend.ju?d_board_no=" + num;
			location.href=url;
		})
	})
	
	// 체크박스
	
	$(function(){
		$("#selectAll").click(function(){
			if($("#selectAll").prop("checked")){
				$("input[type=checkbox]").prop("checked",true);
			}else{
				$("input[type=checkbox]").prop("checked",false);
			}
		})
	})
	$(function(){
		$(".chkPost").click(function(){
			$("#selectAll").prop("checked", false);
		})
	})
	
	$(function(){
		$(document).on('click','#selDelete', function(){
			var confirm_check = confirm("선택한 글을 지우시겠습니까?");
			
			if(confirm_check){
				var chkArr = new Array();
				$("input[id='chkPost']:checked").each(function(){
					chkArr.push($(this).attr("data-d_board_no"));
				})
				$.ajax({
					url : "deleteByAdmin.ju",
					type : "post" ,
					data : { chbox : chkArr } ,
					success : function(){
						location.href="boardList.ju";
					}
				})
			}
			
		})
	})
	
	$(function(){
		$(document).on('click','#selVote', function(){
			var confirm_check = confirm("선택한 글을 투표게시 하시겠습니까?");
			if(confirm_check){
				var chkArr = new Array();
				$("input[id='chkPost']:checked").each(function(){
					chkArr.push($(this).attr("data-d_board_no"));
				})
				$.ajax({
					url : "insertVoting.ju",
					type : "post",
					data : {chbox : chkArr},
					success : function(){
						location.href="boardList.ju";
					}
				})
			}
			
		})
	})
	$(function(){
		$(document).on('click','#releaseChk', function(){
			$("#selectAll").prop("checked", false);
			$(".chkPost").prop("checked", false);
		})
	})