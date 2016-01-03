<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html, charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CatSoFun Admin System</title>

<script src="/CatSoFun/js/jquery-1.11.3.min.js"></script>
<script src="/CatSoFun/js/bootstrap.min.js"></script>
<script src="/CatSoFun/js/jquery.dataTables.min.js"></script>

<link href="/CatSoFun/css/bootstrap.min.css" rel="stylesheet">
<link href="/CatSoFun/css/jquery.dataTables.min.css" rel="stylesheet">
<link href="/CatSoFun/css/font-awesome-4.4.0/css/font-awesome.min.css"
	rel="stylesheet">
<style type="text/css">
body {
	padding-top: 60px;
	background-color: #27272b;
}

.toggleBtn {
	position: relative;
	float: right;
	top: -5px;
	right: -10px;
	border: 1px solid gray;
	border-radius: 4px;
}
</style>
</head>

<body>
    <div id="wrapper">
        <div>
            <!-- Fixed navbar -->
            <nav class="navbar navbar-inverse navbar-fixed-top">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index.html">CatSoFun Admin</a>
                    </div>
                    <div id="navbar" class="collapse navbar-collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a target="getAllRecord">查詢作答結果</a></li>
                            <li><a target="createAccount">新增帳號</a></li>
                            <li><a target="goToCatSoFun">前往CatSoFun</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">

                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" 
                                   role="button" aria-haspopup="true" 
                                   aria-expanded="false">
                                    <i class="fa fa-fw fa-user"></i>
                                    <span id="loginRole">Admin</span>
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="logout" class="">
                                            <i class="fa fa-sign-out"></i>
                                            登出
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->

                </div>
            </nav>
        </div>


        <div class="container animated fadeIn">
            <div class="row">
                <div class="col-md-9 container-right animated fadeIn">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <i class="fa fa-fw fa-table"></i><span class="left5">查詢所有資料</span>                          
                                <a class="btn btn-default btn-sm toggleBtn" data-toggle="collapse" data-parent="#listPanel" id="allRecordBtn" href="#recordPanel" ><i class="fa fa-fw fa-bars"></i></a>
                            </h4>

                        </div>
                        <div id="recordPanel" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table class="table table-hover table-condensed" id="recordTable" width="100%">
                                <thead>
                                    <tr>
                                        <th>序號</th>
                                        <th>能力估計值</th>
                                        <th>初始能力值</th>
                                        <th>估計標準誤</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                </table>
                        </div>
                        <!-- .panel-body -->
                    </div>
                    <!-- #gamePanel -->
                </div>
            </div>

            <div class="col-md-3 container-left">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <i class="fa fa-fw fa-table"></i><span class="left10">新增帳號</span>
                            <a class="btn btn-default btn-sm toggleBtn" id="accountBtn" data-toggle="collapse" data-parent="#listPanel" href="#accountPanel"><i class="fa fa-fw fa-bars"></i></a>
                        </h4>
                    </div>
                    <div id="accountPanel" class="panel-collapse collapse">
                        <div class="panel-body">
                            <form id="addUserForm">
                                <div width="100%">
                                    <label>帳號：</label><input name="username">
                                    <label>密碼：</label><input name="password">
                                </div>
                            </form>
                            <div>
	                            <button class="btn btn-primary btn-sm" id="generateAcount">產生帳號密碼</button>
	                            <button class="btn btn-success btn-sm" id="addAcount">送出</button>
                            </div>
                        </div>
                        <!-- .panel-body -->
                    </div>
                    <!-- #gamePanel -->
                </div>
            </div>
            <!-- .container-left -->

        </div>
        <!-- .row -->
    </div>
    <!-- .container -->
    </div>
<!-- #wrapper -->

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

</body>
<script>
var $role = "${role.userName}";
$(document).ready(function(){
   $("a#allRecordBtn").trigger("click");
   $("a#accountBtn").trigger("click");
   
   checkLogin();
   getAllRecord();
});

function checkLogin() {
	if($role == null || $role.length == 0 ) {
		window.location = "logout";
	} else {
		$("span#loginRole").text($role);
	}
}

function getAllRecord() {
	$.ajax({
		type : "POST",
		url : "getAllRecord.action",
		dataType : "text", //ajax返回值設定為text
		success : function(data) {
			var jsonData = $.parseJSON(data); //解析json
			
			if (jsonData != null) {
				generateDataTable(jsonData);
			}
			$('#recordTable').DataTable();
		}
	});
}

function generateDataTable(jsonData) {
	$.each(jsonData.recordList, function(index, data) {
    	var $tr = $("<tr width='100%'>");
		    	
    	$tr.append($("<td>").html(data.id));
    	$tr.append($("<td>").html(data.ability));
    	$tr.append($("<td>").html(data.initAbility));
    	/**
    	var selectedItems='';
    	for(var key in data.selectedItems){
    		if(key == 0) {
    			selectedItems = data.selectedItems[key];
    		} else {
    			selectedItems += "," + data.selectedItems[key];
    		}
    	}
    	$tr.append($("<td>").html(selectedItems));
    	*/
    	
    	/**
    	var selectedOptions='';
    	for(var key in data.selectedOptions){
    		if(key == 0) {
    			selectedOptions = data.selectedOptions[key];
    		} else {
    			selectedOptions += "," + data.selectedOptions[key];
    		}
    	}
    	$tr.append($("<td>").html(selectedOptions));
    	*/
    	
    	$tr.append($("<td>").html(data.sem));
    	//$tr.append($("<td>").html(data.testCompleteTime/1000));
    	
    	$('table#recordTable > tbody:last').append($tr);
	});
}

$("button#generateAcount").on("click",function(){
	
});

$("button#addAcount").on("click",function(){
	
});


function logout() {
	  window.location = "logout.action";
}
</script>


</html>
