/**
 * 
 */

var updateCheck = function(loginId){
	
	if(loginId==null||loginId==''){
		console.log('로그인 아이디 없음');
		loginId='test';//임시
	}
	checkNotifications(loginId)
	setTimeout('updateCheck("'+loginId+'")',5000);
};

function checkNotifications(loginId){
	
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
				  "timeOut": "1000",
				  "extendedTimeOut": "1000",
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
				type='프로젝트 ';
				toastr.info(''+'<button type="button" class="btn clear" onclick="goProjectMain('+list[i].info_Num+')"><span style="color: black;">이동하기</span></button>',type+ list[i].info_Content+'(이)가 생성되었습니다.');
			}else if(list[i].info_Type=='gp_Work'){
				type='일감 ';
				toastr.info(''+'<button type="button" class="btn clear" onclick="alert('+"'이동 주소를 설정해 주세요.'"+');">Yes</button>',type+ list[i].info_Content+'(이)가 생성되었습니다.');
			}
			
		}else if((list[i].command_Check!=null&&list[i].command_Check!='')&&(list[i].info_Content==null||list[i].info_Content=='')){
			//DELETE
			toastr.options.onclick=null;
			toastr.error('', type+list[i].command_Check+'(이)가 삭제되었습니다.');
		}else{
			//UPDATE
			//JSON.stringify(list[i])
			toastr.success('', type+list[i].info_Content+'(이)가 수정되었습니다.');
		}
		showNotice(list[i]);
	}
}
function goProjectMain(prj_Num){
	alert('이동합니다.');
	location.href = "../project/sendNum?prj_Num="+prj_Num;
}
