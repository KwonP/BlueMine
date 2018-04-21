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