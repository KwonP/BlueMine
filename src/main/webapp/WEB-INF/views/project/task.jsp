<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>

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

<!-- jQuery -->
<script src="../resources/templet/vendor/jquery/jquery.min.js"></script>


<!-- Bootstrap Core JavaScript -->
<script src="../resources/templet/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="../resources/templet/vendor/metisMenu/metisMenu.min.js"></script>

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
<script src="../resources/templet/dist/js/sb-admin-2.js"></script>

<!-- datepicker -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
	margin-top: -370px;
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

<script type="text/javascript">
	$(document).ready(function(){
		$('.companyInfo').click(menuPage);
	});
	function menuPage(){
		var menuPage = $(this).attr('value');
		location.href = menuPage;
	}
	</script>

<script>
		function check(){
			// 날짜 비교
			var startValue = $('#startDate').val();
			startValue = startValue.split('-');
			var startDate = new Date();
			startDate.setFullYear(startValue[0],(startValue[1]-1),startValue[2]);
			
			var endValue = $('#deadLine').val();
			endValue = endValue.split('-');
			var deadLine = new Date();
			deadLine.setFullYear(endValue[0],(endValue[1]-1),endValue[2]);
			if (startDate > deadLine) {
				alert("시작날짜와 마감날짜를 확인해주세요");
				return false;
			}
			startDate = $('#startDate').val();
			deadLine = $('#deadLine').val();
			
			return true;
		}
	</script>


<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>

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

	function makeTask(pj_group) {
		check();		
		
		var gs_Name = $('#gs_Name').val();
		var gs_Content = $('#gs_Content').val();
		var start_Date = $('#start_Date').val();
		var deadLine = $('#deadLine').val();
		var gp_Pri = $('#gp_Pri').val();
		var taskCategory = $('#taskCategory').val();
		var gp_Num = pj_group;
		// var GP_Work = $('form[name=taskForm]').serialize();
		
		$.ajax({
			url: 'insertTask', 								// 일감추가
			type: 'POST', 									// 타입
			data: {
				gs_Name: gs_Name // String
				, gp_Num : gp_Num // int
				, gs_Content : gs_Content // String
				, start_Date : start_Date // String
				, deadLine : deadLine // String
				, gp_Pri : gp_Pri // int
				, taskCategory : taskCategory //String
			},
			dataType: 'text',
			success: function(str) {
				if(str == '1') {
					window.location.reload();
				}
			},
			error: function(cnt) {
				alert('에러');
			}				
		});	 
	}
	
	/* function completeTask() {
		var array = [];
	    
	    <c:forEach items="${tasklist}" var="item">
			array.push("${item}");
		</c:forEach>
		$.each( array, function(i, l){
			alert(i); // 0 1
			alert(l); // GP_Work [gs_Num=123, gs_Name=tt2, gp_Num=1234, gs_Content=ff, start_Date=2018-02-05 00:00:00, deadLine=2018-01-02 00:00:00, gp_Pri=2, progress=1, taskCategory=결함]
			alert(l[1]);// l.gs_Num
			if($('#'+l[i]).prop("checked")) {
				alert(3);
				$('#'+l[i]).attr("value", 1);
				var progress = $('#'+l[i]).val();
				alert(progress);
				var temp = l[i];
				$('.' + temp).attr("class", "success");
			}
			else {
				alert(4); // ok
				$('#'+l[i]).attr("value", 0);
				var progress = $('#'+l[i]).val();
				alert(progress); // undifined!!
				var temp = l[i];
				$('.' + temp).attr("class", "info");
			}
			alert(5); // ok
			var gp_Num = ${pj_group.gp_Num};			
			
			$.ajax({
				url: 'updateProgress', 							// progress 변경
				type: 'POST', 									// 타입
				data: {
					gp_Num: gp_Num 								// 그룹 번호
					, progress: progress 						// 진행도
				},
				dataType: 'text',
				async: false,
				success: function(str) { 
					if(str == '1') {
						alert('성공');
					}
				},
				error: function(cnt) {
					alert('에러');
				}				
			});	 
		});
	 */
	/* function completeTask() { */
		/* $(".ckbox").prop("checked", true) */
		/* ${t.gs_Num} + ${status.count} */
