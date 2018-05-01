<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>BLUE MINE</title>

     <!-- Bootstrap Core CSS -->
    <link href="../resources/templet/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../resources/templet/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../resources/templet/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../resources/templet/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- Chat.CSS -->
    <link href="../resources/css/chat.css" rel="stylesheet">
    <link href="../resources/css/userlist.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	<!-- modified CSS -->
	<link href="../resources/css/basic.css" rel="stylesheet">
	<!-- JS -->
	<script type="text/javascript" src="../resources/js/jquery-3.2.1.min.js"></script>
	<script src="http://code.jquery.com/jquery-2.1.0-rc1.min.js"></script>
	<script src="../resources/js/chat.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		
		$('.companyInfo').click(menuPage);
		
	});
	function menuPage(){
		var menuPage = $(this).attr('value');
		location.href = menuPage;
	}
	</script>
</head>

<body>

<div class="chat_box">
	<div class="chat_head">CurrentUsers</div>
	<div class="chat_body">
		<c:forEach var="login" items="${loginUserList}" varStatus="log">
			<div class="user">
				<a id="check${log.index }" style="text-decoration:none" >${login.name }</a> <br>
				<input type="hidden" value="${login.name }">
			</div>
		</c:forEach>
	</div>
</div>
 <div class="msg_box" style="right: 300px">
	<div class="msg_head">${loginName}
		<div class="close">x</div>	
	</div>
	<div class="msg_weap">
		<div class="msg_body">
			<div class="msg_insert"></div>
		</div>
		
		<div class="msg_footer">
			<div class="input-group">
				<input id="btn-minichat" type="text" class="form-control input-sm" placeholder="Type your message here..."/>
					<span class="input-group-btn">
						<button class="btn btn-warning btn-sm" id="btn-chat">
						Send
						</button>
					</span>
			</div>
		</div>
		<!-- msg_footer -->
	</div> 
	<!-- msg_weap -->
</div>
    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="../goToMain">BLUE MINE</a>
				<a class="companyInfo" value="../about">About</a>
				<a class="companyInfo" value="../contact">Contact Us</a>
				<a class="companyInfo" value="../help">Help</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-tasks">
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 1</strong>
                                        <span class="pull-right text-muted">40% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 2</strong>
                                        <span class="pull-right text-muted">20% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                            <span class="sr-only">20% Complete</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 3</strong>
                                        <span class="pull-right text-muted">60% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 4</strong>
                                        <span class="pull-right text-muted">80% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% Complete (danger)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Tasks</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-tasks -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="profileImg">
                      <img src="../showProfile" width="50px">
					  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="../profilePage"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="../logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="../goToMain"><i class="fa fa-desktop fa-fw"></i> Main Page</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-paper-plane-o fa-fw"></i> Timeline<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">My Timeline</a>
                                </li>
                                <li>
                                    <a href="#">Company Timeline</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                        	<a href="#"><i class="fa fa-edit fa-fw"></i> Board</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-paste fa-fw"></i> Progress<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">My tasks</a>
                                </li>
                                <li>
                                    <a href="#">Project</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                        	<a href="#"><i class="fa fa-calendar fa-fw"></i>Work Schedule</a>
                        <li>
                            <a href="#"><i class="fa fa-comments fa-fw"></i> Chats</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
        <div id="page-wrapper">
        	<div class="chat-panel panel panel-default pull-right" style="width: 1100px;">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> Chat
			</div>
			<!--로그인 아이디 정보 넘겨주기~-->
			<input type="hidden" value=${loginName } id='chat_id' />
			<!-- /.panel-heading -->
			<div class="panel-body">
			<ul class="chat">
				<!--내 채팅 메시지-->
				<li class="left clearfix">
					<span class="chat-img pull-left">
						<img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle" />
					</span>
					<div class="chat-body clearfix">
						<!--메시지 내용 출력-->
						<!-- <div class="from-me">
						   <div id="messageWindow"></div>
						</div>
						
						<div class="clear">
						</div>  -->
						<div class="header">
							${loginName }<br>
							<strong class="primary-font" id="messageWindow"></strong>
						</div>
					</div>
				</li>
			</ul>
		</div>
		
		<!-- /.panel-body -->
		<div class="panel-footer">
			<div class="input-group">
			<!--메시지 입력 창-->
				<input id="inputMessage" type="text" style="z-index: 0;" class="form-control input-sm" placeholder="Type your message here..." onkeyup="enterkey();"/>
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
	</div>
</div>
        <!-- /#page-wrapper -->

    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../resources/templet/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../resources/templet/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../resources/templet/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../resources/templet/vendor/raphael/raphael.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../resources/templet/dist/js/sb-admin-2.js"></script>

</body>
<script type="text/javascript">
var textarea = document.getElementById("messageWindow");
var webSocket = new WebSocket('ws://10.10.12.18:8888/www/broadcasting');
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
		if (content.match("!")) {
			$("#messageWindow").html($("#messageWindow").html()
				 + sender + " : " + content + "<br>");
            } else {
                $("#messageWindow").html($("#messageWindow").html()
                    + "<p class='msg_b'>" + sender + " : " + content + "<br>");
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
            + "<p class='msg_a'>나 : " + inputMessage.value + "</p>");
    }
    
    /* 메시지 보낼 때 형식 */
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
// 채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
	window.setInterval(function() {

    var elem = document.getElementById('messageWindow');
	elem.scrollTop = elem.scrollHeight;
}, 0);
</script>
    
</html>