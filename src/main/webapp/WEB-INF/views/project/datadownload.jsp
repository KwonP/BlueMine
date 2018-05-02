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

<!-- jQuery -->
	<script
		src="../resources/templet/vendor/jquery/jquery.min.js"></script>
<script
	src="../resources/templet/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core CSS -->
<link href="../resources/templet/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../resources/templet/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="../resources/templet/dist/css/sb-admin-2.css"
	rel="stylesheet">
<link href="../resources/css/basic.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="../resources/templet/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- modified CSS -->
<!-- <link href="../resources/css/timeline.css" rel="stylesheet"> -->
<!-- JS -->
<!-- <script type="text/javascript" src="../resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../resources/js/timeline.js"></script> -->
<%-- <%--알림 js 
	<script src="../resources/toastr/toastr.min.js"></script>
	<link href="../resources/toastr/toastr.css" rel="stylesheet">
	<script src="../resources/js/webWorkerStart.js"></script>
	<script src="../resources/js/worker.js"></script> --%>
	<!-- 
	<style>
<script src="../resources/toastr/toastr.min.js"></script>
<link href="../resources/toastr/toastr.css" rel="stylesheet">
<script src="../resources/js/webWorkerStart.js"></script>
<script src="../resources/js/worker.js"></script> -->

<style>
#orgFile {
	display: none;
}
#page-wrapper{
    position: relative;
    width: 1260px;
    left: 250px;
}
.panel-body {
	width: 240px;
	height: 240px;
}

.col-lg-4 {
    width: unset;
	width: unset;
}

img{
    width: 100%;
    height: 100%;
}

