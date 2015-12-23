<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta HTTP-EQUIV="REFRESH" content="10; url=showLogin">
<title>CatSoFun</title>

<script src="/CatSoFun/js/jquery-1.11.3.min.js"></script>
<script src="/CatSoFun/js/bootstrap.min.js"></script>

<link href="/CatSoFun/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">

.radio:hover
	{
		background-color: #F5A9F2;
		font-size: 28px;
	}
body
	 { 
	 background-image: url(/CatSoFun/pic/.jpg);
	 background-size: cover;
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
			    <li><a href="#about">關於測驗</a></li>
			    <li><a href="#contact">聯絡我們</a></li>
			</ul>
			<form class="navbar-form navbar-right" role="search">
			</form>
		</div>
	</div>
</nav>   
<!-- END header -->   

<!-- BEGIN Content -->
<br><br><br><br><br>
<div class="row ">
	<div class="col-md-4 col-md-offset-4 thumbnail" style="font-family:Microsoft JhengHei; padding: 15px;text-align: center;">
		<h2>帳號或密碼錯誤!</h2>
		<h5>10秒後將自動導回登入頁! 您也可點選下列連結返回登入頁!</h5>
		<br>
		<button class="btn btn-info"><a href="/CatSoFun/frontend/showLogin">重新登入</a></button>
	</div>
</div>

<!-- END Content -->

<!-- BEGIN footer -->
<div class="navbar navbar-default navbar-fixed-bottom navbar-inverse">
	<div class="container">
		<p>Copyright ©2015 footer......</p>
	</div>
</div>
<!-- END footer -->

</body>
</html>