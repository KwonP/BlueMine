/**
 * 
 */
$(document).ready(function() {
    $('h1').css({top: '30px',marginTop: '0px' ,opacity: 0}).
    animate({top: '50%', marginTop: '-255px',opacity: 1}, 1500);
    $('.selection').css({top: '250px',opacity: 0}).
    animate({top: '50%',marginTop: '-100px',opacity: 1}, 1500);
  });

var timer;		/*clearInterval을 위한 전역변수 선언*/
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
		var showTime = document.getElementById('showTime');
		$('#joinPopup').slideUp('fast');
		$('#popupBack').fadeOut(300);
		$('.step1').fadeIn(1000);
		$('.joinFormDiv').fadeOut(1000);
		$('.sendForm').fadeOut(1000);
		$('#email').val('');
		$('#name').val('');
		$('#password').val('');
		$('#passwordC').val('');
		$('#emailC').val('');
		$('#code').val('');
		$('#inputCode').val('');
		clearInterval(timer);
		showTime.innerHTML = "";
	}
}
// 정보찾기 팝업
function findPopup(){
	$('#findDiv').slideDown('fast');
	$('#popupBack').fadeIn(300);
}
// 정보찾기 팝업 닫기
function findClose(){
	$('#findDiv').slideUp('fast');
	$('#popupBack').fadeOut(300);
	$('#findInfo').val('');
}
// password 메일로 송신
function sendInfo(){
	alert('잠시만 기다려 주세요.');
	var email = $('#findInfo').val();
	$.ajax({
		url : "sendInfo",
		type : 'post',
		data : {email : email},
		success : function(result){
			if (result == 'ok') {
				alert('비밀번호 전송이 완료되었습니다.');
			} else {
				alert('전송에 실패하였습니다. 다시 시도해 주세요.');
			}
		},
		error : function(){
			alert('서버 오류');
		}
	});
}

// 메일 중복체크(join) & 가입된 이메일 확인(find)
function mailCheck(value){
	if (value == 'find') {
		var findMail = $('#findInfo').val();
		if (findMail == '') {alert('메일을 입력해 주세요.');return;}
		$.ajax({
			url : 'findMail',
			type : 'post',
			data : {findMail : findMail},
			success : function(result){
				if (result == 'ok') {
					alert('일치하는 메일이 있습니다.');
					$('.sendInfo').fadeIn(300);
				} else {
					alert('일치하는 메일이 없습니다.');
				}
			},
			error : function(){
				alert('서버 오류');
			}
		});
		return;
	} 
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
// 다른 이메일 선택하기
function another(){
	$('.step1').fadeIn(1000);
	$('.joinFormDiv').fadeOut(1000);
	$('#code').removeAttr('value');
}
// 회원가입 실행
function joinUser(){
	var email = $('#email').val();
	var name = $('#name').val();
	var password = $('#password').val();
	var passwordC = $('#passwordC').val();
	var department = $('#department option:selected').text();
	var alias = $('#department option:selected').val();
	var position = $('#position option:selected').text();
	
	if (name == "") {
		alert('이름을 입력해 주세요.');
		return;
	}
	if (password == "") {
		alert('패스워드를 입력해 주세요.');
		return;
	}
	if (password != passwordC) {
		alert('패스워드가 맞지 않습니다.');
		return ;
	}

	$.ajax({
		url : 'join',
		type : 'post',
		data : {email:email, name:name, password:password, department:department,
				position:position,alias:alias},
		success : function(result){
			if (result == 'ok') {
				alert('가입이 완료되었습니다 !');
				location.href = "goToMain";
			}
		},
		error : function(){
			alert('서버 오류');
		}
	});
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
			} else if(result == 'not') {
				alert('존재하지 않는 이메일 입니다.');
			} else {
				alert('비밀번호가 맞지 않습니다.');
			}
		},
		error : function(){
			alert('서버 오류');
		}
	});
}
