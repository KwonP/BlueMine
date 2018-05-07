/**
 * 
 */
$(document).ready(function(){
	$('#load').hide();
	$('.companyInfo').click(menuPage);
	var getHeight = $('#page-wrapper').css('height').replace(/[^0-9]/g, "");
	getHeight /= 2;
	$('.myWork').css('height',getHeight);
	$('.checkList').css('height',getHeight);
	$('.swiper-container').css('height',getHeight);
	$('.fInner swiper-container').css('height',getHeight);
	$('.swiper-slide-active').css('height',getHeight);
    $("#startDate").datepicker({ dateFormat: "yy-mm-dd" }).val();
    $("#deadLine").datepicker({ dateFormat: "yy-mm-dd" }).val();
    var swiper = new Swiper('.swiper-container', {
		 pagination: '.swiper-pagination',
		 paginationType: 'progress',
		 slidesPerView: 'auto',
		 paginationClickable: true,
		 spaceBetween: 0,
		 freeMode: true,
		 nextButton: '.next',
		 prevButton: '.back'
   });
});
var count = 0; // 체크리스트 업데이트 1개이상 불가능 & 중복 onclick 활성 방지
function menuPage(){
	var menuPage = $(this).attr('value');
	location.href = menuPage;
}
function createPopup(){
	$('.submitWork').val('Create');
	$('#formAction').attr('action','createWork');
	$('#ps_Name').val('');
	$('#ps_Content').val('');
	$('#startDate').val('');
	$('#deadLine').val('');
	$('#ps_Pri').val(1);
	$('#workPopup').slideDown('fast');
	$('.black_overlay').fadeIn(300);
	canModify();
}
function popup(){
	$('#workPopup').slideDown('fast');
	$('.black_overlay').fadeIn(300);
	readOnly();
}
//work팝업 종료
function workPopupClose(){
	var check = $('.submitWork').val();
	if (check == 'Update') {
		if (!confirm('Are you suer to cancel updating?')) {
			return;
		}
	}
	$('#workPopup').slideUp('fast');
	$('.black_overlay').fadeOut(300);
	$('.cancel').css('display','none');
}
function check(){
	var ps_Name = $('#ps_Name').val();
	var ps_Content = $('#ps_Content').val();
	
	// 날짜 비교
	var startValue = $('#startDate').val();
	startValue = startValue.split('-');
	var startDate = new Date();
	startDate.setFullYear(startValue[0],(startValue[1]-1),startValue[2]);
	
	var endValue = $('#deadLine').val();
	endValue = endValue.split('-');
	var deadLine = new Date();
	deadLine.setFullYear(endValue[0],(endValue[1]-1),endValue[2]);
	if (startDate > deadLine) {
		alert("開始日と締め切り日を確認してください。");
		return false;
	}
	startDate = $('#startDate').val();
	deadLine = $('#deadLine').val();
	var ps_Pri = $('#ps_Pri').val();
	if (ps_Name == "") {
		alert('タイトルを入力してください。');
		return false;
	}
	if (ps_Content == "") {
		alert('内容を入力してください。');
		return false;
	}
	return true;
}
function delWork(ps_Num){
	if (confirm('削除しますか?')) {
		$.ajax({
			url : 'delWork',
			type : 'post',
			data : {ps_Num : ps_Num},
			success : function(){
				window.location.reload();
			},
			error : function(){
				alert('削除エラー');
			}
		});
	}
}
function endWork(ps_Num){
	count = 1;
	if (confirm('完了しますか?')) {
		$.ajax({
			url : 'endWork',
			type : 'post',
			data : {ps_Num : ps_Num},
			success : function(){
				window.location.reload();
			},
			error : function(){
				alert('エラー');
			}
		});
	}
}
function getDetail(ps_Num){
	if (count == 1) {
		return;
	}

	$('.submitWork').val('Modify');
	$('#formAction').attr('action','updateWork');
	$('#ps_Num').val(ps_Num);
	$.ajax({
		url : 'getWork',
		type : 'post',
		data : {ps_Num : ps_Num},
		dataType : 'json',
		success : function(work){
			setValues(work);
		}
	});
}
function setValues(work){
	$('#ps_Name').val(work.ps_Name);
	$('#ps_Content').val(work.ps_Content);
	$('#startDate').val(work.startDate);
	$('#deadLine').val(work.deadLine);
	$('#ps_Pri').val(work.ps_Pri);
	popup();
}
function submitType(){
	var getVal = $('.submitWork').val();
	if (getVal == 'Create') {
		$('#ps_Num').remove();
		$('#formAction').submit();
	} else if( getVal == 'Modify'){
		$('.submitWork').val('Update');
		canModify();
		$('.cancel').css('display','inline-block');
	} else {
		$('#formAction').submit();
	}
}
function cancel(){
	readOnly();
	getOriginalValue();
	$('.cancel').css('display','none');
	$('.submitWork').val('Modify');
}
function readOnly(){
	$('#ps_Name').attr('readonly','readonly');
	$('#ps_Content').attr('readonly','readonly');
	$('#startDate').attr('disabled','disabled');
	$('#deadLine').attr('disabled','disabled');
	$('#ps_Pri').attr('disabled','disabled');
}
var ps_NameO;
var ps_ContentO;
var startDateO;
var deadLineO;
var ps_PriO;
function canModify(){
	$('#ps_Name').removeAttr('readonly');
	$('#ps_Content').removeAttr('readonly');
	$('#startDate').removeAttr('disabled');
	$('#deadLine').removeAttr('disabled');
	$('#ps_Pri').removeAttr('disabled');
	if ($('.submitWork').val() == 'Update') {
		ps_NameO = $('#ps_Name').val();
		ps_ContentO = $('#ps_Content').val();
		startDateO = $('#startDate').val();
		deadLineO = $('#deadLine').val();
		ps_PriO = $('#ps_Pri option:selected').val();
	}
}
function getOriginalValue(){
	$('#ps_Name').val(ps_NameO);
	$('#ps_Content').val(ps_ContentO);
	$('#startDate').val(startDateO);
	$('#deadLine').val(deadLineO);
	$('#ps_Pri').val(ps_PriO);
}
//체크리스트 관리 팝업 띄우기
function managePopup(){
	$('#managePopup').slideDown('fast');
	$('.black_overlay').fadeIn(300);
}
// 체크리스트 관리 팝업 닫기
function ckPopupClose(){
	$('#managePopup').slideUp('fast');
	$('.black_overlay').fadeOut(300);
}
function endCklist(loopNum){
	var getClass = $("li[value="+loopNum+"]").attr('class');
	if (getClass == 'unChecked') {
		$.ajax({
			url : 'checkLoop',
			type : 'post',
			data : {loopNum : loopNum},
			success : function(){
				$("li[value="+loopNum+"]").attr('class','checked');
			},
			error : function(){
				alert('エラー');
			}
		});
	} else {
		$.ajax({
			url : 'uncheckLoop',
			type : 'post',
			data : {loopNum : loopNum},
			success : function(){
				$("li[value="+loopNum+"]").attr('class','unChecked');
			},
			error : function(){
				alert('エラー');
			}
		});
	}
}