#a{
	margin-right: 18px;
	margin-left: 18px;
}
#profileImg img {
    width: 40px;
    height: 40px;
}
.form-control{ width: 300px;}
</style>
	<script>
	$(document).ready(function() {
    	$("#keyword").keyup(function() {
    		var k = $(this).val();
        	$(".user-table > .row > #a > #b").hide();
        	var temp = $(".user-table > .row > #a > #b > .panel-heading:contains('" + k + "')");

        	$(temp).parent().show();
    	});
	});

	/**이벤트 발생 (크롬,파이어폭스,사파이어 OK!) **/
	function eventOccur(evEle, evType) {
		if (evEle.fireEvent) {
			evEle.fireEvent('on' + evType);
		} else {
			//MouseEvents가 포인트 그냥 Events는 안됨~ ??
			var mouseEvent = document.createEvent('MouseEvents');
			/* API문서 initEvent(type,bubbles,cancelable) */
			mouseEvent.initEvent(evType, true, false);
			var transCheck = evEle.dispatchEvent(mouseEvent);
			if (!transCheck) {
				//만약 이벤트에 실패했다면
				console.log("클릭 이벤트 발생 실패!");
			}
		}
	}
	
	/** 대체버튼 클릭시 강제 이벤트 발생**/
	function check() {
		eventOccur(document.getElementById('orgFile'), 'click');
		/* alert(orgFile.value); 이벤트 처리가 끝나지 않은 타이밍이라 값 확인 안됨! 시간차 문제 */
	}
	
	function submitFile() {
		document.getElementById("fileForm").submit();
		
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
				<a class="navbar-brand" href="../goToMain">BLUE MINE</a>
				<a class="companyInfo" value="../about">About</a>
				<a class="companyInfo" value="../contact">Contact Us</a>
				<a class="companyInfo" value="../help">Help</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="noticeCheck">
                        <i class="fa fa-bell fa-fw" id="bell"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul id="notificationList" class="dropdown-menu dropdown-alerts">
                       
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="profileImg">
                      <img src="../showProfile" width="50px">
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
            <!-- /.navbar-top-links -->
        <div class="navbar-default sidebar" role="navigation"> 
                <div class="sidebar-nav navbar-collapse"> 
                    <ul class="nav" id="side-menu"> 
                        <li> 
                            <a href="../goToMain"><i class="fa fa-desktop fa-fw"></i> Main Page</a> 
                        </li> 
                        <li> 
                            <a href="../project/timeline"><i class="fa fa-paper-plane-o fa-fw"></i> Timeline</a> 
                        </li> 
                        <li> 
                          <a href="../data/filePrint"><i class="fa fa-edit fa-fw"></i> Data Download</a> 
                        </li> 
                        <li> 
                            <a href="../task/taskMain"><i class="fa fa-paste fa-fw"></i> Task</a> 
                        </li>
                        <li> 
                            <a href="../gantt/chart"><i class="fa fa-paste fa-fw"></i> Gantt Chart</a> 
                        </li>  
                        <li> 
                            <a href="../inside/broadcast"><i class="fa fa-comments fa-fw"></i> Chats</a> 
                        </li> 
                       </li>
                    </ul> 
                </div> 
                <!-- /.sidebar-collapse --> 
            </div> 
            <!-- /.navbar-static-side --> 
        </nav> 
			
		<div id="page-wrapper" class="user-table">
			<div class="row">
				<div class="col-lg-12">
					<form action="fileUpload" id="fileForm" method="post" enctype="multipart/form-data">
						<input type="file" multiple="multiple" id="orgFile" name="upload" onchange="submitFile()" size="30">
						<button style="margin-top: 23px;" class="btn btn-default" type="button" onclick="check()">
							<i class="fa fa-upload" style="margin-right: 10px;"></i>File Upload
						</button>
					</form>
					<span style="float: center;"><input type="text" style="margin-top: 23px;" class="form-control" placeholder="Search..." id="keyword" /></span>					
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Image Files</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<%-- 프로젝트마다의 파일을 가져오기 --%>
			<div class="row">
				<c:forEach var="i" items="${imagelist}">
					<div id="a" class="col-lg-4">
						<div id="b" class="panel panel-primary">
							<div class="panel-heading">${i.originalFile }</div>  
							<div class="panel-body">
								<img src="download?originalFile=${i.originalFile}">
							</div>
							<div class="panel-footer" >
								<div class="btn-group" data-toggle="buttons">
									<button class="btn btn-default" onclick="location.href='download?originalFile=${i.originalFile}'">다운로드</button>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->
		
		<div id="page-wrapper" class="user-table">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Text Files</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<%-- 프로젝트마다의 파일을 가져오기 --%>
			<div class="row">
				<c:forEach var="i" items="${textlist}">
					<div id="a" class="col-lg-4">
						<div id="b" class="panel panel-primary">
							<div class="panel-heading">${i.originalFile }</div>
							<div class="panel-body">
								<img src="../resources/img/text.png" width="50%" height="50%">
							</div>
							<div class="panel-footer" >
								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-default"> 
										<a href="download?originalFile=${i.originalFile}">다운로드</a>
									</label>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->
		
		<div id="page-wrapper" class="user-table">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Mp3 Files</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<%-- 프로젝트마다의 파일을 가져오기 --%>
			<div class="row">
				<c:forEach var="i" items="${mp3list}">
					<div id="a" class="col-lg-4">
						<div id="b" class="panel panel-primary">
							<div class="panel-heading">${i.originalFile }</div>
							<div class="panel-body">
								<img src="../resources/img/mp3.png" width="50%" height="50%">
							</div>
							<div class="panel-footer" >
								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-default"> 
										<a href="download?originalFile=${i.originalFile}">다운로드</a>
									</label>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
	
	<!-- Bootstrap Core JavaScript -->
	<script src="../resources/templet/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../resources/templet/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../resources/templet/dist/js/sb-admin-2.js"></script>
	
	

	<!-- <script type="text/javascript">
	$(document).ready(function() {
        /* $(".dropdown img.flag").addClass("flagvisibility");*/
	    	$('.btn-example').click(function(){
				$('#timeLineContent').val('');
		        var $href = $(this).attr('href');
		        $('#btn-add').off('click');
		        $('#btn-add').on('click',insertTimeLine);
		        $('#btn-add').text('Add');
		        layer_popup($href);
		    });
	    	$('#btn-add').on('click',insertTimeLine);
	    	$('#tlDelete').on('click',);
	    	workerStart(${loginId});
     });
	function workerStart(){
		var w;
		console.log('webwork실행');
		if(typeof(Worker)!='nudefined'){
			console.log('Webwork가 정의된 상태(webworker 사용가능 브라우저)');
			if(typeof(w)=='nudefined'){
				console.log('webwork 생성');
				w = new Worker('worker.js');
			}
			w.onmessage = function(response){
				console.log('알림정보 가져옴');
				alert("postmessage동작" + response);
			};
		}else{
			alert("웹 워커를 사용할 수 없습니다.");
		}
	}
	
	function updateStep($href,tl_Num){
        $('#timeLineContent').val($('#tlText'+tl_Num).text());
        $('#TLNumber').val(tl_Num);
        $('#btn-add').off('click');
        $('#btn-add').on('click',updateTL);
        $('#btn-add').text('Update');
        layer_popup($href);
    }
	function deleteStep(tl_Num){
        if(confirm('정말로 지우시겠습니까?')==true){
        	deleteTimeLine(tl_Num);
        }
    }
	
		
	    function layer_popup(el){

	        var $el = $(el);        //레이어의 id를 $el 변수에 저장
	        var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

	        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

	        var $elWidth = ~~($el.outerWidth()),
	            $elHeight = ~~($el.outerHeight()),
	            docWidth = $(document).width(),
	            docHeight = $(document).height();

	        // 화면의 중앙에 레이어를 띄운다.
	        if ($elHeight < docHeight || $elWidth < docWidth) {
	            $el.css({
	                marginTop: -$elHeight /2,
	                marginLeft: -$elWidth/2
	            })
	        } else {
	            $el.css({top: 0, left: 0});
	        }

	        $el.find('a.btn-layerClose').click(function(){
	            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
	            return false;
	        });

	        $('.layer .dimBg').click(function(){
	            $('.dim-layer').fadeOut();
	            return false;
	        });
	        
	        $(".timeLineContent").focusin(function() {
	        	$('.timeLineContent').addClass("selectArea"); 
	        });
	        $(".timeLineContent").focusout(function() {
	        	$('.timeLineContent').removeClass("selectArea"); 
	        });
	      

	    }
	    
		</script> -->
</body>

</html>