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
			alert('서버 오류');
		}
	})
}
function updateUser(){
	var name = $('#name').val();
	var password = $('#password').val();
	var passwordC = $('#passwordC').val();
	if (name == "") {
		alert("이름을 입력해 주세요.");
		return false;
	}
	if (password == "") {
		alert('패스워드를 입력해 주세요.');
		return false;
	}
	if (password != passwordC) {
		alert('비밀번호가 맞지 않습니다.');
		return false;
	}
	var updateUser = $('form[name=updateProfile]').serialize();
	$.ajax({
		url : 'updateUser',
		type : 'post',
		data : updateUser,
		success : function(result){
			if (result == "ok") {
				alert('회원정보가 수정되었습니다.');
				location.href = "goToMain";
			} else {
				alert('회원정보 수정에 실패하였습니다.');
			}
		},
		error : function(){
			alert('서버 오류');
		}
	})
	return false;
}
function leaveForm(){
	if (confirm('정말 탈퇴하시겠습니까?')) {
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
				alert('탈퇴되었습니다.');
				location.href = "./";
			} else {
				alert('비밀번호가 맞지 않습니다.');
			}
		},
		error : function(){
			alert('서버 오류');
		}
	});
}