<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Testing websockets</title>

    <!-- Bootstrap Core CSS -->
    <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../resources/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--로그인 아이디 정보-->
<input type="hidden" value=${loginId } id='chat_id' />
	<!-- /.panel -->
	<div class="chat-panel panel panel-default">
		<div class="panel-heading">
			<i class="fa fa-comments fa-fw"></i> Chat
		</div>
		<!-- /.panel-heading -->
		<div class="panel-body">
		<ul class="chat">
		<c:choose>
			<c:when test="${loginId == loginId}">
			<!--내 채팅 메시지-->
			<li class="left clearfix">
				<span class="chat-img pull-left">
					<img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle" />
				</span>
				<div class="chat-body clearfix">
					<div class="header">
						<strong class="primary-font">${loginId }</strong>
							<small class="pull-right text-muted">
								<i class="fa fa-clock-o fa-fw"></i> 12 mins ago
							</small>
					</div>
					<!--메시지 내용 출력-->
					<div id="messageWindow"></div>
				</div>
			</li>
			</c:when>
			<c:otherwise>
			<!--상대방 채팅 메시지-->
			<li class="right clearfix">
				<span class="chat-img pull-right">
					<img src="http://placehold.it/50/FA6F57/fff" alt="User Avatar" class="img-circle" />
				</span>
				<div class="chat-body clearfix">
					<div class="header">
						<small class=" text-muted">
							<i class="fa fa-clock-o fa-fw"></i> 13 mins ago</small>
								<strong class="pull-right primary-font">${loginId }</strong>
					</div>
					<!--메시지 내용 출력-->
					<div id="messageWindow"></div>
				</div>
			</li>
			</c:otherwise>
			</c:choose>
		</ul>
	</div>
		
	<!-- /.panel-body -->
	<div class="panel-footer">
		<div class="input-group">
		<!--메시지 입력 창-->
			<input id="inputMessage" type="text" class="form-control input-sm" placeholder="Type your message here..." onkeyup="enterkey()"/>
				<span class="input-group-btn">
					<button class="btn btn-warning btn-sm" id="btn-chat" onclick="send()">
					Send
					</button>
				</span>
			</div>
		</div>
		<!-- /.panel-footer -->
	</div>
	<!-- /.panel .chat-panel -->
</body>
<script type="text/javascript">
    var textarea = document.getElementById("messageWindow");
    var webSocket = new WebSocket('ws://localhost:8888/www/broadcasting');
    var inputMessage = document.getElementById('inputMessage');
    webSocket.onerror = function(event) {
        onError(event)
    };
    webSocket.onopen = function(event) {
        onOpen(event)
    };
    webSocket.onmessage = function(event) {
        onMessage(event)
    };
    function onMessage(event) {
        var message = event.data.split("|");
        var sender = message[0];
        var content = message[1];
        if (content == "") {
            
        } else {
            if (content.match("/")) {
                if (content.match(("/" + $("#chat_id").val()))) {
                    var temp = content.replace("/" + $("#chat_id").val(), "(귓속말) :").split(":");
                    if (temp[1].trim() == "") {
                    } else {
                        $("#messageWindow").html($("#messageWindow").html()
                            + sender + content.replace("/" + $("#chat_id").val(), "(귓속말) :") + "<br>");
                    }
                } else {
                }
            } else {
                if (content.match("!")) {
                    $("#messageWindow").html($("#messageWindow").html()
                        + sender + " : " + content + "<br>");
                } else {
                    $("#messageWindow").html($("#messageWindow").html()
                        + sender + " : " + content + "<br>");
                }
            }
        }
    }
    function onOpen(event) {
        $("#messageWindow").html("채팅에 참여하였습니다."+"<br>");
    }
    function onError(event) {
        alert(event.data);
    }
    function send() {
        if (inputMessage.value == "") {
        } else {
            $("#messageWindow").html($("#messageWindow").html()
                + "<p class='chat_content'>나 : " + inputMessage.value + "</p>");
        }
        /* 상대방에게 보여지는 메시지 */
        webSocket.send($("#chat_id").val() + "|" + inputMessage.value);
        inputMessage.value = "";
    }
    
    // 엔터키를 통해 send함
    // 아스키 코드 13은 Enterkey
    function enterkey() {
        if (window.event.keyCode == 13) {
            send();
        }
    }
    //     채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
 	window.setInterval(function() {
        var elem = document.getElementById('messageWindow');
        elem.scrollTop = elem.scrollHeight;
    }, 0);
</script>
    <!-- jQuery -->
    <script src="../resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../resources/vendor/raphael/raphael.min.js"></script>
    <script src="../resources/vendor/morrisjs/morris.min.js"></script>
    <script src="../resources/data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../resources/dist/js/sb-admin-2.js"></script>
</html>