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
	nList.push(list);
	
	var str ='';
	if(nList==null||nList.length==0){
		return ;
	}else{
		$('#bell').css("color", "red");
		$('#noticeCheck').css("border", "1px solid black");
		$('#noticeCheck').css("border-radius", "8px");
	}
	if(nList.length>7){
		nList.pop();
	}
	
	
	$('#notificationList').html('');
	for(var i=0;i<nList.length;i++){
		$.ajax({
			url : pass+'project/dateinfo',
			tpue : 'get',
			data : {t:nList[i].update_Date},
			dataType : 'JSON',
			async : false,
			success : function(l) {
				if (l == null) {
					return;
				}
				nList[i].update_Date=l.update_Date;
				
				
			},
			error : function(error) {
				console.info('日付計算ミス' + error.status);
			}
		}
		);
		var type='';
		var message='';
		var link='';
		var icon = 'fa fa-exclamation-circle';
		var date = nList[i].update_Date+'';
		var splitArray = date.split('!@#');
		if(nList[i].info_Type=='prjList'){
			type='プロジェクト[';
			link = ' onclick="goNotificationPage('+nList[i].info_Num+','+"'"+nList[i].info_Type+"'"+')"';
			
		}else if(nList[i].info_Type=='gp_Work'){
			type='プロジェクト['+splitArray[2]+']のグループ['+splitArray[3]+']に仕事[';
			link = ' onclick="goNotificationPage('+splitArray[4]+','+"'"+nList[i].info_Type+"'"+')"';
	
		}
		if((nList[i].command_Check==null||nList[i].command_Check=='')&&(nList[i].info_Content!=null&&nList[i].info_Content!='')){
			//INSERT
			color='rgba(0,0,255,0.6)';
			
			 message=nList[i].info_Content+']が生成されました。';
			
		}else if((nList[i].command_Check!=null&&nList[i].command_Check!='')&&(nList[i].info_Content==null||nList[i].info_Content=='')){
			//DELETE
			color='rgba(255,0,0,0.6)';
			 message=nList[i].command_Check+']が削除されました。';
			 link='';
		}else{
			//UPDATE
			color='rgba(0,255,0,0.6)';
			icon='fa fa-wrench';
			 message=nList[i].info_Content+']が修正されました。';
		}
		
		
		
	
	str='';
	str+='<li ><a href="#" '+link+' style="background-color:'+color+';border: 1px solid '+color+'; border-radius: 8px; color:#333333;"><div><i class="'+icon+'"></i>'+type+message+ '<span';
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
		url = pass+"task/taskMain?prj_Num="+info_Num;
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