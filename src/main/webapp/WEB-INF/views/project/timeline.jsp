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
<link href="../resources/templet/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../resources/templet/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="../resources/templet/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="../resources/templet/vendor/morrisjs/morris.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="../resources/templet/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- modified CSS -->
<link href="../resources/css/timeline.css" rel="stylesheet">
<!-- JS -->
<script type="text/javascript" src="../resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../resources/js/timeline.js"></script>
<%--알림 js --%>

<script src="../resources/toastr/toastr.min.js"></script>
<link href="../resources/toastr/toastr.css" rel="stylesheet">
<script src="../resources/js/notificationList.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.companyInfo').click(menuPage);
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
    	updateCheck('${loginId}','../');
    	getNotice();
	});
	function menuPage(){
		var menuPage = $(this).attr('value');
		location.href = menuPage;
	}
	</script>

</head>

<body>
<div id="load">
	<img src="../resources/img/loading.gif" alt="loading">
</div>
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
                            <a href="#"><i class="fa fa-paper-plane-o fa-fw"></i> Timeline</a> 
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
 
        <div id="page-wrapper"> 
			<h1>プロジェクト<span id="projectName"></span> [ No.${prjNum} ] </h1>
			<div id="timeLineDiv"></div>
			<input type="hidden" id="getPrjNum" value="${prjNum}"> <input
				type="hidden" id="getUserId" value="${loginId}"> <input
				type="hidden" id="getSession" value="${sessionScope.loginId }">
		
			

		</div>


		<!-- /#page-wrapper -->

	</div>

	<div class="dim-layer">
		<div class="dimBg"></div>
		<div id="layer1" class="pop-layer">
			<div class="pop-container">
				<div class="pop-conts">
					<!--content //-->
					<table id="timeLineTable">
						<thead>

							<tr>
								<th>관리자</th>
								<td><span id="wirterName"></span> </td>
							</tr>


						</thead>
						<tbody>
							<tr>
								<th>내용</th>
								<td><textarea id="timeLineContent" class="timeLineContent"
										rows="5" cols="60" placeholder="타임라인 내용"></textarea></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td><input type="hidden" value="" id="TLNumber"></td>
							</tr>
						</tfoot>
					</table>
					<p class="ctxt mb20"></p>

					<div class="btn-r">
						<a href="#" class="btn-add" id="btn-add">Add</a> <a href="#"
							class="btn-layerClose">Close</a>
					</div>
					<!--// content-->
				</div>
			</div>
		</div>


	</div>
	<div class="dim-layer2">
		<div class="dimBg"></div>
		<div id="layer2" class="pop-layer">
			<div class="pop-container">
				<div class="pop-conts">
					<!--content //-->
					<table id="timeLineTable">
						<thead>
							<tr>
								<th>작성자</th>
								<td>${sessionScope.user.name}<input type="hidden"
									value="${loginId}" id="writer"></td>
							</tr>


						</thead>
						<tbody>
							<tr>
								<th>내용</th>
								<td><textarea id="timeLineContent" class="timeLineContent"
										rows="5" cols="60" placeholder="타임라인 내용"></textarea></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td><input type="hidden" id="TLNumber" value=""></td>
							</tr>
						</tfoot>
					</table>
					<p class="ctxt mb20"></p>

					<div class="btn-r">
						<a href="#" class="btn-add" id="btn-add">Add</a> <a href="#"
							class="btn-layerClose">Close</a>
					</div>
					<!--// content-->
				</div >
			</div>
		</div>


	</div>
	
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="../resources/templet/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../resources/templet/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../resources/templet/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="../resources/templet/vendor/raphael/raphael.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../resources/templet/dist/js/sb-admin-2.js"></script>


	<script type="text/javascript">

	function updateStep($href,tl_Num){
        $('#timeLineContent').val($('#tlText'+tl_Num).text());
        $('#TLNumber').val(tl_Num);
        $('#wirterName').text($('#writer'+tl_Num).val());
        $('#btn-add').off('click');
        $('#btn-add').on('click',updateTL);
        $('#btn-add').text('Update');
        layer_popup($href);
        
    }
	function deleteStep(tl_Num){
	    if(confirm('当に消しますか。')==true){
	    	deleteTimeLine(tl_Num);
	    }
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
			showNotice({trigger_Num : trigger_Num, info_Type : info_Type, info_Num:info_Num, info_Content:info_Content, update_Date:update_Date, command_Check:command_Check},'../');
			</c:forEach>
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
	    
	    
	    </script>
		<script src="../resources/js/worker.js"></script>

</body>

</html>