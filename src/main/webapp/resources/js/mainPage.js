/**
 * 
 */
$(document).ready(function(){
	$('.companyInfo').click(menuPage);
	$('#schedule').click(mySchedule);
	$('.panel-primary').click(projectMain);
	//팝업창 띄우기
	$('#make').click(function(e) {
        $('#popup, #layer').show();
    });

	// レイヤー/ポップアップのcloseボタンクリック時の処理
    $('#close, #layer').click(function(e) {
        $('#popup, #layer').hide();
        $('#prj_Name').val('');
        $('#prj_Name').val('');
    });
    //자동완성을 위한 정보 검색
    $('#cp_posi').on('change',getUser);
    $('#cp_dep').on('change',getUser);
    
    //프로젝트 생성
    $('#makePrj').click(addPrj);
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

function getUser(){
	user['position']=$('#cp_posi').val();
	user['department']=$('#cp_dep').val();
	console.log(user.department);
	console.log(user.position);
	$.ajax({
		url:"getUser",
		type:"post",
		dataType:"json",
		data: JSON.stringify(user),
		contentType: "application/json; charset=utf-8",
		success: function(ob){
			console.log(ob+" Type: "+typeof ob);
			console.log(ob);
			console.log(JSON.stringify(ob));
			
			$.each(ob, function(i,e){
				data.push(e.name);
				console.log(i+' : '+data[i]);
				
			});
			console.log(data);
			console.log(JSON.stringify(data));
		    $( "#tags" ).autocomplete({
		        source: data
		    });
		},
		error: function(){
			alert('Error');
		}
	});
}

function addPrj() {
	const ps_name = document.getElementById("prj_Name");
	const planner =document.getElementById("planner");
	const access_Control = $("#access_Control option:selected").val();
	const userId = $("#userId").val();
	let prj_Num;
	
	if (prj_Name.value == '') {
	  ps_name.focus();
      alert('프젝 이름 빈칸');
      return false;	
   } else if (planner.value == '') {
	  planner.focus();
      alert('빈칸');
      return false;
   } else {
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
     	         	prj_Num=e;
     	         	console.log('prj_Num : '+e);
     	         	ps_name.hide();
     	         	planner.hide();
     	         	access_Control.hide();
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
      
      
      
      location.href = 'goToMain';
   }
}