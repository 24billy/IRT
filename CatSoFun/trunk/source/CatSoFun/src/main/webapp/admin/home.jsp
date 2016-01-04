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
<c:if test="${role != null}">
    <div id="wrapper">
        <div>
            <nav class="navbar navbar-inverse navbar-fixed-top">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="goHome">CatSoFun Admin</a>
                    </div>
                    <div id="navbar" class="collapse navbar-collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="/CatSoFun/mock">前往CatSoFun</a></li>
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
                </div>
            </nav>
        </div>

        <div class="container animated fadeIn">
            <div class="row">
                <div class="col-md-9 container-right animated fadeIn">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <i class="fa fa-fw fa-table"></i><span class="left5">查詢所有作答結果</span>                          
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
                                        <th>估計標準誤</th>
                                        <th>作答時間</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                </table>
                        	</div>
	                    </div>
	                </div>
	            </div>
	
	            <div class="col-md-3 container-right">
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
									</div>
	                            </form>
	                            <div>
		                            <button class="btn btn-primary btn-sm" id="generateAcount" disabled><del>產生帳號密碼</del></button>
		                            <button class="btn btn-success btn-sm" id="addAcount">送出</button>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
				<div class="col-md-3 container-right">
	                <div class="panel panel-default">
	                    <div class="panel-heading">
	                        <h4 class="panel-title">
	                            <i class="fa fa-fw fa-table"></i><span class="left10">查詢所有帳號</span>
	                            <a class="btn btn-default btn-sm toggleBtn" id="roleBtn" data-toggle="collapse" data-parent="#listPanel" href="#rolePanel"><i class="fa fa-fw fa-bars"></i></a>
	                        </h4>
	                    </div>
	                    <div id="rolePanel" class="panel-collapse collapse">
	                        <div class="panel-body">
	                            <table class="table table-hover table-condensed" id="roleTable" width="100%">
	                                <thead>
	                                    <tr>
	                                        <th>帳號名稱</th>
	                                        <th>密碼</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                </tbody>
                                </table>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
    	</div>
    </div>

<!-- messageButton -->    
<button id="messageButton" type="button" style="display: none;"
                            class="btn btn-info btn-lg right" data-toggle="modal"
                            data-target="#messageDialog"></button>
<!-- #wrapper -->

<!-- Modal -->
<div id="messageDialog" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="text-danger" id="errorMessage" style="display:none;">

                </h4>
                <h4 class="text-success" id="successMessage" style="display:none;">

                </h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">關閉</button>
            </div>
        </div>

    </div>
</div>

</c:if>
</body>
<script>
var $role = "${role.userName}";
$(document).ready(function(){
	checkLogin();
	
	$("a#allRecordBtn").trigger("click");
   	$("a#accountBtn").trigger("click");
   
   	getAllRecord();
	getAllUser();
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
				generateRecordDataTable(jsonData);
			}
			$('#recordTable').DataTable({
				'sDom' : 'tip',
				'bFilter' : false,
				"aaSorting" : [[ 0, "asc" ]]
			});
		}
	});
}

function generateRecordDataTable(jsonData) {
	$.each(jsonData.recordList, function(index, data) {
    	var $tr = $("<tr width='100%'>");
		    	
    	$tr.append($("<td>").html(data.id));
    	$tr.append($("<td>").html(data.ability));
    	$tr.append($("<td>").html(data.sem));
    	$tr.append($("<td>").html(data.testCompleteTime/1000 + "秒"));
    	
    	$('table#recordTable > tbody:last').append($tr);
	});
}

function getAllUser() {
	$.ajax({
		type : "POST",
		url : "getAllUser.action",
		dataType : "text", //ajax返回值設定為text
		success : function(data) {
			var jsonData = $.parseJSON(data); //解析json

			if (jsonData != null) {
				generateUserDataTable(jsonData);
			}
		}
	});
}

function generateUserDataTable(jsonData) {
	$('table#roleTable > tbody').html('');
	
	$.each(jsonData.roleList, function(index, data) {
    	var $tr = $("<tr width='100%'>");
	    	if(data.id >= 4) {
	        	$tr.append($("<td>").html(data.userName));
	        	$tr.append($("<td>").html(data.userPassword));
	        	
	        	$('table#roleTable > tbody:last').append($tr);		
	    	}
	});
}

$("button#generateAcount").on("click",function(){
	
});

$("button#addAcount").on("click",function(){
	var isPass = validator();
	
	if (isPass) {
		var username = $("form#addUserForm div input[name=username]").val();
		var password = $("form#addUserForm div input[name=password]").val();

		var params = {};
			params.username = username;
			params.password = password;
			
			$.ajax({
				type : "POST",
				url : "addUser.action",
				data : params,
				dataType : "text", //ajax返回值設定為text
				success : function(json) {
					var obj = $.parseJSON(json); //解析json
					
					if (obj.isSuccess) {
						$('h4#successMessage').show();
			            $('h4#successMessage').html("新增(帳號/密碼)成功：" + obj.username + "," + obj.password);
			            $("button#messageButton").trigger("click");
			            
			            getAllUser();
					} else {
						$("#nameInput").addClass("has-error");
						$('h4#errorMessage').show();
				        $('h4#errorMessage').html(obj.username + ":" + obj.errorMessage);
				        $("button#messageButton").trigger("click");
					}
				},
				error : function(json) {
					return false;
				}
			});
	}
});

function logout() {
	  window.location = "logout.action";
}

function validator() {
	$('h4#successMessage').html("");
	$('h4#errorMessage').html("");
	
    var username = $("input[name=username]").val();
    var password = $("input[name=password]").val();
    var isPass = true;
    
    if (username == null || username == undefined || username == '') {
        isPass = false;
        $("#nameInput").addClass("has-error");
    } else {
        $("#nameInput").removeClass("has-error");
    }

    if (password == null || password == undefined || password == '') {
        isPass = false;
        $("#pwdInput").addClass("has-error");
    } else {
        $("#pwdInput").removeClass("has-error");
    }
    
    if (!isPass) {
    	$('h4#errorMessage').show();
        $('h4#errorMessage').html("帳號與密碼不得為空");
        $("button#messageButton").trigger("click");
        
        return false;
    }
    
    return true;
}

function clearMessage() {
	$('h4#errorMessage').hide();
    $('h4#successMessage').hide();
}
</script>


</html>
