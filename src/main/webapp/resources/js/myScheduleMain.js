/**
 * 
 */
$(document).ready(function(){
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
	$('#popupBack').fadeIn(300);
	canModify();
}
function popup(){
	$('#workPopup').slideDown('fast');
	$('#popupBack').fadeIn(300);
	readOnly();
}
// 팝업 종료
function popupClose(){
	var check = $('.submitWork').val();
	if (check == 'Update') {
		if (!confirm('Are you suer to cancel updating?')) {
			return;
		}
	}
	$('#workPopup').slideUp('fast');
	$('#popupBack').fadeOut(300);
	$('.cancel').css('display','none');
}
function check(){
	var ps_Name = $('#ps_Name').val();
	var ps_Content = $('#ps_Content').val();
	var startDate = $('#startDate').val();
	var deadLine = $('#deadLine').val();
	var ps_Pri = $('#ps_Pri').val();
	if (ps_Name == "") {
		alert('제목을 입력해 주세요.');
		return false;
	}
	if (ps_Content == "") {
		alert('내용을 입력해 주세요.');
		return false;
	}
	return true;
}
function getDetail(ps_Num){
	$('.submitWork').val('Modify');
	$('#formAction').attr('action','updateWork');
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
	$('#ps_Name').val(work.ps_Num);
	$('#ps_Content').val(work.ps_Content);
	$('#startDate').val(work.startDate);
	$('#deadLine').val(work.deadLine);
	$('#ps_Pri').val(work.ps_Pri);
	popup();
}
function submitType(){
	var getVal = $('.submitWork').val();
	if (getVal == 'Create') {
		$('#formAction').submit();
	} else if( getVal == 'Modify'){
		$('.submitWork').val('Update');
		canModify();
		$('.cancel').css('display','inline-block');
	} else {
		alert($('.submitWork').val());
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