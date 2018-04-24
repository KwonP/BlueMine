/**
 * 
 */
var w;
function workerStart(){
	if(typeof(Worker)!='nudefined'){
		if(typeof(w)=='nudefined'){
			w = new Worker('worker.js');
		}
		w.onmessage = function(response){
			alert("postmessage동작" + response);
		}
	}else{
		alert("웹 워커를 사용할 수 없습니다.");
	}
}