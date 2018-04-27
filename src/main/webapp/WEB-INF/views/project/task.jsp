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

<!-- Plus Button -->
<link href="../resources/css/style.css" rel="stylesheet">

<!-- Bootstrap Core CSS -->
<link href="../resources/templet/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../resources/templet/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="../resources/templet/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="../resources/templet/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="../resources/templet/dist/css/sb-admin-2.css"
	rel="stylesheet">
	
<!-- Custom Fonts -->
<link
	href="../resources/templet/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">


<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<style>
p {
	font-size: 24px;
}

.white_content {
	display: none;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 735px;
	height: 580px;
	padding: 16px;
	background-color: #dbdbdbe6;
	z-index: 1002;
	overflow: auto;
	margin-top: -419px;
	margin-left: -170px;
	border-radius: 15px;
	border: solid 5px #757373;
}

.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: #7c79798f;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 60);
}

select {
	text-align: center;
	text-align-last: center;
	width: 150px;
	height: 30px;
	/* webkit*/
}

option {
	text-align: center;
	/* reset to left*/
}

.noresize {
	/* 사용자 임의 변경 불가 */
	/* 사용자 변경이 모두 가능 */
	/* 좌우만 가능 */
	/* 상하만 가능 */
	resize: none;
	/* resize: both; 
  resize: horizontal; 
  resize: vertical; */
}

.btn span.glyphicon {
	opacity: 0;
}

.btn.active span.glyphicon {
	opacity: 1;
}
</style>

<script>
	function popup() {
		$('#joinPopup').slideDown('fast');
		$('#popupBack').fadeIn(300);

	}
	function popupClose() {
		if (confirm('Are you sure to quit joining?')) {
			$('#joinPopup').slideUp('fast');
			$('#popupBack').fadeOut(300);
		}
	}

	/* function makeTask() {
		var gs_Name = $('#gs_Name').val();
		var gs_Content = $('#gs_Content').val();
		var start_Date = $('#start_Date').val();
		var deadLine = $('#deadLine').val();
		var gp_Pri = $('#gp_Pri').val();
		var progress = $('#progress').val();
		var category = $('#category').val();
					
		$.ajax({
			url: '', // 컨트롤러 value
			type: 'POST', // 타입
			data: {
				gs_Name: gs_Name// 그룹 스케줄 이름
				, gp_Num: {} // 그룹 번호
				, gs_Content: gs_Content // 내용
				, director: {} // 담당자
				, start_Date: start_Date // 시작일
				, deadLine: deadLine // 마감일
				, gp_Pri: gp_Pri // 중요도
				, progress: progress // 진행도
				, category: category // 유형
			},
			dataType: 'json',
			success: function(reservedlist) { // 성공했을 때 어떤걸 할지?
				
			},
			error: function(cnt) {
				alert('에러');
			}				
		});	 
	} */

	/* function completeTask() {
	var gs_Name = $('#gs_Name').val();
	var gs_Content = $('#gs_Content').val();
	var start_Date = $('#start_Date').val();
	var deadLine = $('#deadLine').val();
	var gp_Pri = $('#gp_Pri').val();
	var progress = $('#progress').val();
	var category = $('#category').val();
				
	$.ajax({
		url: '', // 컨트롤러 value
		type: 'POST', // 타입
		data: {
			gs_Name: gs_Name// 그룹 스케줄 이름
			, gp_Num: {} // 그룹 번호
			, gs_Content: gs_Content // 내용
			, director: {} // 담당자
			, start_Date: start_Date // 시작일
			, deadLine: deadLine // 마감일
			, gp_Pri: gp_Pri // 중요도
			, progress: progress // 진행도
			, category: category // 유형
		},
		dataType: 'json',
		success: function(reservedlist) { // 성공했을 때 어떤걸 할지?
			
		},
		error: function(cnt) {
			alert('에러');
		}				
	});	 
	} */
	
	
	/* //새 메세지 추가
	function insertReply() {
		var btn-input = $('#btn-input').val();
					
		$.ajax({
			url: '', // 컨트롤러 value
			type: 'POST', // 타입
			data: {
				리플내용: btn-input
				, 프로젝트 번호 : ??
				, ...
				, ...
				
			},
			dataType: 'json',
			success: function(reservedlist) { // 성공했을 때 어떤걸 할지?
				
			},
			error: function(cnt) {
				alert('에러');
			}				
		});	 
	}	
	 */
	//글삭제시 확인 스크립트
	function deleteCheck(boardnum){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href = 'delete?boardnum=' + boardnum;
		}
	}

	//리플 쓰기 폼 체크
	function replyFormCheck() {
		var retext = document.getElementById('retext');
		if (retext.value.length < 5) {
			alert('리플 내용을 입력하세요.');
			retext.focus();
			retext.select();
			return false;
		}
		return true;			
	}

	//리플 수정
	function replyEditForm(replynum, boardnum, retext) {
		//해당 리플번호를 붙여 생성한 <div>태그에 접근
		var div = document.getElementById("div"+replynum);
		
		var str = '<form name="editForm' + replynum + '" action="replyEdit" method="post">';
		str += '<input type="hidden" name="replynum" value="'+replynum+'">';
		str += '<input type="hidden" name="boardnum" value="'+boardnum+'">';
		str += '&nbsp;';
		str += '<input type="text" name="text" value="' + retext + '" style="width:530px;">';
		str += '&nbsp;';
		str += '<a href="javascript:replyEdit(document.editForm' + replynum + ')">[저장]</a>';
		str += '&nbsp;';
		str += '<a href="javascript:replyEditCancle(document.getElementById(\'div' + replynum + '\'))">[취소]</a>';
		str += '</form>';
		div.innerHTML = str;
	}

	//리플 수정 취소
	function replyEditCancle(div) {
		div.innerHTML = '';
	}

	//리플 수정 정보 저장
	function replyEdit(form) {
		if (confirm('수정된 내용을 저장하시겠습니까?')) {
			form.submit();
		}
	}

	//리플 삭제
	function replyDelete(replynum, boardnum) {
		if (confirm('리플을 삭제하시겠습니까?')) {
			location.href='replyDelete?replynum=' + replynum + '&boardnum=' + boardnum;
		}
	}
