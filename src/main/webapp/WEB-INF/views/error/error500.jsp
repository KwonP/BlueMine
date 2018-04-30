<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.2.1.min.js"></script>
<script src="../resources/templet/vendor/bootstrap/js/bootstrap.min.js"></script>
<link href="../resources/templet/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.errorMsg{
    position: absolute;
    top: 50%;
    left: 50%;
    font-size: 30px;
    margin-left: -225px;
    margin-top: -240px;
    text-align: center;
}
h1{
	color:royalblue;
	font-size: 75px;	
    text-shadow: 2px 2px 5px #787171;
}
h1 span{
	font-size: 40px;
	color: grey;
}
h2{
	font-size: 40px;
}
h3{
	font-size: 35px;
}
</style>
<script type="text/javascript">
function back(){
	history.back();
}
</script>
</head>
<body>
<div class="errorMsg">
<h1>
	<span class="glyphicon glyphicon-link"></span>
	Blue Mine
</h1>
<h2>404 Error</h2>
<h3>Sorry, this page doesn't exist</h3>
<a class="back" onclick="back()">← Back</a>
</div>
</body>
</html>