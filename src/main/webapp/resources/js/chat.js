/**
 * 
 */
$(document).ready(function(){
	
	$('.chat_body').hide();
	
	$('.msg_box').hide();
	
	$('.chat_head').click(function(){
		$('.chat_body').slideToggle('slow');
	});
	
	$('.msg_head').click(function(){
		$('.msg_weap').slideToggle('slow');
	});
	
	$('.close').click(function(){
		$('.msg_box').hide();
	});
	
	$('.user').click(function(index){
		/*var check = document.getElementById("check"+index);
		alert(check);
		
		var msg = $('#check').val();
		alert(msg);
		$('loginName1').val($('#text1').val());*/
		$('.msg_weap').show();
		$('.msg_box').show();
	});
	
	$('#btn-minichat').keypress(function(e){
		
		if(e.keyCode == 13) {
			var msg = $(this).val();
			if(msg != ""){
				$(this).val("");
				$("<div class='msg_b'>"+ msg +"</div>").insertBefore('.msg_insert');
				$('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);
			}
		}
	});
	
	$('#inputMessage').click(function(){
		$('.chat_body').hide();
		$('.msg_box').hide();
	});
	
});