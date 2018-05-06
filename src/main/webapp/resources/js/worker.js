/**
 * 
 */
var pass = '../';
var showNumber=0;	//0이면 알람리스트와 알림토스트 1이면 알림 토스트만
var updateCheck = function(loginId,addPass,number){
	if(addPass!=null){
		pass=addPass;
	}
	if(number!=null){
		showNumber = number;
	}
	
	if(loginId==null||loginId==''){
		console.log('로그인 아이디 없음');
		loginId='test';//임시
	}
	checkNotifications(loginId)
	setTimeout('updateCheck("'+loginId+'","'+pass+'",'+showNumber+')',5000);
};

function checkNotifications(loginId){
	
	$.ajax({
		url : pass+'project/checknotifications',
		tpue : 'get',
		data : {loginId:loginId},
		dataType : 'JSON',
		async : false,
		success : function(list) {
			if (list == null) {
				return;
			}
			console.info('알림 로딩 : ' + list.length + '개');
			
			postNotifications(list);
		},
		error : function(error) {
			console.info('알림 로딩 오류' + error.status);
		}
	}
	);
}
function postNotifications(list){
	for(var i=0;i<list.length;i++){
		
		var type='';
		var command = '';
		var splitArray = list[i].update_Date.split('!@#');
		toastr.options = {
				  "closeButton": true,
				  "debug": true,
				  "newestOnTop": true,
				  "progressBar": true,
				  "positionClass": "toast-top-right",
				  "onclick":function () {
		                 alert('worker.js에 있는 이곳에 어드레스를 설정해주세요.');
		             },
				  "preventDuplicates": false,
				  "showDuration": "300",
				  "hideDuration": "1000",
				  "timeOut": "0",
				  "extendedTimeOut": "0",
				  "showEasing": "swing",
				  "hideEasing": "linear",
				  "showMethod": "fadeIn",
				  "hideMethod": "fadeOut",
				  "tapToDismiss": false
				}
		if((list[i].command_Check==null||list[i].command_Check=='')&&(list[i].info_Content!=null&&list[i].info_Content!='')){
			//INSERT
			toastr.options.onclick=null;
			if(list[i].info_Type=='prjList'){
				type='プロジェクト[';
				toastr.info(''+'<button type="button" class="btn clear" onclick="goProjectMain('+list[i].info_Num+')"><span style="color: black;">移動する</span></button>',type+ list[i].info_Content+']が生成されました。');
			}else if(list[i].info_Type=='gp_Work'){
				type='プロジェクト['+splitArray[2]+']のグループ['+splitArray[3]+']に仕事[';
				toastr.info(''+'<button type="button" class="btn clear" onclick="goTaskMain('+splitArray[4]+')"><span style="color: black;">移動する</span></button>',type+ list[i].info_Content+']が生成されました。');
			}
			
		}else if((list[i].command_Check!=null&&list[i].command_Check!='')&&(list[i].info_Content==null||list[i].info_Content=='')){
			//DELETE
			toastr.options.onclick=null;
			if(list[i].info_Type=='prjList'){
				type='プロジェクト[';
			}else if(list[i].info_Type=='gp_Work'){
				type='プロジェクト['+splitArray[2]+']のグループ['+splitArray[3]+']に仕事[';
			
			}
			toastr.error('', type+list[i].command_Check+']が削除されました。');
		}else{
			//UPDATE
			//JSON.stringify(list[i])
			toastr.options.onclick=null;
			if(list[i].info_Type=='prjList'){
				type='プロジェクト[';
				toastr.success(''+'<button type="button" class="btn clear" onclick="goProjectMain('+list[i].info_Num+')"><span style="color: black;">移動する</span></button>',type+ list[i].info_Content+']が修正されました。');
			}else if(list[i].info_Type=='gp_Work'){
				type='プロジェクト['+splitArray[2]+']のグループ['+splitArray[3]+']に仕事[';
				toastr.success(''+'<button type="button" class="btn clear" onclick="goTaskMain('+splitArray[4]+')"><span style="color: black;">移動する</span></button>',type+ list[i].info_Content+']が修正されました。');
			}
		}
		if(showNumber==0){
			showNotice(list[i],'../');
		}
		
	}
}
function goProjectMain(prj_Num){
	location.href = pass+"project/sendNum?prj_Num="+prj_Num;
}function goTaskMain(prj_Num){
	location.href = pass+"task/taskMain?prj_Num="+prj_Num;
}
