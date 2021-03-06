<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width; initial-scale=1.0">
<!-- icon -->
<link href='/CatSoFun/images/icon/cat_icon.png' rel='icon' type='image/x-icon'/>

<title>CatSoFun</title>

<script src="/CatSoFun/js/jquery-1.11.3.min.js"></script>
<script src="/CatSoFun/js/bootstrap.min.js"></script>

<link href="/CatSoFun/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
.radio:hover {
	background-color: #F5A9F2;
	font-size: 28px;
}

body {
	background: -webkit-radial-gradient(ellipse,gray,black);
	background: -o-radial-gradient(ellipse,gray,black);
	background: -moz-radial-gradient(ellipse,gray,black);
	background: radial-gradient(ellipse,gray,black);
}
</style>
 
</head>
<body>

<!-- BEGIN header -->
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
	<div class="container">
		<div class="navbar-header">
		  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
		    <span class="sr-only">Toggle navigation</span>
		    <span class="icon-bar"></span>
		    <span class="icon-bar"></span>
		    <span class="icon-bar"></span>
		  </button>
		  <a class="navbar-brand" href="#">CatSoFun</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
<!-- 			    <li><a href="#about">關於測驗</a></li> -->
<!-- 			    <li><a href="#contact">聯絡我們</a></li> -->
			</ul>
			<form class="navbar-form navbar-right" role="search">
			</form>
		</div>
	</div>
</nav>   
<!-- END header -->   

<!-- BEGIN Content -->

<br><br><br><br><br>
<div class="row" style="opacity:0.9;">
	
	<div class="col-xs-10 col-xs-offset-1 col-md-4 col-md-offset-4 thumbnail" style="font-family:Microsoft JhengHei; padding: 15px; margin-top: 80px;">
		<form method="POST" class="form-signin" role="form" action="login" target="">
			<h2 class="form-signin-heading">請登入帳密</h2>
			<label for="inputUserName" class="sr-only">UserName</label> 
			<input type="text" id="inputUserName" name="loginId" class="form-control" placeholder="UserName" required="" autofocus=""> 
			<label for="inputPassword" class="sr-only">Password</label> 
			<input type="password" id="inputPassword" name="pwd" class="form-control" placeholder="Password" required="">
<!-- 			<div class="checkbox"><label> <input type="checkbox" value="remember-me"> Remember me </label></div> -->
			<button class="btn btn-primary btn-block" type="submit" style="margin-top: 20px;">登入</button>
		</form>
	</div>

</div>

<!-- END Content -->

<!-- BEGIN footer -->
<div class="navbar navbar-default navbar-fixed-bottom navbar-inverse">
	<div class="container">
		<p style="color: white;">Copyright by Allen Chen & Billy Shih   ©2015</p>
	</div>
</div>
<!-- END footer -->


<script>
$(document).ready(function(){

});
	
</script>

</body>
</html>