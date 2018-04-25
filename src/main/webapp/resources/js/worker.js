/**
 * 
 */
var updateCheck = function(){
	checkNotifications()
	setTimeout('updateCheck()',1000);
};

updateCheck();
if ($('#addBehaviorOnToastClick').prop('checked')) {
    toastr.options.onclick = function () {
        alert('You can perform some custom action after a toast goes away');
    };
}

function checkNotifications(){
	loginId='';//!!!!!!!!!!!!!!!!!!!나중에 수정할 것
	$.ajax({
		url : 'checknotifications',
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
		if(list[i].info_Type=='prjList'){
			type='프로젝트 ';
		}else if(list[i].info_Type=='gp_Work'){
			type='일감 ';
		}
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
				  "timeOut": "5000",
				  "extendedTimeOut": "1000",
				  "showEasing": "swing",
				  "hideEasing": "linear",
				  "showMethod": "fadeIn",
				  "hideMethod": "fadeOut",
				  "tapToDismiss": false
				}
		if(list[i].command_Check==null&&list[i].info_Content!=null){
			//INSERT
			toastr.options.onclick=null;
			toastr.info(''+'<button type="button" class="btn clear" onclick="alert('+"'test입니다.'"+');">Yes</button>',type+ list[i].info_Content+'(이)가 생성되었습니다.');
		}else if(list[i].command_Check!=null&&list[i].info_Content==null){
			//DELETE
			toastr.options.onclick=null;
			toastr.error('', type+list[i].command_Check+'(이)가 삭제되었습니다.');
		}else{
			//UPDATE
			//JSON.stringify(list[i])
			toastr.success('', type+list[i].info_Content+'(이)가 수정되었습니다.');
		}
		
	}
}

function deleteNotifications(trigger_Num){
	$.ajax({
		url : 'deletenotifications',
		tpue : 'get',
		data : {trigger_Num : trigger_Num},
		dataType : 'text',
		async : false,
		success : function() {
			
			console.info('알림 삭제 ');
		},
		error : function(error) {
			console.info('알림 삭제 오류' + error.status);
		}
	}
	);
}