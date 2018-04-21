/**
 * 
 */
var updateCheck = function(){
	checkNotifications()
	setTimeout('updateCheck()',3000);
};
updateCheck();

function checkNotifications(){
	$.ajax({
		url : 'checknotifications',
		tpue : 'get',
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
		postMessage(list[i]);
		//deleteNotifications(list[i].trigger_Num);
	}
}
function deleteNotifications(trigger_Num){
	$.ajax({
		url : 'deletenotifications',
		tpue : 'get',
		data : {trigger_Num : trigger_Num}
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