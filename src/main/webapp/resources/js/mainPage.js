/**
 * 
 */
$(document).ready(function(){
	alert('적용');
	var hei =  $(window).height() / 2;
	$('#proBtn').css('top',hei);
	$('#proBtn').click(togglePro);
	$('.menu').click(menuPage);
});
function togglePro(){
	var getRight = $('.profileBar').css('right').replace(/[^0-9]/g, "");
	if (getRight == 290) {
		$('.profileBar').animate({right : '0px'},500);
		$('#proBtn').attr('class','glyphicon glyphicon-chevron-right');
	}else {
		$('.profileBar').animate({right : '-290px'},500);
		$('#proBtn').attr('class','glyphicon glyphicon-chevron-left');
	}
}
function menuPage(){
	var menuPage = $(this).attr('value');
	location.href = menuPage;
}