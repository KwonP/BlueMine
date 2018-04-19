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
	$('#createDiv').slideDown('fast');
	$('#popupBack').fadeIn(300);
}
// 팝업 종료
function popupClose(){
	if (confirm('Are you sure to quit joining?')) {
		$('#createDiv').slideUp('fast');
		$('#popupBack').fadeOut(300);
	}
}
