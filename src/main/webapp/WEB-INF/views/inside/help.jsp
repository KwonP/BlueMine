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
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- JS -->
	<script type="text/javascript" src="./resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="./resources/js/jquery-ui.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.companyInfo').click(menuPage);
		    $( "#helpList" ).accordion();
		});
		function menuPage(){
			var menuPage = $(this).attr('value');
			location.href = menuPage;
		}
	</script>
	<style type="text/css">
	#ui-id-1, #ui-id-3, #ui-id-5{
	    background: #4981b1;
	    font-weight: bold;
	    font-size: 20px;
	}
	#ui-id-4,#ui-id-6{
		height: unset !important; 
	}
	#helpList{margin-top: 30px;}
	</style>
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
        </nav>

        <div id="page-wrapper">
        	<div id="helpList">
        		<h3>Project - Timeline</h3>
        		<div class="details">
        		  <ul>
        		  	<li>
        		  	  <i class="subject">Project - MainPage</i>
        		  	  <p>
        		  	  	다시 자신의 스케줄과 프로젝트 리스트가 나오는 화면으로 돌아갑니다.
        		  	  </p>
        		  	</li>
        		  	<li>
        		  	  <i class="subject">Project - Timeline</i>
        		  	  <p>
        		  	  	본인이 속한 프로젝트 내에서의 업데이트 상황을 한 눈에 볼 수 있습니다.
        		  	  </p>
        		  	</li>
        		  	<li>
        		  	  <i class="subject">Project - Data Download</i>
        		  	  <p>
        		  	  	프로젝트 내에서 공유되는 파일들의 저장소입니다. <br>
        		  	  	File Upload를 누르면 원하는 파일의 업데이트가 가능합니다.<br>
        		  	  	사진파일, 텍스트파일, 음악파일 순으로 정리되어 있어 한 눈에 보기 쉽습니다.
        		  	  </p>
        		  	</li>
        		  	<li>
        		  	  <i class="subject">Project - Task</i>
        		  	  <p>
        		  	  	본인이 속한 그룹 내에서의 일감 생성, 완료, 수정 등이 가능합니다.
        		  	  </p>
        		  	</li>
        		  	<li>
        		  	  <i class="subject">Project - Gantt Chart</i>
        		  	  <p>
        		  	  	한 프로젝트 안에서 여러가지 일감이 시작되고 마감된 기간동안을 한 눈에 볼 수 있습니다.
        		  </ul>
        		</div>
        		<h3>My Schedule</h3>
        		<div class="details">
        		  <ul>
        			<li>
        			  <i class="subject"> My work 등록 </i>
        			  <p>
        			  	Create 버튼을 누르면 원하는 시작날짜와 종료날짜를 지정하여 자신이 해야할 일을 추가할 수 있습니다.
        			  </p>
        			</li>
        			<li>
        			  <i class="subject">My Work 읽기 및 수정</i>
        			  <p>
        			    보여지는 My Work 리스트에서 하나를 클릭하면 상세정보 보기가 가능합니다.<br>
        			    또한, Modify버튼을 클릭함 과 동시에, 해당하는 일의 정보 수정이 가능합니다.<br>
        			    완료가 되시면 Update 버튼을 눌러주시고, 취소를 원할시에는 Cancel 버튼을 눌러주세요.
        			  </p>
        			</li>
        		  </ul>
        		</div>
        		<h3>Chat</h3>
        		<div class="details">
        		  <ul>
        		  	<li>
        		  	  <i class="subject">Chat</i>
        		  	  <p>
        		  	  	현재 접속한 사람들의 목록을 보여줍니다.<br>
        		  	  	접속자를 클릭하면 채팅 페이지로 넘어갑니다.
        		  	  </p>
        		  	</li>
        		  </ul>
        		</div>
        	</div>
        </div>
        <!-- /#page-wrapper -->

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

</body>

</html>