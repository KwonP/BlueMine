<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Concert+One" rel="stylesheet"> <!-- 구글 Font -->
	<link href="resources/css/home.css" rel="stylesheet">
	<script type="text/javascript" src="resources/js/home.js"></script>
</head>
<body>
<div id="wrap"> 
	<h1>Welcome to <span class="highlight">BLUE MINE</span></h1>
	
	<!-- Main Selection -->
	<div class="selection">
		<button class="selectBtn" onclick="moveR()">Login</button> <br>
		<button class="selectBtn" onclick = "popup();">Join</button>
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
	  	 <td>Password : </td>
	  	 <td><input type="password" id="passwordL"></td>
	  	</tr>
	  </table>
	   <button class="loginBtn" onclick="login();">Login</button>
	   <a class="findPw" href="#">Forgot Password?</a>
	</div>
	
	
	<!-- Join Popup -->
	<div class="join">
        <div id="joinPopup" class="white_content">
          <a href = "#" onclick="popupClose();">
        	<span class="glyphicon glyphicon-remove" aria-hidden="true" ></span>
          </a>
          <div class="step1">
            <div class="mailForm">
          	E-mail : <input type="email" id="emailC" onkeydown="checkAgain()" autofocus="autofocus">
          	<button onclick="mailCheck();">Check</button><br>
          	</div>
          	<div class="sendForm">
			  <a onclick="sendCode()" class="sendCode">인증번호 발송</a><br> 
			  <div id="showTime"></div><input type="text" id="inputCode" placeholder="인증번호 입력">
			  <a class="next" onclick="checkCode();">Next</a> 
				<input type="hidden" id="code" value="">
				<input type="hidden" id="again" value="">
			</div>
          </div>
		
			<!-- Show the join form step2-->
			<div class="joinFormDiv">
			  <table class="joinForm">
			  	<tr>
			  	  <td>E-mail : </td>
			  	  <td><input type="text" name="email" id="email" value="" readonly="readonly"></td>
			  	  <td><a onclick="another();" class="another">다른 이메일 고르기</a></td>
			  	</tr>  
				<tr>
				  <td>Name ： </td>
				  <td><input type="text" name="name" id="name"></td>
				</tr>
				<tr>
				  <td>Password ： </td>
				  <td><input type="password" name="password" id="password"></td>
				</tr>
				<tr>
				  <td> Department ： </td>
				  <td>
				  	<select>
				  		<option>marketing</option>
				  		<option>test</option>
				  	</select>
				  </td>
				</tr>
				<tr>
				  <td>Position ：</td>
				  <td>
				  	<select>
				  		<option>staff</option>
				  		<option>boss</option>
				  	</select>
				  </td>
				</tr>
			  </table>
			</div>
        </div>
        
        <div id="popupBack" class="black_overlay"></div>
	</div>
</div>
</body>
</html>
