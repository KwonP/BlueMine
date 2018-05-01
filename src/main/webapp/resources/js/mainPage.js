/**
 * 
 */
$(document).ready(function(){
	$('#load').hide();
	$('.companyInfo').click(menuPage);
	$('#schedule').click(mySchedule);
	$('.panel-primary').click(projectMain);

    //자동완성을 위한 정보 검색
    $('#cp_posi').on('change',check);
    $('#cp_dep').on('change',check);
    
    //프로젝트 생성
    $('#CreatePrj').on('click',addPrj);
    $('#CreateGroup').on('click',addGroup);
    
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

function check(){
    var getDep =  $('#cp_dep').val();
    var getPo = $('#cp_posi').val();
    console.log(getDep);
    console.log(getPo);
    $.ajax({
       url : 'getSort',
       type : 'post',
       data : {getDep : getDep, getPo : getPo},
       dataType : 'json',
       success : function(getVal){
    	  console.log(getVal);
          putAuto(getVal);
       },
       error : function(){
          alert('서버 오류');
       }
    });
 }
 function putAuto(getVal){
        var getPeople = new Array();
       for(var i = 0; i < getVal.length; i++){
    	  var  wholeInfo = {};
          wholeInfo.label = getVal[i].name+":"+getVal[i].email;
          wholeInfo.value = getVal[i].name;
          console.log(wholeInfo);
          getPeople.push(wholeInfo);
       } 
    $('#planner').autocomplete({
       source : getPeople,
       autoFocus: true,
       collapsible: true,
    });
 }
 
function addPrj() {
	const ps_name = document.getElementById("prj_Name");
	const planner =document.getElementById("planner");
	const access_Control = $("#access_Control option:selected").val();
	const userId = $("#userId").val();
	let prj_Num = document.getElementById('prj_Num');
	
	if (prj_Name.value == '') {
	  ps_name.focus();
      alert('프로젝트 이름이 빈칸입니다.');
      return false;	
   } else if (planner.value == '') {
	  planner.focus();
      alert('빈칸');
      return false;
   } 	
      $.ajax({
         url: 'makePrj',
         type: 'POST',
         data: {ps_name : ps_name.value
        	 , planner : planner.value
        	 ,access_Control : access_Control},
        dataType:"text",
        success: function(e){
     		console.log('프로젝트 생성');
     		console.log('프로젝트 번호'+e);
     		prj_Num=e;
     		console.log('prj_Num : '+e);
     		
     		$.ajax({
     	         url: 'setRelation',
     	         type: 'POST',
     	         data: {
     	        	 prj_Num : prj_Num
     	        	 ,userId :userId},
     	         success: function(e){
     	         	console.log('관계 세팅완료');
     	         	console.log('프로젝트 번호 : '+e);
     	         	console.log('prj_Num : '+e);
     	         	$('#addPrj').removeAttr('class').addClass('out');
     	         	$('#addGroup').css('display','block').addClass('in');
     	         	$('#prj_Num').attr('value',e);
     	         	prj_Num=$('#prj_Num').attr('value');
     	         	console.log(prj_Num);
     	         	$('#planner').val();
     	         },
     	         error: function(e) {
     	            alert('관계설정 실패');
     	         }
     	      });
     	},
         error: function(e) {
            alert('생성 실패');
         }
      });  
}
function addGroup(){
	var prj_Num = $('#prj_Num').val();
	var gp_Name = $('#gp_Name').val();
	console.log(prj_Num);
	console.log(gp_Name);
	$.ajax({
         url: 'makeGroup',
         type: 'POST',
         data: {
        	 prj_Num : prj_Num
        	 ,gp_Name :gp_Name},
         success: function(result){
         	console.log('그룹 생성완료');
         	console.log('그룹 번호 : '+result);
         	console.log('gp_Num : '+result);
         	$('gp_Name').val('');
         },
         error: function(error) {
            alert('그룹생성 실패');
            console.log(error);
         }
      });
}