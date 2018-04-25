<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<link href="../resources/templet/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../resources/templet/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="../resources/templet/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="../resources/templet/vendor/morrisjs/morris.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="../resources/templet/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- modified CSS -->
<link href="../resources/css/timeline.css" rel="stylesheet">
<!-- JS -->
<script type="text/javascript" src="../resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../resources/js/timeline.js"></script>
<%--알림 js 
	<script src="../resources/toastr/toastr.min.js"></script>
	<link href="../resources/toastr/toastr.css" rel="stylesheet">
	<script src="../resources/js/webWorkerStart.js"></script>
	<script src="../resources/js/worker.js"></script>--%>
</head>

<body>

	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">BLUE MINE</a> <a
					class="companyInfo" value="about">About</a> <a class="companyInfo"
					value="contact">Contact Us</a> <a class="companyInfo" value="help">Help</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i
						class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-messages">
						<li><a href="#">
								<div>
									<strong>John Smith</strong> <span class="pull-right text-muted">
										<em>Yesterday</em>
									</span>
								</div>
								<div>Lorem ipsum dolor sit amet, consectetur adipiscing
									elit. Pellentesque eleifend...</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<strong>John Smith</strong> <span class="pull-right text-muted">
										<em>Yesterday</em>
									</span>
								</div>
								<div>Lorem ipsum dolor sit amet, consectetur adipiscing
									elit. Pellentesque eleifend...</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<strong>John Smith</strong> <span class="pull-right text-muted">
										<em>Yesterday</em>
									</span>
								</div>
								<div>Lorem ipsum dolor sit amet, consectetur adipiscing
									elit. Pellentesque eleifend...</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>Read
									All Messages</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-messages --></li>
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-tasks fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-tasks">
						<li><a href="#">
								<div>
									<p>
										<strong>Task 1</strong> <span class="pull-right text-muted">40%
											Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100" style="width: 40%">
											<span class="sr-only">40% Complete (success)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>Task 2</strong> <span class="pull-right text-muted">20%
											Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-info" role="progressbar"
											aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
											style="width: 20%">
											<span class="sr-only">20% Complete</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>Task 3</strong> <span class="pull-right text-muted">60%
											Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-warning"
											role="progressbar" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100" style="width: 60%">
											<span class="sr-only">60% Complete (warning)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>Task 4</strong> <span class="pull-right text-muted">80%
											Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-danger"
											role="progressbar" aria-valuenow="80" aria-valuemin="0"
											aria-valuemax="100" style="width: 80%">
											<span class="sr-only">80% Complete (danger)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>See
									All Tasks</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-tasks --></li>
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-alerts">
						<li><a href="#">
								<div>
									<i class="fa fa-comment fa-fw"></i> New Comment <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-twitter fa-fw"></i> 3 New Followers <span
										class="pull-right text-muted small">12 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-envelope fa-fw"></i> Message Sent <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-tasks fa-fw"></i> New Task <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-upload fa-fw"></i> Server Rebooted <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>See
									All Alerts</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-alerts --></li>
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" id="profileImg"> <img
						src="../showProfile?id=${sessionScope.loginId}" width="50px">
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i> User
								Profile</a></li>
						<li class="divider"></li>
						<li><a href="../logout"><i class="fa fa-sign-out fa-fw"></i>
								Logout</a></li>
					</ul> <!-- /.dropdown-user --></li>
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
							</div> <!-- /input-group -->
						</li>
						<li><a href="../goToMain"><i class="fa fa-desktop fa-fw"></i>
								Main Page</a></li>
						<li><a href="#"><i class="fa fa-paper-plane-o fa-fw"></i>
								Timeline<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="#">My Timeline</a></li>
								<li><a href="#">Company Timeline</a></li>
							</ul> <!-- /.nav-second-level --></li>
						<li><a href="../data/filePrint?prjNum=${prjNum }"><i class="fa fa-edit fa-fw"></i> Data Download</a></li>
						<li><a href="#"><i class="fa fa-paste fa-fw"></i>
								Progress<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="#">My tasks</a></li>
								<li><a href="#">Project</a></li>
							</ul> <!-- /.nav-second-level --></li>
						<li><a href="#"><i class="fa fa-calendar fa-fw"></i>Work
								Schedule</a>
						<li><a href="#"><i class="fa fa-comments fa-fw"></i>
								Chats</a></li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>
		
		<div id="page-wrapper">
			<div id="timeLineDiv"></div>
			<input type="hidden" id="getPrjNum" value="${prjNum}"> <input
				type="hidden" id="getUserId" value="${loginId}"> <input
				type="hidden" id="getSession" value="${sessionScope.loginId }">
			<div id="userTest"></div>
			<div id="addTimeLineDiv">
				<div class="col-lg-3 col-md-6">
				<a href="#layer1" class="btn-example">
					<div class="panel panel-yellow">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-plus fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="timeLineFont">타임라인 추가<br>테스트용</div>
									<div></div>
								</div>
							</div>
						</div>
						 <span class="pull-left">ADD
								TIME LINE</span> <span class="pull-right"><i
								class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
					</div>
					</a>
				</div>
			</div>
			<!--<table><tr><td>-->
			<div id="selectTest">
				<dl id="selectKinds" class="dropdown">
					<dt>
						<a href="#"><span><i class="fa fa-columns"></i>전체 조회</span></a>
					</dt>
					<dd>
						<ul>
						<li><a href="#"><i class="fa fa-columns"></i>전체 조회<span class="value">0</span></a></li>
							<li><a href="#"><i class="fa fa-info-circle"></i>공지 조회<span class="value">1</span></a></li>
							<li><a href="#"><i class="fa fa-calendar-o"></i>작업 조회<span class="value">2</span></a></li>
						</ul>
					</dd>
				</dl>
				<span id="result"></span>
				
			</div>
			<!--  </td><td><select id="searchType"><option selected="selected" value="writer">작성자</option><option value="content">내용</option> </select> </td></tr></table>-->

		</div>


		<!-- /#page-wrapper -->

	</div>
	
	<div class="dim-layer">
		<div class="dimBg"></div>
		<div id="layer1" class="pop-layer">
			<div class="pop-container">
				<div class="pop-conts">
					<!--content //-->
					<table id="timeLineTable">
						<thead>
							<tr>
								<th>말머리</th>
								<td><select id="horseHead"><option value="1">공지사항</option>
										<option value="2">스케줄</option>
								</select></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${sessionScope.user.name}<input type="hidden"
									value="${loginId}" id="writer"></td>
							</tr>


						</thead>
						<tbody>
							<tr>
								<th>내용</th>
								<td><textarea id="timeLineContent" class="timeLineContent"
										rows="5" cols="60" placeholder="타임라인 내용"></textarea></td>
							</tr>
						</tbody>
						<tfoot><tr><td><input type="hidden" value="" id="TLNumber"> </td></tr></tfoot>
					</table>
					<p class="ctxt mb20"></p>

					<div class="btn-r">
						<a href="#" class="btn-add" id="btn-add">Add</a> <a href="#"
							class="btn-layerClose">Close</a>
					</div>
					<!--// content-->
				</div>
			</div>
		</div>
		
		
	</div>
	<div class="dim-layer2">
		<div class="dimBg"></div>
		<div id="layer2" class="pop-layer">
			<div class="pop-container">
				<div class="pop-conts">
					<!--content //-->
					<table id="timeLineTable">
						<thead>
							<tr>
								<th>말머리</th>
								<td><select id="horseHead"><option value="1">공지사항</option>
										<option value="2">스케줄</option>
								</select></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${sessionScope.user.name}<input type="hidden"
									value="${loginId}" id="writer"></td>
							</tr>


						</thead>
						<tbody>
							<tr>
								<th>내용</th>
								<td><textarea id="timeLineContent" class="timeLineContent"
										rows="5" cols="60" placeholder="타임라인 내용"></textarea></td>
							</tr>
						</tbody>
						<tfoot><tr><td><input type="hidden" id="TLNumber" value=""> </td></tr></tfoot>
					</table>
					<p class="ctxt mb20"></p>

					<div class="btn-r">
						<a href="#" class="btn-add" id="btn-add">Add</a> <a href="#"
							class="btn-layerClose">Close</a>
					</div>
					<!--// content-->
				</div>
			</div>
		</div>
		
		
	</div>
	
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
	
	

	<script type="text/javascript">
	$(document).ready(function() {
        /* $(".dropdown img.flag").addClass("flagvisibility");*/
	    	$('.btn-example').click(function(){
				$('#timeLineContent').val('');
		        var $href = $(this).attr('href');
		        $('#btn-add').off('click');
		        $('#btn-add').on('click',insertTimeLine);
		        $('#btn-add').text('Add');
		        layer_popup($href);
		    });
	    	$('#btn-add').on('click',insertTimeLine);
	    	$('#tlDelete').on('click',);
	    	workerStart(${loginId});
     });
	function workerStart(){
		var w;
		console.log('webwork실행');
		if(typeof(Worker)!='nudefined'){
			console.log('Webwork가 정의된 상태(webworker 사용가능 브라우저)');
			if(typeof(w)=='nudefined'){
				console.log('webwork 생성');
				w = new Worker('worker.js');
			}
			w.onmessage = function(response){
				console.log('알림정보 가져옴');
				alert("postmessage동작" + response);
			};
		}else{
			alert("웹 워커를 사용할 수 없습니다.");
		}
	}
	
	function updateStep($href,tl_Num){
        $('#timeLineContent').val($('#tlText'+tl_Num).text());
        $('#TLNumber').val(tl_Num);
        $('#btn-add').off('click');
        $('#btn-add').on('click',updateTL);
        $('#btn-add').text('Update');
        layer_popup($href);
    }
	function deleteStep(tl_Num){
        if(confirm('정말로 지우시겠습니까?')==true){
        	deleteTimeLine(tl_Num);
        }
    }
	
		
	    function layer_popup(el){

	        var $el = $(el);        //레이어의 id를 $el 변수에 저장
	        var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

	        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

	        var $elWidth = ~~($el.outerWidth()),
	            $elHeight = ~~($el.outerHeight()),
	            docWidth = $(document).width(),
	            docHeight = $(document).height();

	        // 화면의 중앙에 레이어를 띄운다.
	        if ($elHeight < docHeight || $elWidth < docWidth) {
	            $el.css({
	                marginTop: -$elHeight /2,
	                marginLeft: -$elWidth/2
	            })
	        } else {
	            $el.css({top: 0, left: 0});
	        }

	        $el.find('a.btn-layerClose').click(function(){
	            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
	            return false;
	        });

	        $('.layer .dimBg').click(function(){
	            $('.dim-layer').fadeOut();
	            return false;
	        });
	        
	        $(".timeLineContent").focusin(function() {
	        	$('.timeLineContent').addClass("selectArea"); 
	        });
	        $(".timeLineContent").focusout(function() {
	        	$('.timeLineContent').removeClass("selectArea"); 
	        });
	      

	    }
	    
		</script>
</body>

</html>