<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html, charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- icon -->
<link href='/CatSoFun/images/icon/cat_icon_admin.png' rel='icon' type='image/x-icon'/>

<title>CatSoFun Admin System</title>

<script src="/CatSoFun/js/jquery-1.11.3.min.js"></script>
<script src="/CatSoFun/js/bootstrap.min.js"></script>
<script src="/CatSoFun/js/jquery.dataTables.min.js"></script>
<script src="/CatSoFun/js/excellentexport.min.js"></script>

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
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar"
							aria-expanded="false" aria-controls="navbar">
							<span class="sr-only"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span> <span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="goHome">CatSoFun Admin</a>
					</div>
					<div id="navbar" class="collapse navbar-collapse">
						<ul class="nav navbar-nav">
							<li class="active"><a
								href="/CatSoFun/frontend/showLogin.action">前往CatSoFun</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"> <i class="fa fa-fw fa-user"></i> 
								<span id="loginRole">Admin</span> 
								<span class="caret"></span>
								</a>
								<ul class="dropdown-menu">
									<li><a href="logout" class=""> <i
											class="fa fa-sign-out"></i> 登出
									</a></li>
								</ul></li>
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
									<a class="btn btn-default btn-sm toggleBtn"
										data-toggle="collapse" data-parent="#listPanel"
										id="allRecordBtn" href="#recordPanel"> <i
										class="fa fa-fw fa-bars"></i>
									</a>
								</h4>
							</div>
							<div id="recordPanel" class="panel-collapse collapse">
								<div class="panel-body">
									<table class="table table-hover table-condensed text-center"
										id="recordTable" width="100%">
										<thead>
											<tr>
												<th style="width: 10%;">個案序號</th>
												<th>能力值</th>
												<th>T分數</th>
												<th>估計標準誤</th>
												<th>信度</th>
												<th>施測題數</th>
												<th>作答時間</th>
												<th>施測時間</th>
												<th>施測者</th>
												<th>受測者</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
									<div class="panel panel-default">
										<div class="panel-body">
										<label>輸出Excel：</label>
										<a class="btn btn-success btn-xs" download="cat_currentPage_summary.xls"
											onclick="return ExcellentExport.excel(this, 'recordTable');">
											<i class="fa fa-fw fa-file-excel-o"></i> 施測結果摘要(當前頁面)
										</a>
										<a class="btn btn-success btn-xs" download="cat_summary.xls"
											onclick="return ExcellentExport.excel(this, 'summaryTable');">
											<i class="fa fa-fw fa-file-excel-o"></i> 施測結果摘要(所有資料)
										</a> 
										<a class="btn btn-success btn-xs" download="cat_history.xls"
											onclick="return ExcellentExport.excel(this, 'historyTable');">
											<i class="fa fa-fw fa-file-excel-o"></i> 施測歷程記錄
										</a> 
										<a class="btn btn-success btn-xs" download="data_matrix.xls"
											onclick="return ExcellentExport.excel(this, 'dataMatrixTable');">
											<i class="fa fa-fw fa-file-excel-o"></i> 資料矩陣
										</a>
										</div>
									</div>
									
									<!-- table for export to excel -->
									<table class="table table-hover table-condensed text-center"
										id="summaryTable" width="100%" style="display: none;">
										<thead>
											<tr>
												<th>個案序號</th>
												<th>能力值</th>
												<th>T分數</th>
												<th>估計標準誤</th>
												<th>信度</th>
												<th>施測題數</th>
												<th>作答時間</th>
												<th>施測時間</th>
												<th>施測者</th>
												<th>受測者</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
									
									<!-- table for export to excel -->
									<table class="table table-hover table-condensed"
										id="historyTable" width="100%" style="display: none;">
										<thead>
											<tr>
												<th>個案序號</th>
												<th>受測者</th>
												<th>第1題</th>
												<th>第2題</th>
												<th>第3題</th>
												<th>第4題</th>
												<th>第5題</th>
												<th>第6題</th>
												<th>第7題</th>
												<th>第8題</th>
												<th>第9題</th>
												<th>第10題</th>
												<th>第11題</th>
												<th>第12題</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>

									<table class="table table-hover table-condensed"
										id="dataMatrixTable" width="100%" style="display: none;">
										<thead>
											<tr>
												<th>個案序號</th>
												<th>受測者</th>
												<th>第1題</th>
												<th>第2題</th>
												<th>第3題</th>
												<th>第4題</th>
												<th>第5題</th>
												<th>第6題</th>
												<th>第7題</th>
												<th>第8題</th>
												<th>第9題</th>
												<th>第10題</th>
												<th>第11題</th>
												<th>第12題</th>
												<th>第13題</th>
												<th>第14題</th>
												<th>第15題</th>
												<th>第16題</th>
												<th>第17題</th>
												<th>第18題</th>
												<th>第19題</th>
												<th>第20題</th>
												<th>第21題</th>
												<th>第22題</th>
												<th>第23題</th>
												<th>第24題</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
									<!-- table for export to excel -->
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-3 container-right">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<i class="fa fa-fw fa-table"></i><span class="left10">新增帳號</span>
									<a class="btn btn-default btn-sm toggleBtn" id="accountBtn"
										data-toggle="collapse" data-parent="#listPanel"
										href="#accountPanel"><i class="fa fa-fw fa-bars"></i></a>
								</h4>
							</div>
							<div id="accountPanel" class="panel-collapse collapse">
								<div class="panel-body">
									<form id="addUserForm">
										<div width="100%">
											<div class="form-group" id="nameInput">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-fw fa-user"></i>
													</span> <input name="username" type="text" class="form-control"
														placeholder="username">
												</div>
											</div>
											<div class="form-group" id="pwdInput">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-fw fa-key"></i>
													</span> <input name="password" type="password"
														class="form-control" placeholder="password">
												</div>
											</div>
										</div>
									</form>
									<div>
										<button class="btn btn-primary btn-sm" id="generateAcount"
											style="display: none;" disabled>
											<del>產生帳號密碼</del>
										</button>
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
									<i class="fa fa-fw fa-table"></i><span class="left10">帳號管理</span>
									<a class="btn btn-default btn-sm toggleBtn" style="left:2px;" id="roleBtn"
										data-toggle="collapse" data-parent="#listPanel"
										href="#rolePanel"><i class="fa fa-fw fa-bars"></i></a>
								</h4>
							</div>
							<div id="rolePanel" class="panel-collapse collapse">
								<div class="panel-body">
										
									<table class="table table-striped" id="roleTable"
										width="100%">
										<thead>
											<tr>
												<th>名稱/密碼</th>
												<th></th>
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

		<button id="updateRoleButton" type="button" style="display: none;"
			class="btn btn-info btn-lg right" data-toggle="modal"
			data-target="#updateRoleDialog"></button>
		<!-- #wrapper -->

		<!-- Modal -->
		<div id="messageDialog" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="text-danger" id="errorMessage" style="display: none;">

						</h4>
						<h4 class="text-success" id="successMessage"
							style="display: none;"></h4>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">關閉</button>
					</div>
				</div>

			</div>
		</div>

		<div id="updateRoleDialog" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<label>帳號名稱：</label><span id="updateUserName"></span>
						</h4>
						<h4>
							<label>新密碼：</label><input type="text" id="updatePassword">
						</h4>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal"
							onclick="updateUser()">確定</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
					</div>
				</div>

			</div>
		</div>

	</c:if>
