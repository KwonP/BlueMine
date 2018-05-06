<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="resources/templet/vendor/bootstrap/js/bootstrap.min.js"></script>
	<link href="resources/templet/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Concert+One" rel="stylesheet"> <!-- 구글 Font -->
	<link href="resources/css/home.css" rel="stylesheet">
	<script type="text/javascript" src="resources/js/home.js"></script>
	<script type="text/javascript">
	$(window).on('load',(function() {
		$('#load').hide();
	}));
	</script>
	<style type="text/css">
	#load{
		width: 100%;
		height: 100%;
		top: 0;
		left: 0;
		position: fixed;
		display: block;
		opacity: 0.8;
		background: white;
		z-index: 99;
		text-align: center;
	}
	#load > img{
		position: absolute;
		top: 50%;
		left: 50%;
		margin-left: -100px;
  	  	margin-top: -115px;
		z-index: 100;
	}
	</style>
</head>
<body>
<div id="load">
	<img src="resources/img/loading.gif" alt="loading">
</div>
<div id="wrap"> 
	<h1>Welcome to <span class="highlight">BLUE MINE</span></h1>
	
	<!-- Main Selection -->
	<div class="selection">
		<button class="selectBtn" onclick="moveR()">ログイン</button> <br>
		<button class="selectBtn" onclick = "popup();">会員登録</button>
	</div>
	
	<!-- Login Form -->
	<div class="loginFormDiv">
	 <span class="glyphicon glyphicon-chevron-left" aria-hidden="true" onclick="moveL();"></span>
	  <table class="loginForm"  onkeydown="javascript:if(event.keyCode==13){login();}">
	  	<tr>
	  	 <td>E-mail : </td>
	  	 <td><input type="text" id="LoginEmail"></td>
	  	</tr>
	  	<tr>
	  	 <td>パスワード : </td>
	  	 <td><input type="password" id="passwordL"></td>
	  	</tr>
	  </table>
	   <button class="loginBtn" onclick="login();">Login</button>
	   <a class="findPw" onclick="findPopup()">Forgot Password?</a>
	</div>
	<!-- Find Password -->
	<div class="findInfo">
		<div id="findDiv" class="white_content">
		  <a onclick="findClose();">
        	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
		  </a>
		  <div class="findForm">
			E-mail : <input type="email" id="findInfo" autofocus="autofocus">
			<button onclick="mailCheck('find')">Find</button><br>
			<a onclick="sendInfo()" class="sendInfo">Send Password</a>
		  </div>
		</div>
	  <div id="popupBack" class="black_overlay"></div>
	</div>
	
	<!-- Join Popup -->
	<div class="join">
        <div id="joinPopup" class="white_content">
          <a href = "#" onclick="popupClose();">
        	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
          </a>
          <div class="step1">
            <div class="mailForm">
          	E-mail : <input type="email" id="emailC" onkeydown="checkAgain()" autofocus="autofocus">
          	<button onclick="mailCheck('join');">Check</button><br>
          	</div>
          	<div class="sendForm">
			  <a onclick="sendCode()" class="sendCode">認証番号発送</a><br> 
			  <div id="showTime"></div><input type="text" id="inputCode" placeholder="認証番号入力">
			  <a class="next" onclick="checkCode();">Next</a> 
				<input type="hidden" id="code" value="">
				<input type="hidden" id="again" value="">
			</div>
          </div>
		
			<!-- Show the join form step2-->
			<div class="joinFormDiv">
			 <form name="join">
			  <table class="joinForm">
			  	<tr>
			  	  <td>E-mail : </td>
			  	  <td><input type="text" id="email" value="" readonly="readonly"></td>
			  	  <td><a onclick="another();" class="another">他のメールアドレス</a></td>
			  	</tr>  
				<tr>
				  <td>Name ： </td>
				  <td><input type="text" id="name"></td>
				</tr>
				<tr>
				  <td>Password ： </td>
				  <td><input type="password" id="password"></td>
				</tr>
				<tr>
				  <td>Password ： <span>(check)</span></td>
				  <td><input type="password" id="passwordC"></td>
				</tr>
				<tr>
				  <td> 部署 ： </td>
				  <td>
				  	<select id="department">
				  	  <c:forEach var="dep" items="${dep_list}">
				  	  	<option class="options" value="${dep.typeAlias}" selected="selected">${dep.depNameKr}</option>
				  	  </c:forEach>
				  	</select>
				  </td>
				</tr>
				<tr>
				  <td>肩書き ：</td>
				   <td>
				  	<select id="position"> 
				  	  <c:forEach items="${position}" var="position">
				  	  	<option class="options">${position.positionName}</option>
				  	  </c:forEach>
				  	</select>
				  </td>
				</tr>
				<tr style="text-align: center;">
				  <td colspan="3"><a onclick="joinUser()">会員登録</a></td>
				</tr>
			  </table>
			 </form>
			</div>
        </div>
        
        <div id="popupBack" class="black_overlay"></div>
	</div>
</div>
</body>
</html>