</script>

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
						<li><a href="../data/??prjNum=${prjNum }"><i class="fa fa-paste fa-fw"></i>
								Task<span class="fa arrow"></span></a>
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

	<!-- 여기서부터 변경. -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Tables</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">Context Classes</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>Progress</th>
											<th>Task Number</th>
											<th>Category</th>
											<th>Director</th>
											<th>Start Date</th>
											<th>Deadline</th>
											<th>Priority</th>
										</tr>
									</thead>
									<tbody>
										<!-- 반복 시작 -->
										<c:if test="${loginId != null}">
											<c:forEach var="task" items="${gpworklist}">
												<tr class="info">
													<td>${task.progress}
														<div class="btn-group" data-toggle="buttons">
															<label class="btn btn-default"> <input
																type="checkbox" autocomplete="off"> <span
																class="glyphicon glyphicon-ok"></span>
															</label>
														</div>
													</td>
													<%-- <td><a href="read?boardnum=${board.boardnum}">${board.title}</a>
													</td> --%>
													<td>${task.gs_Num}</td>
													<td>${task.category}</td>
													<td>${task.start_Date}</td>
													<td>${task.deadLine}</td>
													<td>${task.gp_Pri}</td>
												</tr>
											</c:forEach>
										</c:if>
										<!-- 반복 끝 -->
										<%-- <a href="javascript:pagingFormSubmit(${counter})">${counter}</a>
										<c:if test="${counter == navi.currentPage}">
										</c:if> --%>


										<!-- 반복 시작 -->
										<c:forEach var="e" items="list">
											<tr class="success">
												<td>
													<div class="btn-group" data-toggle="buttons">
														<label class="btn btn-default"> <input
															type="checkbox" autocomplete="off"> <span
															class="glyphicon glyphicon-ok"></span>
														</label>
													</div>
												</td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
											</tr>
										</c:forEach>
										<!-- 반복 끝 -->
										<%-- <c:forEach var="e" items="list"> --%>
										<tr class="info">
											<td>
												<div class="btn-group" data-toggle="buttons">
													<label class="btn btn-default"> <input
														type="checkbox" autocomplete="off"> <span
														class="glyphicon glyphicon-ok"></span>
													</label>
												</div>
											</td>
											<td>2</td>
											<td>3</td>
											<td>4</td>
											<td>5</td>
										</tr>
										<%-- </c:forEach> --%>
										<tr>
											<td style="pointer-events: none;">
												<button class="btn btn-primary" onclick="completeTask()">저장</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
							<button class="btn fifth" style="width: 566px; height: 180px; font-size: 50px;"  onclick="popup()">+</button>

							<div id="joinPopup" class="white_content" style="width: 800px; height: 673px;">
								<div id="wrapper">
									<div class="row">
										<div class="col-lg-12">
											<h1 class="page-header">Forms</h1>
										</div>
										<!-- /.col-lg-12 -->
									</div>
									<!-- /.row -->

									<div class="row">
										<div class="col-lg-12">
											<div class="panel panel-default">
												<div class="panel-heading">Basic Form Elements</div>
												<div class="panel-body">
													<div class="row">
														<div class="col-lg-6">
															<form role="form">
																<div class="form-group">
																	<label>유형</label> <select class="form-control"
																		name="category" id="category">
																		<option value="issue">이슈</option>
																		<option value="bug">결함</option>
																		<option value="test">테스트케이스</option>
																		<option value="planning">설계</option>
																		<option value="develop">개발</option>
																		<option value="review">코드 리뷰</option>
																	</select>
																</div>

																<div class="form-group">
																	<label>제목</label> <input class="form-control"
																		name="gs_Name" id="gs_Name" placeholder="Title">
																</div>

																<div class="form-group">
																	<label>시작일</label>
																	<div class="bfh-datepicker" data-min="01/15/2013"
																		data-max="today" data-close="false">
																		<input type="date" class="form-control"
																			name="start_Date" id="start_Date" placeholder="Title">
																	</div>
																</div>

																<div class="form-group">
																	<label>마감일</label>
																	<div class="bfh-datepicker" data-min="today"
																		data-max="01/15/2020" data-close="false">
																		<input type="date" class="form-control"
																			name="deadLine" id="deadLine">
																	</div>
																</div>

																<div class="form-group">
																	<label>중요도</label> <select class="form-control"
																		name="gp_Pri" id="gp_Pri">
																		<option value="immediately">즉시</option>
																		<option value="urgency">긴급</option>
																		<option value="high">높음</option>
																		<option value="ordinary">보통</option>
																		<option value="low">낮음</option>
																	</select>
																</div>
															</form>
														</div>
														<!-- /.col-lg-6 (nested) -->
														<div class="col-lg-6">
															<form role="form">
																<div class="form-group">
																	<label>설명</label>
																	<textarea style="resize: none;" class="form-control"
																		name="gs_Content" id="gs_Content" rows="17"></textarea>
																</div>
																<button class="btn btn-primary" style="float: right;"
																	onclick="makeTask()">만들기</button>
															</form>
														</div>
														<!-- /.col-lg-6 (nested) -->
													</div>
													<!-- /.row (nested) -->
												</div>
												<!-- /.panel-body -->
											</div>
											<!-- /.panel -->
										</div>
										<!-- /.col-lg-12 -->
									</div>
									<!-- /.row -->
									<!--  </div> -->
									<!-- /#page-wrapper -->

								</div>
								<!-- /#wrapper -->
							</div>
							<div id="popupBack" class="black_overlay"></div>

						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-6 -->

				<div class="col-lg-4">
					<div class="chat-panel panel panel-default">
						<div class="panel-body">
							<ul class="chat">
							
							<c:if test="${list != null }">
								<c:forEach var="i" items="${list }">
									<li class="left clearfix">
									<span class="chat-img pull-left">
										<!-- 기본이미지 가지고오기 --> 
										<img width="500" height="300" src="${i.userId??} "/> 
										<img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle" />
									</span>
									
									<div class="chat-body clearfix">
										<div class="header">
											<strong class="primary-font">${i.userId }</strong> 
											<small class="pull-right text-muted">
												<i class="fa fa-clock-o fa-fw"></i> 12 mins ago
											</small>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit. Curabitur bibendum ornare dolor, quis ullamcorper
											ligula sodales.</p>
									</div>
									</li>
								</c:forEach>
							</c:if>
								
								<%-- <c:forEach var="reply" items="${oolist}">
									<li class="left clearfix"><span class="chat-img pull-left">
										<!-- 기본이미지 가지고오기 --> 
										<img width="500" height="300" src="imageShow/${board.num}.do"/> 
										<img
										src="http://placehold.it/50/55C1E7/fff" alt="User Avatar"
										class="img-circle" />
								</span>
									<div class="chat-body clearfix">
										<div class="header">
											<strong class="primary-font">Jack Sparrow</strong> <small
												class="pull-right text-muted"> <i
												class="fa fa-clock-o fa-fw"></i> 12 mins ago
											</small>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit. Curabitur bibendum ornare dolor, quis ullamcorper
											ligula sodales.</p>
									</div></li>
									
								</c:forEach> --%>
								
								<%-- <c:forEach var="reply" items="${oo2list}">
								<li class="right clearfix">
									<span
										class="chat-img pull-right"> 
										<img
											src="http://placehold.it/50/FA6F57/fff" alt="User Avatar"
										class="img-circle" />
									</span>
									<div class="chat-body clearfix">
										<div class="header">
											<small class=" text-muted"> <i
												class="fa fa-clock-o fa-fw"></i> 13 mins ago
											</small> <strong class="pull-right primary-font">Bhaumik
												Patel</strong>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit. Curabitur bibendum ornare dolor, quis ullamcorper
											ligula sodales.</p>
									</div></li>
								</c:forEach>
								<li class="left clearfix"><span class="chat-img pull-left">
										<!-- 기본이미지 가지고오기 --> 
										<img
										src="http://placehold.it/50/55C1E7/fff" alt="User Avatar"
										class="img-circle" />
								</span>
									<div class="chat-body clearfix">
										<div class="header">
											<strong class="primary-font">Jack Sparrow</strong> <small
												class="pull-right text-muted"> <i
												class="fa fa-clock-o fa-fw"></i> 12 mins ago
											</small>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit. Curabitur bibendum ornare dolor, quis ullamcorper
											ligula sodales.</p>
									</div></li> --%>
							</ul>
						</div>
						<!-- /.panel-body -->
						<div class="panel-footer">
							<div class="input-group">
								<input id="btn-input" type="text" class="form-control input-sm"
									placeholder="Type your message here..." /> <span
									class="input-group-btn">
									<button class="btn btn-warning btn-sm" id="btn-chat" onclick="insertReply();">
										WRITE</button>
								</span>
							</div>
						</div>
						<!-- /.panel-footer -->
					</div>
					<!-- /.panel .chat-panel -->
				</div>
				<!-- /.col-lg-4 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->
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
	
	<!-- DataTables JavaScript -->
	<script
		src="../resources/templet/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="../resources/templet/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
	<script
		src="../resources/templet/vendor/datatables-responsive/dataTables.responsive.js"></script>

	<!-- Custom Theme JavaScript -->
	<script
		src="../resources/templet/dist/js/sb-admin-2.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>

</body>