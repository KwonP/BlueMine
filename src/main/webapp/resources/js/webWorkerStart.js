/**
 * 
 */

	
function workerStart(loginId){
	var w;
	console.log('webwork실행');
	if(typeof(Worker)!='nudefined'){
		console.log('Webwork가 정의된 상태(webworker 사용가능 브라우저)');
		if(typeof(w)=='nudefined'){
			console.log('webwork 생성');
			w = new Worker('worker.js');
			w.postMessage(loginId);
		}
		w.onmessage = function(response){
			console.log('알림정보 가져옴');
			alert("postmessage동작" + response);
		};
	}else{
		alert("웹 워커를 사용할 수 없습니다.");
	}
}

