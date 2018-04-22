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
    <link href="../resources/templet/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../resources/templet/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../resources/templet/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../resources/templet/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../resources/templet/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- swiper -->  
	<link href="../resources/css/layout.css" rel="stylesheet">
	<link href="../resources/css/swiper.css" rel="stylesheet">	  
	<script type="text/javascript" src="../resources/js/swiper.js"></script>

	<!-- modified CSS -->
	<link href="../resources/css/basic.css" rel="stylesheet">
	<link href="../resources/css/myScheduleMain.css" rel="stylesheet">
	<!-- JS -->
	<script type="text/javascript" src="../resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../resources/js/myScheduleMain.js"></script>
	
	<!-- datepicker -->
	  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
                      <img src="../showProfile?id=${sessionScope.loginId}" width="50px">
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
        </nav>

        <div id="page-wrapper">
         <div class="myWork">
          	<h3>My Work <span class="label label-default" id="createWork" onclick="createPopup()">Create</span></h3>
          	<section class="feature">
          	<div class="inWrap">
          	  <div class="fInner swiper-container">
          	  	<ul class="swiper-wrapper">
          	  		<c:forEach items="${workList}" var="list">
          	  		  <li class="swiper-slide">
          	  		  	<div class="work" onclick="getDetail(${list.ps_Num})" >
          	  		  	  ${list.ps_Name} <br><br>
          	  		  	  <i>${list.startDate}</i><br>
          	  		  	  ~<br>
          	  		  	  <i>${list.deadLine}</i> <br>
          	  		  	  <c:if test="${list.progress == 0}">
          	  		  	    미완료<br>
          	  		  	   <button onclick="endWork(${list.ps_Num})" class="endWork">Finish</button>
          	  		  	  </c:if>
          	  		  	  <c:if test="${list.progress == 1}">
          	  		  	  완료<br>
          	  		  	  <button onclick="delWork(${list.ps_Num})" class="delWork">Delete</button>
          	  		  	  </c:if>
          	  		  	</div>
          	  		  </li>
          	  		</c:forEach>
          	  	</ul>
          	  	<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
			  </div>
          	  </div>
          	</section>
          	</div>
          	
          	<div class=popupWrap>
			  <div id="workPopup" class="white_content">
			   <a href = "#" onclick="workPopupClose();">
        	  	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
               </a>
                 <form action="createWork" method="post" onsubmit="return check();" id="formAction">
                 	<table class="workForm">
                 	  <tr>
                 	  	<td>Title </td>
                 	  	<td><input type="text" id="ps_Name" name="ps_Name"></td>
                 	  </tr>
                 	  <tr>
                 	    <td>Content </td>
                 	    <td><textarea type="text" id="ps_Content" name="ps_Content"></textarea></td>
                 	  </tr>
                 	  <tr>
                 	    <td>Start Date </td>
                 	    <td><input type="text" id="startDate" name="startDate"></td>
                 	  </tr>
                 	  <tr>
                 	  	<td>End Date </td>
                 	  	<td><input type="text" id="deadLine" name="deadLine"></td>
                 	  </tr>
                 	  <tr>
                 	    <td>Importance </td>
                 	    <td> 
                 	     <select style="height: 30px;" id="ps_Pri" name="ps_Pri">
                 	     	<option value="1"> 매우 중요</option>
                 	     	<option value="2"> 중요</option>
                 	     	<option value="3"> 보통</option>
                 	     </select>
                 	    </td> 
                 	  </tr>
                 	  <tr>
                 	    <td colspan="2" style="text-align: center;">
                 	    <input type="button" value="Create" class="submitWork" onclick="submitType()">
                 	    <input type="button" value="Cancel" class="cancel" onclick="cancel()">
                 	    </td>
                 	  </tr>  
                 	</table>
                 </form>
			  </div>
			  <div class="black_overlay"></div>
			</div>
          	
          <div class="checkList">
          	<h2>Check List</h2>
          	<div class="days">
          	 <ul>
          	  <c:forEach begin="1" end="7" varStatus="status">
          	   <div class="day" number="${status.current}" style="display: inline-block;">
          	   	<c:if test="${status.current == 1}">월요일</c:if>
          	   	<c:if test="${status.current == 2}">화요일</c:if>
          	   	<c:if test="${status.current == 3}">수요일</c:if>
          	   	<c:if test="${status.current == 4}">목요일</c:if>
          	   	<c:if test="${status.current == 5}">금요일</c:if>
          	   	<c:if test="${status.current == 6}">토요일</c:if>
          	   	<c:if test="${status.current == 7}">일요일</c:if>
          	   </div>
          	  </c:forEach>
          	 </ul> 
          	</div>
          </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Bootstrap Core JavaScript -->
    <script src="../resources/templet/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../resources/templet/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../resources/templet/vendor/raphael/raphael.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../resources/templet/dist/js/sb-admin-2.js"></script>

</body>

</html>