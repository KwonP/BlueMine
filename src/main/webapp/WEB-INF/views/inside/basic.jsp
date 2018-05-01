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
    <link href="./resources/templet/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="./resources/templet/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./resources/templet/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="./resources/templet/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="./resources/templet/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	<!-- modified CSS -->
 <link href="./resources/css/basic.css" rel="stylesheet">
	<!-- JS -->
	<script type="text/javascript" src="./resources/js/jquery-3.2.1.min.js"></script>
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
				<a class="navbar-brand" href="goToMain">BLUE MINE</a>
				<a class="companyInfo" value="about">About</a>
				<a class="companyInfo" value="contact">Contact Us</a>
				<a class="companyInfo" value="help">Help</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
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
                      <img src="showProfile" width="50px">
					  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="profilePage"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                            <a href="goToMain"><i class="fa fa-desktop fa-fw"></i> Main Page</a> 
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
                            <a href="#"><i class="fa fa-paste fa-fw"></i> Task</a> 
                        </li> 
                        <li> 
                            <a href="inside/broadcast"><i class="fa fa-comments fa-fw"></i> Chats</a> 
                        </li> 
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

    <!-- jQuery -->
    <script src="./resources/templet/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="./resources/templet/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="./resources/templet/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="./resources/templet/vendor/raphael/raphael.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="./resources/templet/dist/js/sb-admin-2.js"></script>

</body>

</html>