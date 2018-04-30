/**
 * 
 */

var nList = new Array();
function showNotice(list){
	
	nList.push(list);
	
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
		if(nList[i].info_Type=='prjList'){
			type='프로젝트 ';
			link = ' onclick="goNotificationPage('+nList[i].info_Num+','+"'"+nList[i].info_Type+"'"+')"';
			
		}else if(nList[i].info_Type=='gp_Work'){
			type='일감 ';
			link = ' onclick=""';
	
		}
		if((nList[i].command_Check==null||nList[i].command_Check=='')&&(nList[i].info_Content!=null&&nList[i].info_Content!='')){
			//INSERT
			
			 message=nList[i].info_Content+'이(가) 생성되었습니다.';
			
		}else if((nList[i].command_Check!=null&&nList[i].command_Check!='')&&(nList[i].info_Content==null||nList[i].info_Content=='')){
			//DELETE
			 message=nList[i].command_Check+'이(가) 삭제되었습니다.';
			 link='';
		}else{
			//UPDATE
			 message=nList[i].info_Content+'이(가) 수정되었습니다.';
		}
		
		
		
	var date = nList[i].update_Date+'';
	var splitArray = date.split('***');
	str='';
	str+='<li><a href="#" '+link+'><div><i class="fa fa-exclamation-circle"></i>'+type+message+ '<span';
	str+='class="pull-right text-muted small"><br>'+splitArray[1]+'</span></div>';
	str+='</a></li><li class="divider"></li>';
	$('#notificationList').append(str);
	}
	
	
}

function goNotificationPage(info_Num,info_Type){
	var url ='';
	if(info_Type=='rprjList'){
		url = "../project/sendNum?prj_Num="+prj_Num;
	}else if(info_Type=='gp_Work'){
		url = "";
	}
	var length = nList.length;
	for(var i=length-1;i>=0;i--){
		if(nList[i].info_Num==info_Num&&nList[i].info_Type==info_Type){
		nList.splice(i, 1);
		alert(JSON.stringify(nList));
		}
	}
	sessionStorage.setItem("nList", nList);
	location.href = url;
	
	
	
}