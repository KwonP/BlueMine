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

<!-- Custom Fonts -->
<link
	href="../resources/templet/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<style>
#orgFile {
	display: none;
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
</style>
	 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	  <script type="text/javascript">
	    google.charts.load('current', {'packages':['gantt']});
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
	  	
	      var pglist = [];
	      var oncomlist = [];
	      var allgpworklist = [];
	      var gpnamelist = [];
	     
	      <c:forEach items="${pjgroupList}" var="item">

	      pglist.push("${item}");

	      </c:forEach>
	      
	      <c:forEach items="${onComList}" var="item">

	      oncomlist.push("${item}");

	      </c:forEach>
	      
	      <c:forEach items="${allGpworkList}" var="item">

	      allgpworklist.push("${item}");

	      </c:forEach>
	      
	      <c:forEach items="${gpnameList}" var="item">

	      gpnamelist.push("${item}");

	      </c:forEach>
	      
	      for (var i = 0; i < allgpworklist.length; i++) {
	    	  alert(gpnamelist[i]);
	    	  alert(gpnamelist[i]);
	    	  alert(pglist[i]);
	    	  alert(gpnamelist[i]);
	    	 
	    	  alert(allgpworklist[i].start_Date);
	    	 if(oncomlist[i] == "Completed") {
		    	 data.addRows([ gpnamelist[i], gpnamelist[i], pglist[i],  new Date(allgpworklist[i].start_Date),  new Date(allgpworklist[i].deadLine) , null, 100, null]);
	    	 } else {
	    		 data.addRows([ gpnamelist[i], gpnamelist[i], pglist[i],  new Date(allgpworklist[i].start_Date),  new Date(allgpworklist[i].deadLine) , null, 0, null]);
	    	 }
	      }
  		
	      /* data.addRows([
	        ['2014Spring', 'Spring 2014', 'spring',
	         new Date(2014, 2, 22), new Date(2014, 5, 20), null, 100, null],
	        ['2014Summer', 'Summer 2014', 'summer',
	         new Date(2014, 5, 21), new Date(2014, 8, 20), null, 100, null],
	        ['2014Autumn', 'Autumn 2014', 'autumn',
	         new Date(2014, 8, 21), new Date(2014, 11, 20), null, 100, null],
	        ['2014Winter', 'Winter 2014', 'winter',
	         new Date(2014, 11, 21), new Date(2015, 2, 21), null, 100, null],
	        ['2015Spring', 'Spring 2015', 'spring',
	         new Date(2015, 2, 22), new Date(2015, 5, 20), null, 50, null],
	        ['2015Summer', 'Summer 2015', 'summer',
	         new Date(2015, 5, 21), new Date(2015, 8, 20), null, 0, null],
	        ['2015Autumn', 'Autumn 2015', 'autumn',
	         new Date(2015, 8, 21), new Date(2015, 11, 20), null, 0, null],
	        ['2015Winter', 'Winter 2015', 'winter',
	         new Date(2015, 11, 21), new Date(2016, 2, 21), null, 0, null],
	        ['Football', 'Football Season', 'sports',
	         new Date(2014, 8, 4), new Date(2015, 1, 1), null, 100, null],
	        ['Baseball', 'Baseball Season', 'sports',
	         new Date(2015, 2, 31), new Date(2015, 9, 20), null, 14, null],
	        ['Basketball', 'Basketball Season', 'sports',
	         new Date(2014, 9, 28), new Date(2015, 5, 20), null, 86, null],
	        ['Hockey', 'Hockey Season', 'sports',
	         new Date(2014, 9, 8), new Date(2015, 5, 21), null, 89, null]
	      ]); */

	      var options = {
	        height: 400,
	        gantt: {
	          trackHeight: 30
	        }
	      };

	      var chart = new google.visualization.Gantt(document.getElementById('chart_div'));

	      chart.draw(data, options);
	    }
	</script>
</head>

<body>
	
	<div id="chart_div"></div>
	
	<!-- Bootstrap Core JavaScript -->
	<script src="../resources/templet/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../resources/templet/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../resources/templet/dist/js/sb-admin-2.js"></script>
	
	
</body>

</html>