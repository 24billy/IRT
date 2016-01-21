<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width; initial-scale=1.0">
<meta HTTP-EQUIV="REFRESH" content="10; url=showLogin">
<!-- icon -->
<link href='/CatSoFun/images/icon/cat_icon.png' rel='icon' type='image/x-icon'/>

<title>CatSoFun</title>

<script src="/CatSoFun/js/jquery-1.11.3.min.js"></script>
<script src="/CatSoFun/js/bootstrap.min.js"></script>

<link href="/CatSoFun/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
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
		  <a class="navbar-brand" href="/CatSoFun/frontend/showLogin">CatSoFun</a>
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
	<div class="col-xs-10 col-xs-offset-1 col-md-4 col-md-offset-4 thumbnail" style="font-family:Microsoft JhengHei; padding: 15px; margin-top: 80px; text-align: center;">
		<h2>帳號或密碼錯誤!</h2>
		<h4>10秒後將自動導回登入頁!</h4> 
		<h4>您也可點選下列連結返回登入頁!</h4>
		<br>
		<button class="btn btn-primary btn-block"><a href="/CatSoFun/frontend/showLogin" style="text-decoration:none; color: white;">重新登入</a></button>
	</div>
</div>

<!-- END Content -->

<!-- BEGIN footer -->
<div class="navbar navbar-default navbar-fixed-bottom navbar-inverse">
	<div class="container">
		<p style="color: white;">Copyright ©2015 footer......</p>
	</div>
</div>
<!-- END footer -->

</body>
</html>