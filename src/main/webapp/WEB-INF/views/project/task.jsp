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

<link href="../resources/css/basic.css" rel="stylesheet">

<style>
html {
	background: #ffffff;
}

#wrapper {
	width: 100%;
	height: 100%;
}

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

#page-wrapper {
	position: relative;
	width: 1260px;
	left: 250px;
}

#write {
	position: absolute;
	left: 695px;
	top: 115px;
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

	function makeTask(gp_Num) {
		check();		
		
		var gs_Name = $('#gs_Name').val();
		var gs_Content = $('#gs_Content').val();
		var start_Date = $('#start_Date').val();
		var deadLine = $('#deadLine').val();
		var gp_Pri = $('#gp_Pri').val();
		var taskCategory = $('#taskCategory').val();
		var gp_Num = gp_Num;
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
	
	function completeTask(gp_Num) {
		var array = [];
		$('#' + gp_Num).each(function(i, l){
			if($(this).prop("checked", true)) {
				$(this).attr("value", 1);
				var progress = $(this).val();
				$('#' + gp_Num).attr("class", "success");
			}
			if($(this).prop("checked", false)) {
				$(this).attr("value", 0);
				var progress = $(this).val();
				$('#' + gp_Num).attr("class", "info");
			}
			
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
						window.location.reload();
					}
				},
				error: function(cnt) {
					alert('에러');
				}				
			});	
		});
		return;
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
				<a class="navbar-brand" href="../goToMain">BLUE MINE</a> <a
					class="companyInfo" value="../about">About</a> <a
					class="companyInfo" value="../contact">Contact Us</a> <a
					class="companyInfo" value="../help">Help</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" id="noticeCheck"> <i
						class="fa fa-bell fa-fw" id="bell"></i> <i
						class="fa fa-caret-down"></i>
				</a>
					<ul id="notificationList" class="dropdown-menu dropdown-alerts">

					</ul> <!-- /.dropdown-alerts --></li>
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" id="profileImg"> <img
						src="../showProfile" width="50px"> <i
						class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="../profilePage"><i class="fa fa-user fa-fw"></i>
								User Profile</a></li>
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
						<li><a href="../goToMain"><i class="fa fa-desktop fa-fw"></i>
								メイン ページ</a></li>
						<li><a href="#"><i class="fa fa-paper-plane-o fa-fw"></i>
								タイムライン</a></li>
						<li><a href="../data/filePrint"><i
								class="fa fa-edit fa-fw"></i> データダウンロード</a></li>
						<li><a href="../task/taskMain"><i
								class="fa fa-paste fa-fw"></i> タスク</a></li>
						<li><a href="../gantt/chart"><i class="fa fa-paste fa-fw"></i>
								ガントチャート</a></li>
						<li><a href="../inside/broadcast"><i
								class="fa fa-comments fa-fw"></i>チャット</a></li>
						</li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>
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
							メインページ</a></li>
					<li><a href="#"><i class="fa fa-paper-plane-o fa-fw"></i>
							タイムライン<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="#">My Timeline</a></li>
							<li><a href="#">Company Timeline</a></li>
						</ul> <!-- /.nav-second-level --></li>
					<li><a href="#"><i class="fa fa-edit fa-fw"></i> Board</a></li>
					<li><a href="#"><i class="fa fa-paste fa-fw"></i> タスク</a></li>
					<li><a href="inside/broadcast"><i
							class="fa fa-comments fa-fw"></i> チャット</a></li>
					</li>
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
												<th>進行度</th>
												<!-- private int progress;// 진행도 -->
												<th>タスクネーム</th>
												<!-- private String gs_Name;// 그룹 스케줄 이름 -->
												<th>コンテンツ</th>
												<!-- private String gs_Content;// 내용 -->
												<th>カテゴリー</th>
												<!-- private String taskCategory;//유형 -->
												<th>開始日</th>
												<!-- private String start_Date;// 시작일 -->
												<th>締め切り日</th>
												<!-- private String deadLine;// 마감일 -->
												<th>重要度</th>
												<!-- private int gp_Pri;// 중요도 -->
											</tr>
										</thead>
										<tbody>
											<!-- 반복 시작 -->
											<c:if test="${sessionScope.loginId != null}">
												<c:if test="${gpworkList == null }">
												</c:if>
												<c:if test="${gpworkList != null }">
													<c:forEach var="r" items="${gpworkList}" varStatus="status">
														<c:if test="${k.gp_Num == r.gp_Num}">
															<c:if test="${r.progress == 0}">
																<tr class="info" id="${r.gp_Num}">
																	<td>
																		<div class="btn-group" data-toggle="buttons">
																			<input type="checkbox" class="${r.gp_Num}"
																				value="${r.progress}" name="${r.gs_Num}">
																		</div>
																	</td>
																	<td>${r.gs_Name}</td>
																	<td>${r.gs_Content}</td>
																	<td>${r.taskCategory}</td>
																	<td>${r.start_Date}</td>
																	<td>${r.deadLine}</td>
																	<td>${r.gp_Pri}</td>
																</tr>
															</c:if>

															<c:if test="${r.progress == 1}">
																<tr class="success" id="${r.gp_Num}">
																	<td>
																		<div class="btn-group" data-toggle="buttons">
																			<input type="checkbox" class="${r.gp_Num}"
																				value="${r.progress}" name="${r.gs_Num}">
																		</div>
																	</td>
																	<td>${r.gs_Name}</td>
																	<td>${r.gs_Content}</td>
																	<td>${r.taskCategory}</td>
																	<td>${r.start_Date}</td>
																	<td>${r.deadLine}</td>
																	<td>${r.gp_Pri}</td>
																</tr>
															</c:if>
														</c:if>
													</c:forEach>


													<tr>
														<td class="table">
															<button class="btn btn-primary"
																onclick="completeTask(${k.gp_Num})">セーブ</button>
														</td>
													</tr>
												</c:if>
											</c:if>
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
													<div class="panel-heading">タスク</div>
													<div class="panel-body">
														<div class="row">
															<div class="col-lg-6">
																<div class="form-group">
																	<label>タイプ</label> <select class="form-control"
																		name="taskCategory" id="taskCategory">
																		<option value="問題">問題</option>
																		<option value="欠陥">欠陥</option>
																		<option value="テストケース">テストケース</option>
																		<option value="設計">設計</option>
																		<option value="開発">開発</option>
																		<option value="コードレビュー">コードレビュー</option>
																	</select>
																</div>

																<div class="form-group">
																	<label>タイトル</label> <input class="form-control"
																		name="gs_Name" id="gs_Name" placeholder="Title">
																</div>

																<div class="form-group">
																	<label>開始日</label> <input type="text"
																		class="form-control" name="startDate" id="startDate">
																</div>
															</div>

															<div class="form-group">
																<label>締め切り日</label> <input type="text"
																	class="form-control" name="deadLine" id="deadLine">
															</div>

															<div class="form-group">
																<label>重要度</label> <select class="form-control"
																	name="gp_Pri" id="gp_Pri">
																	<option value="4">即</option>
																	<option value="3">緊急</option>
																	<option value="2">高</option>
																	<option value="1">普通</option>
																	<option value="0">低</option>
																</select>
															</div>

														</div>
														<!-- /.col-lg-6 (nested) -->
														<div class="col-lg-6">
															<div class="form-group">
																<label>説明</label>
																<textarea style="resize: none;" class="form-control"
																	name="gs_Content" id="gs_Content" rows="17"></textarea>
															</div>
															<div class="form-group">
																<button class="btn btn-primary" style="float: right;"
																	onclick="makeTask(${k.gp_Num})">生成</button>
															</div>
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
				</div>
			</c:forEach>
			<!-- /.col-lg-6 -->

			<div class="col-lg-4" id="write">
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
									onclick="insertReply()">書き込む</button>
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
	<!-- /#wrapper -->
	<script src="../resources/js/worker.js"></script>
</body>
</html>