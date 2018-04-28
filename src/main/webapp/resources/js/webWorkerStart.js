/**
 * 
 */

	
function workerStart(loginId){
	var w;
	alert('workerStart!');
	if(typeof(Worker)!='nudefined'){
		console.log('Webwork가 정의된 상태(webworker 사용가능 브라우저)');
		if(typeof w=='undefined'){
			console.log('webwork 생성');
			w = new Worker('../resources/js/worker.js');
			w.postMessage(loginId);
		}
		w.addEventListener('message', function(e) {
			console.log('알림정보 가져옴'+e);
			alert("postmessage동작" + e);
		});
			
		
	}else{
		alert("웹 워커를 사용할 수 없습니다.");
	}
	function showNotice(list){
		var nList = new Array();
		nList = list;
		var str ='';
		if(nList==null||nList.length==0){
			return ;
		}
		$('#notificationList').html('');
		for(var i=0;i<nList.length;i++){
			var type='';
			var message='';
			if(nList[i].info_Type=='prjList'){
				type='프로젝트 ';
				toastr.info(''+'<button type="button" class="btn clear" onclick="goProjectMain('+list[i].info_Num+')"><span style="color: black;">이동하기</span></button>',type+ list[i].info_Content+'(이)가 생성되었습니다.');
			}else if(nList[i].info_Type=='gp_Work'){
				type='일감 ';
				toastr.info(''+'<button type="button" class="btn clear" onclick="alert('+"'이동 주소를 설정해 주세요.'"+');">Yes</button>',type+ list[i].info_Content+'(이)가 생성되었습니다.');
			}
			if(nList[i].command_Check==null&&nList[i].info_Content!=null){
				//INSERT
				
				 message=nList[i].info_Content+'이(가) 생성되었습니다.';
				
			}else if(nList[i].command_Check!=null&&nList[i].info_Content==null){
				//DELETE
				 message=nList[i].command_Check+'이(가) 삭제되었습니다.';
			}else{
				//UPDATE
				 message=nList[i].info_Content+'이(가) 수정되었습니다.';
			}
			
		var date = nList[i].update_Date+'';
		var splitArray = date.split('***');
		str='';
		str+='<li><a href="#"><div><i class="fa fa-comment fa-fw"></i>'+type+message+ '<span';
		str+='class="pull-right text-muted small">'+splitArray[1]+'</span></div>';
		str+='</a></li><li class="divider"></li>';
		$('#notificationList').append(str);
		}
		
		
	}
}

