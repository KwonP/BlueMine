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
<link href="./resources/templet/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="./resources/templet/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="./resources/templet/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="./resources/templet/vendor/morrisjs/morris.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="./resources/templet/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<!-- Modify css -->
 <link href="./resources/css/mainPage.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/cupertino/jquery-ui.min.css" />

<!-- js -->
 <!-- jQuery -->
 <script src="./resources/templet/vendor/jquery/jquery.min.js"></script>
 <script type="text/javascript" src="./resources/js/mainPage.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
</head>

<body>
<div id="load">
	<img src="resources/img/loading.gif" alt="loading">
</div>
<input type="hidden" id="userId" value="${sessionScope.loginId}">
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
				<a class="navbar-brand" href="#">BLUE MINE</a>
				<a class="companyInfo" value="about">About</a>
				<a class="companyInfo" value="contact">Contact Us</a>
				<a class="companyInfo" value="help">Help</a>
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
				<li class="dropdown">
				  <a class="dropdown-toggle"data-toggle="dropdown" href="#" id="profileImg"> 
					<c:if test="${sessionScope.selfie != null }">
						<img src="showProfile" width="50px">
					</c:if>
					<c:if test="${sessionScope.selfie == null }">
						<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdsHwPSlt3V55OxNR34jqoBtFyxThIWBtmQQE1ocFgbB9FJjQR" width="50px">
					</c:if>
					<i class="fa fa-caret-down"></i>
				  </a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="profilePage"><i class="fa fa-user fa-fw"></i> User
								Profile</a></li>
						<li class="divider"></li>
						<li><a href="logout"><i class="fa fa-sign-out fa-fw"></i>
								Logout</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-static-side -->
		</nav>

		<!-- /#page-wrapper -->
		<div id="page-wrapper">
		 <div class="panel panel-default" id="schedule">
		  <div class="panel-body">
		    My Schedule
		  </div>
		 </div>
		
		  <!-- 본인이 가진 project수 만큼 div 뿌려주기 -->
		 <div class="panel panel-default">
		  <div class="panel-heading">My Projects<div id="make" class="btn " val="one"
		  data-toggle="modal" data-target="#myModal">생성</div></div>
		   <div class="panel-body" id="listWrap">
			<c:forEach items="${pro_list}" var="list">
			  <div class="panel panel-primary" value="${list.prj_Num}">
			  	<div class="panel-heading" style="background-color: ${list.background};" >
			  	 ${list.prj_Num}<span style="float: right;">Planner : ${list.planner}</span>
			  	</div>
			  	<div class="panel-body">
			  	 <a href="#" class="hvr-outline-in">${list.prj_Name}</a>
			  	</div>
			  </div>
			</c:forEach>
		  </div>
		 </div>
		</div>
		<!-- /#wrapper -->

	<!-- Bootstrap Core JavaScript -->
	<script src="./resources/templet/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="./resources/templet/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="./resources/templet/vendor/raphael/raphael.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="./resources/templet/dist/js/sb-admin-2.js"></script>
</div>
<div class="modal" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title">프로젝트 생성</h3>
      </div>
      <div class="modal-body">
      	<label >프로젝트 제목</label><br>
        <input type="text" name="prj_Name" id="prj_Name" placeholder="Title" style="width: 100%"/>
      </div>
      <div class="modal-body">
        <label>책임자</label>
        <select class="form-control" name="cp_dep" id="cp_dep">
			<option value="void"  selected="selected">부서</option>
			<c:forEach  items="${sessionScope.dep_list}" var="list">
			<option value="${list.depNameKr}">${list.depNameKr}</option>
			</c:forEach>
		</select>
      </div>
      <div class="modal-body">
        <select class="form-control" name="cp_posi" id="cp_posi" onselect="">
			<option value="" selected="selected">직급</option>
			<c:forEach items="${sessionScope.posi_list}" var="list">
			<option value="${list.positionName}">${list.positionName}</option>
			</c:forEach>
		</select>
      </div>
      <div class="modal-body">
        <input class="form-control" name="planner"
			id="planner" placeholder="성명" type="text" >
      </div>
      <div class="modal-body">
        <label>접근권한</label>
        <select class="form-control" name="access_Control" id="access_Control">
			<option value="1" selected="selected">공개</option>
			<option value="0">비공개</option>
		</select>							
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button id="CreatePrj" type="button" class="btn btn-primary">Create</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<div class="modal" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title">그룹(분류) 생성</h3>
      </div>
      <div class="modal-body">
      	<label >그룹 이름</label><br>
        <input type="text" name="gp_Name" id="gp_Name" placeholder="Title" style="width: 100%"/>
        <input type="hidden" name="prj_Num" id="prj_Num">
      </div>
      <div class="modal-body">
        						
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button id="CreatePrj" type="button" class="btn btn-primary">Create</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
		
	
</body>

</html>