/* 		$(".ckbox").prop("checked", true).each(function(){
			var getCheck = $(this).val();
			checked.push(getCheck);
		});
		
		// Uncheck
		$(".ckbox").prop("checked", false).each(function(){
			var getCheck = $(this).val();
			unchecked.push(getCheck);
		});
		
		// Check
		$('input[name=changeProg]:checked')
 */		

 	
		
 
 		/*		$("input[name=getNums]:checked").each(function(){
			var com = $(this).val();
			alert("비교할 값" + com);
			var com2 = 0;
			for(var i = 0; i < checked.length; i++){
				if (com == checked[i]) {
					alert("포함" + checked[i]);
					return true;
				}
			com2 = checked[i];
			alert("체크가 안됨" + com2);
			}
		}); */
		
		/* return;
		for(var i = 0; i < checked.length; i++){
			alert(checked[i]);
		}
		for(var j = 0; j < unchecked.length; j++){
			alert(unchecked[i]);
		}
		$.ajax({
			url : 'changeProgress',
			type : 'post',
	        data: {checked : checked},
	        dataType : "json",
			success : function(result){
				if (result == 'ok') {
					alert('변경되었습니다.');
				} else {
					alert('변경에 실패하였습니다. 다시 시도해 주세요.');
				}
			},
			error : function(){
				alert('서버 오류');
			}
		}) */
	//}

		
		/* if($('#'+l[i]).prop("checked")) {
			alert(3);
			$('#'+l[i]).attr("value", 1);
			var progress = $('#'+l[i]).val();
			alert(progress);
			var temp = l[i];
			$('.' + temp).attr("class", "success");
		}
		else {
			alert(4); // ok
			$('#'+l[i]).attr("value", 0);
			var progress = $('#'+l[i]).val();
			alert(progress); // undifined!!
			var temp = l[i];
			$('.' + temp).attr("class", "info");
		}
		alert(5); // ok
		var gp_Num = ${pj_group.gp_Num};			
		
		$.ajax({
			url: 'updateProgress', 							// progress 변경
			type: 'POST', 									// 타입
			data: {
				gp_Num: gp_Num 								// 그룹 번호
				, progress: progress 						// 진행도
			},
			dataType: 'text',
			async: false,
			success: function(str) { 
				if(str == '1') {
					alert('성공');
				}
			},
			error: function(cnt) {
				alert('에러');
			}				
		});*/ 
	}
	
	//새 메세지 추가
	function insertReply() {
		var btn_input = $('#btn-input').val();
		alert(1);
		alert(btn_input);
		$.ajax({
			url: 'insertMemo', // 컨트롤러 value
			type: 'POST', // 타입
			data: {
				tl_Content: btn_input
			},
			dataType: 'text',
			success: function(str) {
				if(str == '1') {
					window.location.reload();
				}
			},
			error: function(cnt) {
				alert('에러');
			}				
		});	
		return;
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
				<a class="navbar-brand" href="goToMain">BLUE MINE</a> <a
					class="companyInfo" value="about">About</a> <a class="companyInfo"
					value="contact">Contact Us</a> <a class="companyInfo" value="help">Help</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
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
						src="../showProfile" width="50px"> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="profilePage"><i class="fa fa-user fa-fw"></i>
								User Profile</a></li>
						<li class="divider"></li>
						<li><a href="logout"><i class="fa fa-sign-out fa-fw"></i>
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
						<li><a href="goToMain"><i class="fa fa-desktop fa-fw"></i>
								Main Page</a></li>
						<li><a href="#"><i class="fa fa-paper-plane-o fa-fw"></i>
								Timeline<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="#">My Timeline</a></li>
								<li><a href="#">Company Timeline</a></li>
							</ul> <!-- /.nav-second-level --></li>
						<li><a href="#"><i class="fa fa-edit fa-fw"></i> Board</a></li>
						<li><a href="#"><i class="fa fa-paste fa-fw"></i> Task</a></li>
						<li><a href="inside/broadcast"><i
								class="fa fa-comments fa-fw"></i> Chats</a></li>
						</li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>

		<div id="page-wrapper">
			<h1>${prjNum}</h1>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- 여기서부터 변경. -->
	<div id="page-wrapper">
	<div class="test">
	</div>

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">${prj_Name}</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<c:forEach var="k" items="${pjgroupList}" varStatus="st">
			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">${k.gp_Name }</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>Progress</th>
											<!-- private int progress;// 진행도 -->
											<th>Task Name</th>
											<!-- private String gs_Name;// 그룹 스케줄 이름 -->
											<th>Content</th>
											<!-- private String gs_Content;// 내용 -->
											<th>Category</th>
											<!-- private String taskCategory;//유형 -->
											<th>Start Date</th>
											<!-- private String start_Date;// 시작일 -->
											<th>Deadline</th>
											<!-- private String deadLine;// 마감일 -->
											<th>Priority</th>
											<!-- private int gp_Pri;// 중요도 -->
										</tr>
									</thead>
									<tbody>
										<!-- 반복 시작 -->
										<%-- <c:forEach var="key" items="${keys}"> --%>
										<c:if test="${sessionScope.loginId != null}">
											<c:if test="${pjgroupList != null}">
												<c:forEach var="key" items="${map}" varStatus="status">
													<c:forEach var="m" items="${key[k.gp_Num][status.count]}">
														<tr class="info" class="tt">
															<td>
																<div class="btn-group" data-toggle="buttons">
																	<c:if
																		test="${key[k.gp_Num][status.count].progress == 0}">
																		<input type="checkbox" class="ckbox"
																			id="${key[k.gp_Num][status.count].gs_Num} + ${status.count}"
																			value="${key[k.gp_Num][status.count].gs_Num}"
																			name="getNums">
																	</c:if>
																	<c:if
																		test="${key[k.gp_Num][status.count].progress == 1}">
																		<input type="checkbox" class="ckbox"
																			id="${key[k.gp_Num][status.count].gs_Num} + ${status.count}"
																			value="${key[k.gp_Num][status.count].gs_Num}"
																			checked="checked" name="getNums">
																	</c:if>
																</div>
															</td>
															<td>${key[k.gp_Num][status.count].gs_Name}</td>
															<td>${key[k.gp_Num][status.count].gs_Content}</td>
															<td>${key[k.gp_Num][status.count].taskCategory}</td>
															<td>${key[k.gp_Num][status.count].start_Date}</td>
															<td>${key[k.gp_Num][status.count].deadLine}</td>
															<td>${key[k.gp_Num][status.count].gp_Pri}</td>
														</tr>
													</c:forEach>
												</c:forEach>
											</c:if>
										</c:if>

										<tr>
											<td class="table">
												<button class="btn btn-primary" onclick="completeTask(${r.gp_Num})">저장</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
							<button class="btn fifth"
								style="width: 566px; height: 180px; font-size: 50px;"
								onclick="popup()">+</button>

							<div id="joinPopup" class="white_content"
								style="width: 800px; height: 673px;">
								<a href="#" onclick="workPopupClose();"> <span
									class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								</a>
								<div id="wrapper">
									<div class="row">
										<div class="col-lg-12">
											<h1 class="page-header">Form</h1>
										</div>
										<!-- /.col-lg-12 -->
									</div>
									<!-- /.row -->

									<div class="row">
										<div class="col-lg-12">
											<div class="panel panel-default">
												<div class="panel-heading">Task</div>
												<div class="panel-body">
													<div class="row">
														<div class="col-lg-6">
															<div class="form-group">
																<label>유형</label> <select class="form-control"
																	name="taskCategory" id="taskCategory">
																	<option value="이슈">이슈</option>
																	<option value="결함">결함</option>
																	<option value="테스트케이스">테스트케이스</option>
																	<option value="설계">설계</option>
																	<option value="개발">개발</option>
																	<option value="코드 리뷰">코드 리뷰</option>
																</select>
															</div>

															<div class="form-group">
																<label>제목</label> <input class="form-control"
																	name="gs_Name" id="gs_Name" placeholder="Title">
															</div>

															<div class="form-group">
																<label>시작일</label> <input type="text"
																	class="form-control" name="startDate" id="startDate">
															</div>
														</div>

														<div class="form-group">
															<label>마감일</label> <input type="text"
																class="form-control" name="deadLine" id="deadLine">
														</div>

														<div class="form-group">
															<label>중요도</label> <select class="form-control"
																name="gp_Pri" id="gp_Pri">
																<option value="4">즉시</option>
																<option value="3">긴급</option>
																<option value="2">높음</option>
																<option value="1">보통</option>
																<option value="0">낮음</option>
															</select>
														</div>

													</div>
													<!-- /.col-lg-6 (nested) -->
													<div class="col-lg-6">
														<div class="form-group">
															<label>설명</label>
															<textarea style="resize: none;" class="form-control"
																name="gs_Content" id="gs_Content" rows="17"></textarea>
														</div>
														<div class="form-group">
															<button class="btn btn-primary" style="float: right;"
																onclick="makeTask()">만들기</button>
														</div>
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
		</c:forEach>
		<!-- /.col-lg-6 -->

		<div class="col-lg-4">
			<div class="chat-panel panel panel-default">
				<div class="panel-body">
					<ul class="chat">
						<c:if test="${timelineList != null }">
							<c:forEach var="i" items="${timelineList }">
								<li class="left clearfix"><span class="chat-img pull-left">
										<!-- 기본이미지 가지고오기 --> <!-- <img width="500" height="300" src=""/>  -->
										<img src="../showProfile" class="img-circle" />
								</span>
									<div class="chat-body clearfix">
										<div class="header">
											<strong class="primary-font">${i.writer }</strong> <small
												class="pull-right text-muted"> <i
												class="fa fa-clock-o fa-fw"></i> ${i.w_Date}
											</small>
										</div>
										<p>${i.tl_Content }</p>
									</div></li>
							</c:forEach>
						</c:if>
					</ul>
				</div>
				<!-- /.panel-body -->
				<div class="panel-footer">
					<div class="input-group">
						<input id="btn-input" type="text" class="form-control input-sm"
							placeholder="Type your message here..." /> <span
							class="input-group-btn">
							<button class="btn btn-warning btn-sm" id="btn-chat"
								onclick="insertReply()">WRITE</button>
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
</body>
</html>