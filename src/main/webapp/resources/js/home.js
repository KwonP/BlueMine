/**
 * 
 */
$(document).ready(function() {
    $('h1').css({top: '30px',marginTop: '0px' ,opacity: 0}).
    animate({top: '50%', marginTop: '-255px',opacity: 1}, 1500);
    $('.selection').css({top: '250px',opacity: 0}).
    animate({top: '50%',marginTop: '-100px',opacity: 1}, 1500);
  });
// selection 창으로 이동
function moveL(){
	$('.loginFormDiv').animate({left : '130%', opacity : 0 }, 1000);
	$('.selection').animate({left : '50%', opacity : 1}, 1000);
}
// 로그인 창으로 이동
function moveR(){
	$('.selection').animate({left : '-30%', opacity : 0}, 1000, function(){ $('#LoginEmail').focus()});
	$('.loginFormDiv').css('left','130%').animate({left : '50%', opacity : 1}, 1000);
}
// 회원가입 팝업 띄워주기
function popup(){
	$('#joinPopup').slideDown('fast');
	$('#popupBack').fadeIn(300);
}
// 팝업 종료
function popupClose(){
	if (confirm('Are you sure to quit joining?')) {
		$('#joinPopup').slideUp('fast');
		$('#popupBack').fadeOut(300);
	}
}
// 메일 중복체크
function mailCheck(){
	var email = $('#emailC').val();
	if (email == "") {
		alert('메일을 입력해 주세요.');
		return;
	}
	
	/* 이메일 유효성 검사를 위한 정규식 */
	var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if (!regExp.test(email)) {
		alert("이메일 형식이 맞지 않습니다.");
		return;
	}
	
	$.ajax({
		url : 'checkEmail',
		type : 'post',
		data : {email : email},
		success : function(result){
			if (result == 'available') {
				alert('사용 가능한 이메일 입니다.');
				$('#email').attr('value',$('#emailC').val());
				$('.sendForm').fadeIn(1000);
				$('#again').attr('value',true);
			} else {
				alert('이미 사용중인 이메일 입니다.');
			}
		},
		error : function(){
			alert('서버 ㅇ류');
		}
	});

}
/* 인증코드 발송 */
var timer;		/*clearInterval을 위한 전역변수 선언*/
function sendCode(){
	var check = $('#again').val();
	if (check == 'false') {
		alert('이메일을 다시 확인해 주세요');
		return;
	}
	var email = $('#emailC').val();
	alert('잠시만 기다려 주세요.');
	$.ajax({
		url : 'sendCode',
		type : 'post',
		data : {email : email},
		success : getCode,
		error : function(){
			alert('서버 오류');
		}
	});
}
// 인증번호 발송
function getCode(code){

	$('#code').attr('value',code);
	alert('인증번호가 발송되었습니다.');
		
	var showTime = document.getElementById('showTime');
	timer = setInterval(codeTimer,1000);
	var count = 0 ;
	var setTime = 200;
	function codeTimer(){
		count = 1;
		min = Math.floor(setTime / 60);
		sec = setTime - ( 60 * min);
		var limitTime = min + " ： " + sec;
		showTime.innerHTML = limitTime;
		setTime--;
		if(setTime < 0 ){
			clearInterval(timer);
			alert('인증 시간이 지났습니다. 다시 시도해 주세요');
			$('#again').attr('value','again');
		}
	}
}
// 인증번호 확인
function checkCode(){
	var check = $('#again').val();
	if (check == 'false') {
		alert('이메일을 다시 확인해 주세요');
		return;
	}
	if ($('#code').val() == '') {
		alert('인증번호를 발송해 주세요');
		return;
	}
	if (check == 'again') {
		alert('인증 시간이 지났습니다. 다시 시도해 주세요');
		return;
	}
	if ($('#inputCode').val() != $('#code').val()) {
		alert('인증번호가 맞지 않습니다.');
		return;
	}
	clearInterval(timer);
	$('.step1').fadeOut(1000);
	$('.joinFormDiv').fadeIn(1000);
}
// 이메일 건드리면 다시 확인하게 하기
function checkAgain(){
	$('#again').attr('value',false);
}
// 인증절차 뒤 보여지는 회원가입 다음 절차
function another(){
	$('.step1').fadeIn(1000);
	$('.joinFormDiv').fadeOut(1000);
	$('#code').removeAttr('value');
}
// 로그인
function login(){
	var email = document.getElementById('LoginEmail').value;
	var password = document.getElementById('passwordL').value;
	if (email == "") {
		alert('이메일을 입력해 주세요.');
		return;
		}
	if (password == "") {
		alert('비밀번호를 입력해 주세요');
		return;
		}
	
	$.ajax({
		url : 'login',
		type : 'post',
		data : {email : email, password : password},
		success : function(result){
			if (result == 'login') {
				location.href = 'goToMain';
			} else {
				alert('비밀번호나 이메일이 맞지 않습니다');
			}
		},
		error : function(){
			alert('서버 오류');
		}
	});
}
