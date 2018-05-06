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
				<a class="companyInfo" value="about">ブルーマインとは？</a>
				<a class="companyInfo" value="contact">Contact Us</a>
				<a class="companyInfo" value="help">ヘルプ</a>
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
                        <li><a href="profilePage"><i class="fa fa-user fa-fw"></i> ユーザープロフィール</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="logout"><i class="fa fa-sign-out fa-fw"></i> ログアウト</a>
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
        		  	  	自分のスケジュールとプロジェクトリスト画面に戻ります。
        		  	  </p>
        		  	</li>
        		  	<li>
        		  	  <i class="subject">Project - Timeline</i>
        		  	  <p>
        		  	  	自分が属しているプロジェクトのアップデート状況を一目で確認できます。
        		  	  </p>
        		  	</li>
        		  	<li>
        		  	  <i class="subject">Project - Data Download</i>
        		  	  <p>
        		  	  	プロジェクト内で共有されるファイルのストレージです。<br>
        		  	  	アップロードボタンを押せば自分が望むファイルのアップロードが可能です。<br>
        		  	  	画像、テキスト、音源ファイル順に整理されており確認しやすくなっております。
        		  	  </p>
        		  	</li>
        		  	<li>
        		  	  <i class="subject">Project - Task</i>
        		  	  <p>
        		  	  	自分が属しているグループ内での作業の生成、完了、修正などが可能です。
        		  	  </p>
        		  	</li>
        		  	<li>
        		  	  <i class="subject">Project - Gantt Chart</i>
        		  	  <p>
        		  	  	1つのプロジェクトの中で色々な作業の開始日及び締め切り日を一目に確認できます。
        		  </ul>
        		</div>
        		<h3>My Schedule</h3>
        		<div class="details">
        		  <ul>
        			<li>
        			  <i class="subject"> My work 登録 </i>
        			  <p>
        			  	Createボタンを押すと開始日と締め切り日を指定し自分の仕事を追加できます。
        			  </p>
        			</li>
        			<li>
        			  <i class="subject">My Work 確認、修正</i>
        			  <p>
        			  	表示されるMy Workリスト内で一つをクリックすれば精細な情報を見る事が出来ます。<br>
        			    また、Modifyボタンをクリックすると同時に該当する作業の情報修正が可能です。<br>
        			    作業を完了したらUpdateボタンを押し、Cancelボタンを押せば取り消すことが可能です。
        			  </p>
        			</li>
        		  </ul>
        		</div>
        		<h3>チャット</h3>
        		<div class="details">
        		  <ul>
        		  	<li>
        		  	  <i class="subject">チャット</i>
        		  	  <p>
        		  	  	現在接続している人員のリストを表示します。<br>
        		  	  	接続者をクリックするとチャットページへ移ります。
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