</body>
<script>
	var $role = "${role.userName}";
	$(document).ready(function() {
		checkLogin();

		$("a#allRecordBtn").trigger("click");
		$("a#accountBtn").trigger("click");

		getAllRecord();
		getAllUser();
	});

	function checkLogin() {
		if ($role == null || $role.length == 0) {
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
					"oLanguage":{"sProcessing":"處理中...",
                        "sLengthMenu":"顯示 _MENU_ 筆結果",
                        "sZeroRecords":"沒有匹配結果",
                        "sInfo":"顯示第 _START_ 筆至 _END_ 筆結果，共有 _TOTAL_ 筆",
                        "sInfoEmpty":"顯示第 0 筆至第 0 筆結果，共有 0 筆",
                        "sInfoFiltered":"(從 _MAX_ 項結果過濾)",
                        "sSearch":"搜尋:",
                        "oPaginate":{"sFirst":"<<第一頁",
                                             "sPrevious":"上一頁",
                                             "sNext":"下一頁",
                                             "sLast":"最後一頁>>"}
                        }
				});
			}
		});
	}

	function generateRecordDataTable(jsonData) {
		$.each(jsonData.recordList, function(index, data) {
			/**
			 * 結果摘要
			 */
			var $tr = $("<tr width='100%'>");
			var $trSummary = $("<tr width='100%'>");
			
			//<th>施測序號</th>
			var recordId = addZeroLeft(data.id, 5);
			$tr.append($("<td>").html(recordId));
			$trSummary.append($("<td>").html(recordId));
			//<th>能力估計值</th>
			$tr.append($("<td>").html(data.ability.toFixed(2)));
			$trSummary.append($("<td>").html(data.ability.toFixed(3)));
			//<th>T分數</th>
			var mu = 0.268;
			var variance = 0.542;
			var minTheta = -2.4354;
			var maxTheta = 2.6064;
			
			var t_score = (data.ability - minTheta)/(maxTheta - minTheta)*100; //量尺分數
			
			var t_score2 = Math.round(((data.ability - mu)/Math.sqrt(variance)) *10 + 50 );//平均數=0.268 標準差=sqrt(0.542)
			var t_lowerbound2 = Math.round(((data.ability - mu - 2 * data.sem)/Math.sqrt(variance)) *10 + 50);
			var t_upperbound2 = Math.round(((data.ability - mu + 2 * data.sem)/Math.sqrt(variance)) *10 + 50);

			$tr.append($("<td>").html(t_score));
			$trSummary.append($("<td>").html(t_score));
			//<th>測量標準誤</th>
			$tr.append($("<td>").html(data.sem.toFixed(2)));
			$trSummary.append($("<td>").html(data.sem.toFixed(3)));
			//<th>信度</th>
			$tr.append($("<td>").html(
					(1 - ((data.sem) * (data.sem)) / variance).toFixed(2)));
			$trSummary.append($("<td>").html(
					(1 - ((data.sem) * (data.sem)) / variance).toFixed(3)));
			//<th>施測題數</th>
			$tr.append($("<td>").html(data.selectedItems.length));
			$trSummary.append($("<td>").html(data.selectedItems.length));
			//<th>作答時間</th>
			$tr.append($("<td>").html(
					(data.testCompleteTime / 1000).toFixed(1) + "秒"));
			$trSummary.append($("<td>").html(
					(data.testCompleteTime / 1000).toFixed(1) + "秒"));
			//<th>施測時間</th>
			$tr.append($("<td>").html(data.createTime));
			$trSummary.append($("<td>").html(data.createTime));
			//<th>施測者</th>
			$tr.append($("<td>").html(data.roleName));
			$trSummary.append($("<td>").html(data.roleName));
			
			//<th>受試者</th>
			$tr.append($("<td>").html(data.subjectName));
			$trSummary.append($("<td>").html(data.subjectName));
			
			$('table#recordTable > tbody:last').append($tr);
			
			/**
			 * 所有結果摘要
			 */
			$('table#summaryTable > tbody:last').append($trSummary);
			
			/**
			 * 作答歷程
			 */
			var $trHistory = $("<tr width='100%'>");
			$trHistory.append($("<td>").html(recordId));
			//<th>受試者</th>
			$trHistory.append($("<td>").html(data.subjectName));

			for ( var key in data.selectedItems) {
				$trHistory.append($("<td>").html(data.selectedItems[key]));
			}

			$('table#historyTable > tbody:last').append($trHistory);

			/**
			 * 作答矩陣
			 */
			var $trDataMatrix = $("<tr width='100%'>");
			$trDataMatrix.append($("<td>").html(recordId));
			//<th>受試者</th>
			$trDataMatrix.append($("<td>").html(data.subjectName));
			
			for (var i = 1; i <= 24; i++) {
				var dataResponse = "";

				for ( var key in data.selectedItems) {
					if (data.selectedItems[key] == i) {
						dataResponse = data.selectedOptions[key];
					}
				}

				$trDataMatrix.append($("<td>").html(dataResponse));
			}

			$('table#dataMatrixTable > tbody:last').append($trDataMatrix);
		});

		$("table#recordTable tr th:nth-child(6)").hide();
		$("table#recordTable tr td:nth-child(6)").hide();
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
			var template = "帳號：" + data.userName + '<br>' + "密碼：" + data.userPassword;
			$tr.append($("<td width='70%'>").html(template));
			
			var buttonSet = "<a class='btn btn-danger btn-xs'"
				+ "onclick='deleteRole(\"" + data.userName
				+ "\",\"" + data.userPassword + "\");'  >刪除</a><span>  </span>"
				+ "<a class='btn btn-primary btn-xs'"
				+ "onclick='openUpdateRole(\""
				+ data.userName + "\",\""
				+ data.userPassword + "\");'  >修改</a>";
			$tr.append($("<td width='30%'>").html(buttonSet));
			
			$('table#roleTable > tbody:last').append($tr);
		});
	}

	function deleteRole(userName, password) {
		var params = {};
		params.username = userName;
		params.password = password;

		$.ajax({
			type : "POST",
			url : "deleteUser.action",
			data : params,
			dataType : "text", //ajax返回值設定為text
			success : function(json) {
				var obj = $.parseJSON(json); //解析json

				if (obj.isSuccess) {
					$('h4#successMessage').show();
					$('h4#successMessage').html("帳號已刪除：" + userName);
					$("button#messageButton").trigger("click");

					getAllUser();
				} else {
					$('h4#errorMessage').show();
					$('h4#errorMessage').html("帳號刪除失敗");
					$("button#messageButton").trigger("click");
				}
			},
			error : function(json) {
				return false;
			}
		});
	}

	function openUpdateRole(userName, password) {
		var params = {};
		params.username = userName;
		params.password = password;

		$("#updateUserName").html(userName);
		$("#updatePassword").val(password);

		$("button#updateRoleButton").trigger("click");
	}

	function updateUser() {
		var userName = $("#updateUserName").html();
		var password = $("#updatePassword").val();
		
		// 驗證新密碼長度
		$('h4#errorMessage').html("");
		$('h4#successMessage').html("");
		$('h4#errorMessage').hide();
		$('h4#successMessage').hide();
		
		if (password.length > 8 ) {
			
			$('h4#errorMessage').show();
			$('h4#errorMessage').html("密碼長度不得超過八碼！");
			$("button#messageButton").trigger("click");
			
			return;
		}
		
		var params = {};
		params.username = userName;
		params.password = password;

		$.ajax({
			type : "POST",
			url : "updateUser.action",
			data : params,
			dataType : "text", //ajax返回值設定為text
			success : function(json) {
				var obj = $.parseJSON(json); //解析json

				if (obj.isSuccess) {
					$('h4#successMessage').show();
					$('h4#successMessage').html("密碼已更新：" + userName + ":" + password);
					$("button#messageButton").trigger("click");

					getAllUser();
				} else {
					$('h4#errorMessage').show();
					$('h4#errorMessage').html("密碼更新失敗");
					$("button#messageButton").trigger("click");
				}
			},
			error : function(json) {
				return false;
			}
		});
	}

	$("a#exportExcelButton").on("click", function() {
	});

	$("button#addAcount").on(
			"click",
			function() {
				var isPass = validator();

				if (isPass) {
					var username = $(
							"form#addUserForm div input[name=username]").val();
					var password = $(
							"form#addUserForm div input[name=password]").val();

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
								$('h4#successMessage').html(
										"新增(帳號/密碼)成功：" + obj.username + ","
												+ obj.password);
								$("button#messageButton").trigger("click");

								getAllUser();
							} else {
								$("#nameInput").addClass("has-error");
								$('h4#errorMessage').show();
								$('h4#errorMessage').html(
										obj.username + ":" + obj.errorMessage);
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
		var errorMessage = "";
		var isPass = true;

		if (username == null || username == undefined || username == '') {
			isPass = false;
			$("#nameInput").addClass("has-error");
			errorMessage = "帳號與密碼不得為空";
		} else if (username.length > 8) {
			isPass = false;
			$("#nameInput").addClass("has-error");
			errorMessage = "帳號與密碼不得超過八碼";
		} else {
			$("#nameInput").removeClass("has-error");
		}

		if (password == null || password == undefined || password == '') {
			isPass = false;
			$("#pwdInput").addClass("has-error");
			errorMessage = "帳號與密碼不得為空";
		} else if (password.length > 8) {
			isPass = false;
			$("#pwdInput").addClass("has-error");
			errorMessage = "帳號與密碼不得超過八碼";			
		} else {
			$("#pwdInput").removeClass("has-error");
		}

		if (!isPass) {
			$('h4#errorMessage').show();
			$('h4#errorMessage').html(errorMessage);
			$("button#messageButton").trigger("click");

			return false;
		}

		return true;
	}

	// 左邊補0
	function addZeroLeft(str, length) {
		if (str.length >= length) {
			return str;
		} else {
			return addZeroLeft("0" + str, length);
		}
	}

	function clearMessage() {
		$('h4#errorMessage').hide();
		$('h4#successMessage').hide();
	}
</script>

</html>