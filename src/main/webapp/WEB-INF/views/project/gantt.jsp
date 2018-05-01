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
<script type="text/javascript" src="../resources/js/jquery-3.2.1.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../resources/templet/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="../resources/templet/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="../resources/templet/vendor/raphael/raphael.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="../resources/templet/dist/js/sb-admin-2.js"></script>

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
<link href="../resources/css/basic.css" rel="stylesheet">
<!-- JS -->
<script type="text/javascript">
	$(document).ready(function() {
		$('.companyInfo').click(menuPage);
	});
	function menuPage() {
		var menuPage = $(this).attr('value');
		location.href = menuPage;
	}
</script>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'gantt' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {

		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Task ID');
		data.addColumn('string', 'Task Name');
		data.addColumn('string', 'Resource');
		data.addColumn('date', 'Start Date');
		data.addColumn('date', 'End Date');
		data.addColumn('number', 'Duration');
		data.addColumn('number', 'Percent Complete');
		data.addColumn('string', 'Dependencies');

		var groupList = [];
		var oncomlist = [];
		var allgpworklist = [];
		var gsnamelist = [];
		var startdateList = [];
		var deadlineList = [];

		<c:forEach items="${groupList}" var="item">

		groupList.push("${item}");

		</c:forEach>

		<c:forEach items="${onComList}" var="item">

		oncomlist.push("${item}");

		</c:forEach>

		<c:forEach items="${allGpworkList}" var="item">

		allgpworklist.push("${item}");

		</c:forEach>

		<c:forEach items="${gsnameList}" var="item">

		gsnamelist.push("${item}");

		</c:forEach>

		<c:forEach items="${startdateList}" var="item">

		startdateList.push("${item}");

		</c:forEach>

		<c:forEach items="${deadlineList}" var="item">

		deadlineList.push("${item}");

		</c:forEach>

		var temp1 = [];
		var temp2 = [];
		var temp3 = [];
		var temp4 = [];
		var inside = [];
		for (var i = 0; i < allgpworklist.length; i++) {
			temp1 = startdateList[i].split(', ');
			temp2.push(parseInt(temp1[0]));
			temp2.push(parseInt(temp1[1]));
			temp2.push(parseInt(temp1[2]));
			temp3 = deadlineList[i].split(', ');
			temp4.push(parseInt(temp3[0]));
			temp4.push(parseInt(temp3[1]));
			temp4.push(parseInt(temp3[2]));
			if (oncomlist[i] == "Completed") {
				if (i == allgpworklist.length - 1) {
					inside.push([ gsnamelist[i], gsnamelist[i], groupList[i],
							new Date(temp2[0], temp2[1], temp2[2]),
							new Date(temp4[0], temp4[1], temp4[2]), null, 100,
							null ]);
				} else {
					inside.push([ gsnamelist[i], gsnamelist[i], groupList[i],
							new Date(temp2[0], temp2[1], temp2[2]),
							new Date(temp4[0], temp4[1], temp4[2]), null, 100,
							null ]);
				}
			} else {
				if (i == allgpworklist.length - 1) {
					inside.push([ gsnamelist[i], gsnamelist[i], groupList[i],
							new Date(temp2[0], temp2[1], temp2[2]),
							new Date(temp4[0], temp4[1], temp4[2]), null, 0,
							null ]);
				} else {
					inside.push([ gsnamelist[i], gsnamelist[i], groupList[i],
							new Date(temp2[0], temp2[1], temp2[2]),
							new Date(temp4[0], temp4[1], temp4[2]), null, 0,
							null ]);
				}
			}

			temp1.splice(0, 3);
			temp2.splice(0, 3);
			temp3.splice(0, 3);
			temp4.splice(0, 3);
		}

		data.addRows(inside);

		var options = {
			height : 400,
			gantt : {
				trackHeight : 30
			}
		};

		var chart = new google.visualization.Gantt(document
				.getElementById('chart_div'));

		chart.draw(data, options);
	}
</script>
</head>

<body>
	<br><br><br><br><br><br><br><br><br>
	<div id="chart_div"></div>

</body>

</html>