function addList(){
	var childDiv = '';
	childDiv += '<table class="getCKList" id="getCKList">';
	childDiv += '<tr><td>Name</td><td>:</td><td><input type="text" id="getOneName" onkeyup="nameLimit(this,30)" value="" ></td></tr>'; 
	childDiv += '<tr><td>Day </td><td> : </td><td>';
	childDiv += '<c:forEach begin="1" end="7" varStatus="status">';
	childDiv += '<c:if test="${status.current == 1}">';
	childDiv += '<i class="getDays"><input type="checkbox" value="1" name="getDays">월</i></c:if>';
	childDiv += '<c:if test="${status.current == 2}">';
	childDiv += '<i class="getDays"><input type="checkbox" value="2" name="getDays">화</i></c:if>';
	childDiv += '<c:if test="${status.current == 3}">';
	childDiv += '<i class="getDays"><input type="checkbox" value="3" name="getDays">수</i></c:if>';
	childDiv += '<c:if test="${status.current == 4}">';
	childDiv += '<i class="getDays"><input type="checkbox" value="4" name="getDays">목</i></c:if>';
	childDiv += '<c:if test="${status.current == 5}">';
	childDiv += '<i class="getDays"><input type="checkbox" value="5" name="getDays">금</i></c:if>';
	childDiv += '<c:if test="${status.current == 6}">';
	childDiv += '<i class="getDays"><input type="checkbox" value="6" name="getDays">토</i></c:if>';
	childDiv += '<c:if test="${status.current == 7}">';
	childDiv += '<i class="getDays"><input type="checkbox" value="7" name="getDays">일</i></c:if>';
	childDiv += '</c:forEach></td></tr>';
	childDiv += '<tr><td colspan="3">';
	childDiv += '<a onclick="addOne()">Add List</a></td></tr></table>';

	var parentDiv = document.getElementById('addSpan');
	parentDiv.innerHTML = childDiv;
	$('.addList').text('Cancel');
	$('.addList').attr('onclick','cancelAdd()');
}
function nameLimit(obj, maxByte){ 
	  var strValue = obj.value; 
	  var strLen = strValue.length; 
	  var totalByte = 0; 
	  var lem = 0; 
	  var oneChar = ""; 
	  var str2 = ""; 
	   
	  for (var i = 0; i < strLen; i++){ 
	    oneChar = strValue.charAt(i); 
	    if (escape(oneChar).length > 4) { 
	      totalByte += 2 
	    } else { 
	      totalByte++; 
	    } 
	     
	    // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장 
	    if (totalByte <= maxByte) { 
	      len = i + 1; 
	    } 
	 }
		if (totalByte > maxByte) {
			alert(maxByte + "字を超えて入力することはできません。");
			str2 = strValue.substr(0,len);
			obj.value = str2;
			titleLimit(obj,maxByte);
	}
}
function cancelAdd(){
	$('#getCKList').remove();
	$('.addList').text('Add');
	$('.addList').attr('onclick','addList()');
}
function updateList(cl_Num){
if (count == 1) {
	alert('現在のチェックリストのアップデートを先に行ってください。');
	return;
}
	
	$.ajax({
		url : 'getOneList',
		type : 'post',
		data : {cl_Num : cl_Num},
		dataType : 'json',
		success : function(getOne){
			count = 1;
			getOneInfo(getOne);
		},
		error : function(){
			alert('エラー');
		}
	});
}
function addOne(){
	var cl_Name = $('#getOneName').val();
	var loopDay = new Array();
	$("input[name=getDays]:checked").each(function() {
		  var test = $(this).val();
		  loopDay += test;
	});
	$.ajax({
		url : 'putCKList',
		type : 'post',
		data : {cl_Name : cl_Name, loopDay : loopDay},
		dataType : 'json',
		success : function(getList){
			window.location.reload();
		},
		error : function(){
			alert('エラー');
		}
	});
}
function deleteList(cl_Num){
	count = 1;
	if (!confirm('削除しますか？')) return;
	$.ajax({
		url : 'deleteList',
		type : 'post',
		data : {cl_Num : cl_Num},
		success : function(){
			window.location.reload();
		},
		error : function(){
			alert('エラー');
		}
	});
}
// 여기 보류
var saveName;
var saveNum;
function getOneInfo(getOne){
	saveName = getOne[0].cl_Name;
	saveNum = getOne[0].cl_Num;
	var childDiv = '';
	childDiv += '<table class="getCKList" id="setCKList">';
	childDiv += '<tr><td>Name</td><td>:</td><td><input type="text" id="updateName" value="'+saveName+'"></td>';
	childDiv += '<td><a onclick="updateOne()">Update List</a></td></tr>';
	childDiv += '<tr><td>Day </td><td> : </td><td>';
	childDiv += '<c:forEach begin="1" end="7" varStatus="status">';
	childDiv += '<c:if test="${status.current == 1}">';
	childDiv += '<i class="getDays"><input type="checkbox" value="1" name="setDays">月</i></c:if>';
	childDiv += '<c:if test="${status.current == 2}">';
	childDiv += '<i class="getDays"><input type="checkbox" value="2" name="setDays">火</i></c:if>';
	childDiv += '<c:if test="${status.current == 3}">';
	childDiv += '<i class="getDays"><input type="checkbox" value="3" name="setDays">水</i></c:if>';
	childDiv += '<c:if test="${status.current == 4}">';
	childDiv += '<i class="getDays"><input type="checkbox" value="4" name="setDays">木</i></c:if>';
	childDiv += '<c:if test="${status.current == 5}">';
	childDiv += '<i class="getDays"><input type="checkbox" value="5" name="setDays">金</i></c:if>';
	childDiv += '<c:if test="${status.current == 6}">';
	childDiv += '<i class="getDays"><input type="checkbox" value="6" name="setDays">土</i></c:if>';
	childDiv += '<c:if test="${status.current == 7}">';
	childDiv += '<i class="getDays"><input type="checkbox" value="7" name="setDays">日</i></c:if>';
	childDiv += '</c:forEach></td>';
	childDiv += '<td><a onclick="cancelOne()">Cancel</a></td></tr></table>';
	childDiv += '<input type="hidden" id="hideNum" value="'+saveNum+'">';
	var parentDiv = document.getElementById(getOne[0].cl_Num);
	parentDiv.innerHTML = childDiv;
	var count = $('input[name=setDays]').length;
	for(var i = 0; i < getOne.length; i++){
		for(var j = 1; j <= count; j++){
			var compare = $('input[value='+j+']').val();
			if (getOne[i].loopDay == compare) {
				$('input[value='+j+']').attr('checked', 'checked');
			}
		}
	}
	return false;
	
}
function cancelOne(){
	count = 0;
	var childDiv = '';
	childDiv += saveName;
	childDiv += '<div class="btns">';
	childDiv += '<a onclick="updateList('+saveNum+')">Modify</a>';
	childDiv += '<a onclick="deleteList('+saveNum+')">Delete</a></div>';
	var parentDiv = document.getElementById(saveNum);
	parentDiv.innerHTML = childDiv;
}
function updateOne(){
	var cl_Name = $('#updateName').val();
	var cl_Num = $('#hideNum').val();
	var loopDay = new Array();
	$("input[name=setDays]:checked").each(function() {
		  var test = $(this).val();
		  loopDay += test;
	});
	$.ajax({
		url : 'updateCKList',
		type : 'post',
		data : {cl_Name : cl_Name, loopDay : loopDay,cl_Num : cl_Num},
		dataType : 'json',
		success : function(getList){
			window.location.reload();
		},
		error : function(){
			alert('エラー');
		}
	});
}