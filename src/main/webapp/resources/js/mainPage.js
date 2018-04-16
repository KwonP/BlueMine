/**
 * 
 */
$(document).ready(function(){
	$('.companyInfo').click(menuPage);
	$('#schedule').click(mySchedule);
	$('.panel-primary').click(projectMain);
});
function menuPage(){
	var menuPage = $(this).attr('value');
	location.href = menuPage;
}
function mySchedule(){
	location.href="mySchedule/main";
}
function projectMain(){
	var getNum = $(this).attr('value');
	location.href = "project/sendNum?prj_Num="+getNum;
}