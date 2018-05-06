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
 	<link href="./resources/css/contact.css" rel="stylesheet">
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
          <div class="firstLine">
          	<div class="col-lg-4">
			<div class="panel panel-primary">
			  <div class="panel-body">
			  	<img class="img-rounded" src="./resources/img/kjh.jpg" width="160" height="220">
			  	<ul class="personal">
			  	  <li>名前 : ギョン　ジュンヒョン</li>
			  	  <li>自信ある分野</li>
			  	  <li> - アルゴリズム</li>
			  	  <li> - アンドロイド</li>
			  	  <li>asd8680@naver.com</li>
			  	</ul>
			  </div>
			  <div class="panel-footer">
			  	<i>ファイルダウンロード, ガントチャート, CSS担当</i>
			  </div>
			</div>          	
          	</div>
          	<div class="col-lg-4">
          	<div class="panel panel-primary">
			  <div class="panel-body">
			  	<img class="img-rounded" src="./resources/img/khh.jpg" width="160" height="220">
			  	<ul class="personal">
			  	  <li>名前 : キム　フンヒ</li>
			  	  <li>自信ある分野 </li>
			  	  <li> - ゲーム開発</li>
			  	  <li> - 様々なプログラミング言語</li>
			  	  <li>hulove7@naver.com</li>
			  	</ul>
			  </div>
			  <div class="panel-footer">
			  	<i>チャット, ログインリスト, CSS 担当</i>
			  </div>
			</div>
          	</div>
          </div>
          <div class="secondLine">
			<div class="col-lg-4">
			<div class="panel panel-primary">
			  <div class="panel-body">
			  	<img class="img-rounded" src="./resources/img/khj.jpg" width="160" height="220">
			  	<ul class="personal">
			  	  <li>名前 : キム　ヘジ</li>
			  	  <li>自信ある分野</li>
			  	  <li> - AJAX</li>
			  	  <li> - Java coding</li>
			  	  <li>hazel22kim@gmail.com</li>
			  	</ul>
			  </div>
			  <div class="panel-footer">
			  	<i>ログイン, My Schedule, CSS 担当</i>
			  </div>
			</div>   
			</div>          
			<div class="col-lg-4">
			<div class="panel panel-primary">
			  <div class="panel-body">
			  	<img class="img-rounded" src="./resources/img/pdh.jpg" width="160" height="220">
			  	<ul class="personal">
			  	  <li>名前 : パク　デホ</li>
			  	  <li>自信ある分野</li>
			  	  <li> - JavaScript</li>
			  	  <li> - 自動化システム</li>
			  	  <li>qkreogh1209@gmail.com</li>
			  	</ul>
			  </div>
			  <div class="panel-footer">
			  	<i>Timeline, お知らせ機能, CSS 担当</i>
			  </div>
			</div>   
			</div>
			<div class="col-lg-4">
			<div class="panel panel-primary">
			  <div class="panel-body">
			  	<img class="img-rounded" src="./resources/img/pcg.jpg" width="160" height="220">
			  	<ul class="personal">
			  	  <li>名前 : パク　チャンゴン</li>
			  	  <li>自信ある分野</li>
			  	  <li> - 日本語（ビジネスレベル）</li>
			  	  <li> - Java Script, Java</li>
			  	  <li>ckdrnjs513@gmail.com</li>
			  	</ul>
			  </div>
			  <div class="panel-footer">
			  	<i>データベースの設計と構築、 プロジェクトとグループの生成, CSS 担当</i>
			  </div>
			</div>   
			</div>
          </div>
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