/**
 * 
 */
$(document).ready(function(){
	$('.companyInfo').click(menuPage);
	var getDep = $('#getDep').val();
	$('#department').val(getDep);
	var getPos = $('#getPos').val();
	$('#position').val(getPos);
	$('#updateUser').click(updateUser);
});
function menuPage(){
	var menuPage = $(this).attr('value');
	location.href = menuPage;
}
function pfUpload(){
	var values = $('#uploadPf').val();
	var formData = new FormData();
	formData.append("file",$('#uploadPf')[0].files[0]);
	$.ajax({
		url : 'pfUpload',
		type : 'post',
		data : formData,
		processData : false,
		contentType : false,
		dataType : "text",
		success : function(fullpath){
			window.location.reload();
		},
		error : function(){
			//alert('서버 오류');
		}
	})
}
function updateUser(){
	var name = $('#name').val();
	var password = $('#password').val();
	var passwordC = $('#passwordC').val();
	if (name == "") {
		alert("名前を入力してください。");
		return false;
	}
	if (password == "") {
		alert('パスワードを入力してください。');
		return false;
	}
	if (password != passwordC) {
		alert('パスワードが一致しません。');
		return false;
	}
	var updateUser = $('form[name=updateProfile]').serialize();
	$.ajax({
		url : 'updateUser',
		type : 'post',
		data : updateUser,
		success : function(result){
			if (result == "ok") {
				alert('会員情報が修正されました。');
				location.href = "goToMain";
			} else {
				alert('修正に失敗しました。');
			}
		},
		error : function(){
			//alert('서버 오류');
		}
	})
	return false;
}
function leaveForm(){
	if (confirm('本当に退会しますか?')) {
		$('.passwordCheck').fadeIn(1000);
		$('#leavePassword').focus();
	}
}
function cancelLeave(){
	$('.passwordCheck').fadeOut(1000);
	$('#leavePassword').val('');
}
function leaveMember(){
	var password = $('#leavePassword').val();
	$.ajax({
		url : 'leave',
		type : 'post',
		data : {password : password},
		success : function(result){
			if (result == "ok") {
				alert('退会しました。');
				location.href = "./";
			} else {
				alert('パスワードが違います。');
			}
		},
		error : function(){
			//alert('서버 오류');
		}
	});
}