/**
 * 
 */

$(document).ready(function(){
	$('.companyInfo').click(menuPage);
});
function menuPage(){
	var menuPage = $(this).attr('value');
	location.href = "../"+menuPage;
}