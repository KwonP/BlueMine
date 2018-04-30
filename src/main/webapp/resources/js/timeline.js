/**
 * 
 */
var page = 1; //보여질 타임라인 부분
var timeLine = ''; //타임라인
var prj_Num = -1; //프로젝트 번호
var tagNum = 0;
var loginId = null;
var sessionInfo;
$(document).ready(function() {
	$('#load').hide();
	$('.companyInfo').click(menuPage);

	prj_Num = $('#getPrjNum').val();
	loginId = $('#getUserId').val();
	sessionInfo = $('#getSession').val();
	getTimeLineList(prj_Num, page, tagNum);

	moreScroll(); //스크롤 로딩 스크립트 등록
	selectDesign(); //select디자인
});

//select 동작
function selectDesign() { 
	$(".dropdown dt a").click(function() {
		$(".dropdown dd ul").toggle();
	});

	$(".dropdown dd ul li a").click(function() {
		var text = $(this).html();
		$(".dropdown dt a span").html(text);
		$(".dropdown dd ul").hide();

		updateTimeLine(getSelectedValue("selectKinds"));
	});

	function getSelectedValue(id) {
		return $("#" + id).find("dt a span.value").html();
	}

	$(document).bind('click', function(e) {
		var $clicked = $(e.target);
		if (!$clicked.parents().hasClass("dropdown"))
			$(".dropdown dd ul").hide();
	});


	$("#flagSwitcher").click(function() {
		$(".dropdown img.flag").toggleClass("flagvisibility");
	});
}
//스크롤 로딩 기능
function moreScroll() { 
	$(document).ready(function() {

		$(window).scroll(function() {
			//console.log($(window).scrollTop()+'  '+($(document).height() - $(window).height()));
			if ($(window).scrollTop() + 5 >= $(document).height() - $(window).height()) {
				scrollY = $(window).scrollTop();

				setTimeout(function() {
					console.log('타임라인 ajax실행');
					getTimeLineList(prj_Num, page, tagNum);

				}, 1000);
				$(window).scrollTop(scrollY);
			}

		});

	});
}
function menuPage() {
	var menuPage = $(this).attr('value');
	location.href = "../" + menuPage;
}

	// 타임라인 보여주는 메소드
	function showList(list) { 
		page++;
		var timeLineDiv = document.getElementById('timeLineDiv');
		var type = 'primary';
		var timeLineHead = '<div class="panel-body"><ul class="timeline">';
		for (var i = 0; i < list.length; i++) {
			var splitArray = list[i].tl_Content.split('///');
			//0:프로젝트 이름 , 1:프로젝트 참여인원
			timeLine += '<li';
			if (i % 2 == 1) {
				timeLine += ' class="timeline-inverted"';
			}
			timeLine += '><div class="timeline-badge"';
			if(splitArray[2]=='del_Tl'){
				timeLine += ' style="background-color:red"><i class="fa fa-trash-o">';
				timeLine += '</i></div><div class="timeline-panel" style="border: 2px red solid">';
			}else{
				timeLine += ' style="background-color:green"><i class="fa fa-calendar-o">';
				timeLine += '</i></div><div class="timeline-panel" style="border: 2px green solid">';
			}
			timeLine += '<div class="timeline-heading"><h4 class="timeline-title">';
			timeLine += splitArray[0];
			timeLine += '</h4><p><small class="text-muted"><i class="fa fa-clock-o"></i>';
			timeLine += list[i].w_Date + '</small>';
			timeLine += '</p></div><div class="timeline-body"><p id="tlText' + list[i].tl_Num + '">' + splitArray[1];
			timeLine += '' + '</p>';
			if (list[i].writer == sessionInfo) { //타임라인 작성자와 
				timeLine += '<hr><div class="btn-group"><button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown">';
				timeLine += '<i class="fa fa-gear"></i> <span class="caret"></span></button><ul class="dropdown-menu" role="menu"><li><a href="#layer1"';
				timeLine += ' tl_Num="' + list[i].tl_Num + '" id="tlUpdate' + list[i].tl_Num + '" onclick="javascript:updateStep(' + "'#layer1'," + list[i].tl_Num + ')">Update</a></li><li><a href="#"';
				timeLine += ' tl_Num="' + list[i].tl_Num + '" id="tlDelete' + list[i].tl_Num + '" onclick="javascript:deleteStep(' + list[i].tl_Num + ')">Delete</a></li></ul></div>';
			}
			timeLine += '</div></div></li>';
		}
		var timeLineFoot = '</ul></div>'
		timeLineDiv.innerHTML = timeLineHead + timeLine + timeLineFoot;


	}
	//새로고침
	function updateTimeLine(tagNum) { 
		page = 1;
		timeLine = '';
		if (tagNum == null) {
			tagNum = 0;
		}
		getTimeLineList(prj_Num, page, tagNum);
	}
	//타임 라인 추가
	function insertTimeLine() {
		var writer = $("#writer").val();
		var tl_Content = $("#timeLineContent").val();
		var tagNum = $("#horseHead option:selected").val();
		;
		if (writer == '' || writer == null) {
			alert('작성자가 설정되어있지 않습니다.');
			return;
		}
		if (tl_Content == '' || tl_Content == null) {
			alert('내용이 입력되어있지 않습니다.');
			return;
		}
		$.ajax({
			url : 'addTimeLine',
			tpue : 'get',
			data : {
				writer : writer,
				tl_Content : tl_Content,
				tagNum : tagNum,
				prj_Num : prj_Num
			},
			dataType : 'text',
			async : false,
			success : function() {
				closePopup();
				updateTimeLine();
				alert("타임라인이 추가되었습니다.");

			},
			error : function(error) {
				console.info('타임라인 추가 오류' + error.status);
			}
		}
		);
	}
	//타임라인 삭제
	function deleteTimeLine(tl_Num) { 
		alert('삭제 시도!')
		$.ajax({
			url : 'deletetimeline',
			tpue : 'get',
			data : {
				tl_Num : tl_Num
			},
			dataType : 'text',
			async : false,
			success : function() {
				closePopup();
				updateTimeLine();
				alert("타임라인이 삭제되었습니다.");

			},
			error : function(error) {
				console.info('타임라인 삭제 오류' + error.status);
			}
		}
		);
	}
	//수정창 닫기
	function closePopup() { 
		$(".dim-layer").fadeOut();
	}
	//타임라인 수정
	function updateTL() { 
		var tl_Num = $('#TLNumber').val();
		var writer = $("#writer").val();
		var tl_Content = $("#timeLineContent").val();
		
		;
		if (writer == '' || writer == null) {
			alert('작성자가 설정되어있지 않습니다.');
			return;
		}
		if (tl_Content == '' || tl_Content == null) {
			alert('내용이 입력되어있지 않습니다.');
			return;
		}
		$.ajax({
			url : 'updatetl',
			tpue : 'get',
			data : {
				writer : writer,
				tl_Content : tl_Content,
				tl_Num : tl_Num
			},
			dataType : 'text',
			async : false,
			success : function() {
				closePopup();
				updateTimeLine();
				alert("타임라인이 수정되었습니다.");

			},
			error : function(error) {
				console.info('타임라인 수정 오류' + error.status);
			}
		}
		);
	}

	//타임라인 리스트가져오기
	function getTimeLineList(prj_Num, page, tagNum) { 
		$.ajax({
			url : 'gettimelinelist',
			tpue : 'get',
			data : {
				page : page
			
			},
			dataType : 'JSON',
			async : false,
			success : function(list) {
				if (list == null) {
					return;
				}
				console.info('리스트 로딩 : ' + list.length + '개');
				showList(list);
			},
			error : function(error) {
				console.info('리스트 로딩 오류' + error.status);
			}
		}
		);
	}
	
