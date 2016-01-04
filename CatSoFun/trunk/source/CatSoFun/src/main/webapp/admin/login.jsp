<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>CatSoFun Admin System</title>
	
	<script src="/CatSoFun/js/jquery-1.11.3.min.js"></script>
	<script src="/CatSoFun/js/bootstrap.min.js"></script>
	
	<link href="/CatSoFun/css/bootstrap.min.css" rel="stylesheet">
	<link href="/CatSoFun/css/font-awesome-4.4.0/css/font-awesome.min.css"
		rel="stylesheet">
		
	<style type="text/css">
		body {
			padding-top:40px;
			background-color: #27272b;
		}
	</style>
</head>

<body>
    <div id="wrapper">
        <div class="container animated fadeIn">
            <div class="row">
                <div class="col-sm-12">
                    <h1 id="loginTitle" class="text-center">
                        <div class="left5" style="color: white;">
                            <i class="fa fa-fw fa-beer"></i>CatSoFun Admin
                        </div>
                    </h1>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-8 col-xs-offset-2">
                    <form role="form" id="loginForm" action="login" method="post">
                        <div class="form-group" id="nameInput">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-fw fa-user"></i>
                                </span> 
                                <input name="username" type="text" class="form-control"
                                       placeholder="username">
                            </div>
                        </div>
                        <div class="form-group" id="pwdInput">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-fw fa-key"></i>
                                </span>
                                <input name="password" type="password"
                                       class="form-control" placeholder="password">
                            </div>
                        </div>
                        
                        <button type="submit" id="formSubmit" style="display: none;">                                   </button>
                    </form>
                    <button id="messageButton" type="button" style="display: none;"
                            class="btn btn-info btn-lg right" data-toggle="modal"
                            data-target="#messageDialog"></button>
                    <button class="btn btn-success pull-right" id="loginButton">
                        <i class="fa fa-fw fa-sign-in"></i><span class="left5">登入</span>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div id="messageDialog" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="text-danger">
                        <span id="idBlank">帳號</span>
                        <span id="pwdBlank">密碼</span>
                        	不得為空
                    </h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">關閉</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        (function($) {
            $('#username').focus();
            $("#loginButton").click(function() {
                validator();
            });
        })(jQuery);

        function validator() {
            var username = $("input[name=username]").val();
            var password = $("input[name=password]").val();
            var isPass = true;

            if (username == null || username == undefined || username == '') {
                isPass = false;
                $("#nameInput").addClass("has-error");
                $('#idBlank').show();
            } else {
                $("#nameInput").removeClass("has-error");
                $('#idBlank').hide();
            }

            if (password == null || password == undefined || password == '') {
                isPass = false;
                $("#pwdInput").addClass("has-error");
                $('#pwdBlank').show();
            } else {
                $("#pwdInput").removeClass("has-error");
                $('#pwdBlank').hide();
            }

            if (isPass) {
                $("button#formSubmit").trigger("click");
            } else {
                $("button#messageButton").trigger("click");
            }
        }
    </script>
</body>
</html>
