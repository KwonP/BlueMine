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
	<script src="./resources/toastr/toastr.min.js"></script>
<link href="./resources/toastr/toastr.css" rel="stylesheet">
<script src="./resources/js/notificationList.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.companyInfo').click(menuPage);
    	updateCheck('${loginId}','./');
    	getNotice();
	});
	function menuPage(){
		var menuPage = $(this).attr('value');
		location.href = menuPage;
	}
	function getNotice(){ 
		if(${nList==null}){
			return ;
		}
			var list = new Array();
			<c:forEach items="${nList}" var="item">
			var trigger_Num="${item.trigger_Num}";
			var info_Type="${item.info_Type}";
			var info_Num="${item.info_Num}";
			var info_Content="${item.info_Content}";
			var update_Date="${item.update_Date}";
			var command_Check="${item.command_Check}";
			showNotice({trigger_Num : trigger_Num, info_Type : info_Type, info_Num:info_Num, info_Content:info_Content, update_Date:update_Date, command_Check:command_Check},'./');
			</c:forEach>
	}
	</script>
</head>

<body>
<div id="load">
	<img src="resources/img/loading.gif" alt="loading">
</div>
<input type="hidden" id="loginId" value="${sessionScope.loginId}">
<input type="hidden" name="prj_Num" id="prj_Num" value="" >
<input type="hidden" name="userId" id="userId" value="">
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
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle" id="noticeCheck"
					data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw" id="bell"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul id="notificationList" class="dropdown-menu dropdown-alerts">
						
					</ul> <!-- /.dropdown-alerts --></li>
				<!-- /.dropdown -->
				<li class="dropdown">
				  <a class="dropdown-toggle"data-toggle="dropdown" href="#" id="profileImg"> 
						<img src="showProfile" width="50px">
					<i class="fa fa-caret-down"></i>
				  </a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="profilePage"><i class="fa fa-user fa-fw"></i> ユーザープロフィール</a></li>
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
		  <div class="panel-heading">My Projects<div id="make" class="btn "
		  data-toggle="modal" data-target="#addPrj">生成</div></div>
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
<div class="modal fade" tabindex="-1" role="dialog" id="addPrj">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title">プロジェクト生成</h3>
      </div>
      <div class="modal-body">
      	<label >プロジェクト名</label><br>
        <input type="text" name="prj_Name" id="prj_Name" placeholder="Title" style="width: 100%" maxlength="50"/>
      </div>
      <div class="modal-body">
        <label>責任者</label>
        <select class="form-control" name="cp_dep" id="cp_dep">
			<option value="void"  selected="selected">部署</option>
			<c:forEach  items="${sessionScope.dep_list}" var="list">
			<option value="${list.depNameKr}">${list.depNameKr}</option>
			</c:forEach>
		</select>
      </div>
      <div class="modal-body">
        <select class="form-control" name="cp_posi" id="cp_posi" onselect="">
			<option value="" selected="selected">肩書き</option>
			<c:forEach items="${sessionScope.posi_list}" var="list">
			<option value="${list.positionName}">${list.positionName}</option>
			</c:forEach>
		</select>
      </div>
      <div class="modal-body">
        <input class="form-control" name="planner"
			id="planner" placeholder="성명" type="text" maxlength="50" >
      </div>
      <div class="modal-body">
        <label>接近権限</label>
        <select class="form-control" name="access_Control" id="access_Control">
			<option value="1" selected="selected">公開</option>
			<option value="0">非公開</option>
		</select>							
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='goToMain'">Close</button> 
        <button id="CreatePrj" type="button" class="btn btn-primary" data-toggle="modal" data-target="#addGroup">Create</button>
        
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<div class="modal fade" tabindex="-1" role="dialog" id="addGroup">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title">グループ(分類)生成</h3>
      </div>
      <div class="modal-body">
      	<label >グループ名</label><br>
        <input type="text" name="gp_Name" id="gp_Name" placeholder="Title" style="width: 100%" maxlength="50"/>
        
      </div>
      <div class="modal-body">
        						
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='goToMain'">Close</button>
        <button id="CreateGroup" type="button" class="btn btn-primary">Create</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
		
	<script src="./resources/js/worker.js"></script>
</body>

</html>