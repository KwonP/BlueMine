/**
 * 
 */
var pass ='../';
var nList = new Array();
var t=0;
var color ='#ffffff';
function showNotice(list,addPass){
	if(addPass!=null){
		pass= addPass;
	}
	nList.unshift(list);
	
	var str ='';
	if(nList==null||nList.length==0){
		return ;
	}else{
		$('#noticeCheck').css("background-color", "yellow");
		$('#noticeCheck').css("border", "1px solid black");
		$('#noticeCheck').css("border-radius", "8px");
	}
	if(nList.length>7){
		nList.pop();
	}
	$('#notificationList').html('');
	for(var i=0;i<nList.length;i++){
		var type='';
		var message='';
		var link='';
		var icon = 'fa fa-exclamation-circle';
		var date = nList[i].update_Date+'';
		var splitArray = date.split('***');
		if(nList[i].info_Type=='prjList'){
			type='프로젝트 ';
			link = ' onclick="goNotificationPage('+nList[i].info_Num+','+"'"+nList[i].info_Type+"'"+')"';
			
		}else if(nList[i].info_Type=='gp_Work'){
			type='프로젝트 '+splitArray[2]+' -그룹 '+splitArray[3]+'의 일감';
			link = ' onclick=""';
	
		}
		if((nList[i].command_Check==null||nList[i].command_Check=='')&&(nList[i].info_Content!=null&&nList[i].info_Content!='')){
			//INSERT
			color='rgba(0,0,255,0.6)';
			
			 message=nList[i].info_Content+'이(가) 생성되었습니다.';
			
		}else if((nList[i].command_Check!=null&&nList[i].command_Check!='')&&(nList[i].info_Content==null||nList[i].info_Content=='')){
			//DELETE
			color='rgba(255,0,0,0.6)';
			 message=nList[i].command_Check+'이(가) 삭제되었습니다.';
			 link='';
		}else{
			//UPDATE
			color='rgba(0,255,0,0.6)';
			icon='fa fa-wrench';
			 message=nList[i].info_Content+'이(가) 수정되었습니다.';
		}
		
		
		
	
	str='';
	str+='<li ><a href="#" '+link+' style="background-color:'+color+';border: 1px solid '+color+'; border-radius: 8px; color:#333333;><i class="'+icon+'"></i>'+type+message+t+ '<span';
	str+='class="pull-right text-muted small"><br>'+splitArray[1]+'</span></div>';
	str+='</a></li><li class="divider" style="background-color:rgba(255,255,255,0); "></li>';
	$('#notificationList').css('background-color','rgba(255,255,255,0)');
	$('#notificationList').css('border','none');
	$('#notificationList').append(str);
	}
	
	
}

function goNotificationPage(info_Num,info_Type){
	
	var url ='';
	if(info_Type=='prjList'){
		url = pass+"project/sendNum?prj_Num="+info_Num;
	}else if(info_Type=='gp_Work'){
		url = "";
	}
	var length = nList.length;
	for(var i=length-1;i>=0;i--){
		if(nList[i].info_Num==info_Num&&nList[i].info_Type==info_Type){
		nList.splice(i, 1);
		}
	}

	sessionStorage.setItem("nList", nList);
	location.href = url;
	
	
	
}