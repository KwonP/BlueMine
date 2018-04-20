/**
 * 
 */
$(document).ready(function(){
	$('.companyInfo').click(menuPage);
	var getHeight = $('#page-wrapper').css('height').replace(/[^0-9]/g, "");
	getHeight /= 2;
	$('.createDiv').css('height',getHeight);
	$('.checkList').css('height',getHeight);
});
function menuPage(){
	var menuPage = $(this).attr('value');
	location.href = menuPage;
}
function popup(){
	$('#workPopup').slideDown('fast');
	$('#popupBack').fadeIn(300);
}
// 팝업 종료
function popupClose(){
	$('#workPopup').slideUp('fast');
	$('#popupBack').fadeOut(300);
}
function check(){
	var title = $('#ps_Name').val();
	var content = $('#ps_Content').val();
	if (title == "") {
		alert('제목을 입력해 주세요');
		return false;
	}
	if (content == "") {
		alert('내용을 입력해 주세요');
		return false;
	}
	alert('전부 통과!');
	return true;
}