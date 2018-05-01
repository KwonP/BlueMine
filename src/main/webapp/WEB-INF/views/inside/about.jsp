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
	<script type="text/javascript" src="./resources/js/jquery.flip.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('.companyInfo').click(menuPage);
		$('#page-wrapper').fadeIn(1200);
		$("#card").flip();
		$('#card2').flip();
	});
	function menuPage(){
		var menuPage = $(this).attr('value');
		location.href = menuPage;
	}
	</script>
	<style type="text/css">
	#page-wrapper{ display : none;}
	 h1 {
	    font-size: 100px;
	    text-align: center;
	    font-weight: bold;
	    color: #4b85c6;
	}
	h2{
		font-size: 45px;
	    font-weight: bold;
	    color: #cf1f1f;
	    margin-top: 60px;
    }
	.imgs{text-align: center;}
	#card{position: absolute !important; left: 0px; width: 626px; margin-left: 75px;}
	#card2{position: absolute !important; right: 65px; width: 626px;}
	.back{text-align: center;}
	ul{
		margin-top: 0;
	    margin-bottom: 10px;
	    list-style: none;
	    line-height: 110px;
	    padding: 0;
	    font-size: 30px;
	   }
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
            <!-- /.navbar-static-side --> 
        </nav> 
 
        <div id="page-wrapper"> 
          <h1 class="header">Blue Mine</h1>
          <div id="card"> 
			  <div class="front"> 
		          <img src="./resources/img/office1.jpg">
			  </div> 
			  <div class="back" id="back1">
			  <h2>시간효율성 증대</h2>
			  <ul>
			  	<li>개인 스케줄, 회사 스케줄 동시 정리!</li>
				<li>멀티 태스킹 능력 향상!</li>			  	
				<li>일정을 체크하며 효율적인 시간 관리!</li>
			  </ul>
			  </div> 
		  </div>
			
		  <div id="card2"> 
			  <div class="front"> 
		          <img src="./resources/img/office2.jpg">
			  </div> 
			  <div class="back" id="back2">
			  <h2>체계적인 관리</h2>
			  <ul>
			  	<li>다양한 스케줄 동시에 관리!</li>
			  	<li>간트차트로 데이터 한 눈에 보기!</li>
			  	<li>알림으로 그때 그때 일정 확인하기!</li>
			  </ul>
			  </div> 
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