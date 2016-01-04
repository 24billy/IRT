<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CatSoFun</title>

<script src="/CatSoFun/js/jquery-1.11.3.min.js"></script>
<script src="/CatSoFun/js/bootstrap.min.js"></script>

<link href="/CatSoFun/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
	@media (max-width: 768px) {

	}

	@media (max-width: 480px) {

	}
	
	@media (max-width: 320px) {

	}

	
	body {
		padding-top: 60px;
        padding-bottom: 60px;
/* 		background-image: url(/CatSoFun/pic/camera.jpg); */
		background-color: black;
		background-size:cover;
		
		font-family: Microsoft JhengHei;
	}
	
	#quizDiv  {
		font-size: 24px;
		color: white;
	}

 	label {
		font-size: 24px;
		border-width: 1px;
		border-style: groove;
		border-radius: 5px;
	}
	 
 	.radio:hover { 
 		font-size: 24px; 
 		border-width: 1px; 
 		border-style: groove; 
		border-radius: 5px;
		background-color: white;
		color: black;
		opacity:0.6;
 	} 
	
	#contentDiv {
		margin-top: 20px;
	}
	
	input[type="radio"] {
  		display: none;
	}
	
	input[type="radio"]:checked + label{
  	background-color: white;
  	color: black;
  	border-radius: 5px;
  	opacity:0.6;
  	}

</style>
 
</head>
<body>

<!-- BEGIN header -->
<div class="container">
	<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
		<div class="container">
			<div class="navbar-header">
			  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
			    <span class="sr-only">Toggle navigation</span>
			    <span class="icon-bar"></span>
			    <span class="icon-bar"></span>
			    <span class="icon-bar"></span>
			  </button>
			  <a class="navbar-brand" href="/CatSoFun">CatSoFun</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
				    <li><a href="#about">關於測驗</a></li>
				    <li><a href="#contact">聯絡我們</a></li>
				</ul>
				<button id="recordButton" type="button" class="btn btn-info btn-lg right" data-toggle="modal" data-target="#recordDialog">
					檢視目前估計結果
				</button>
				<form class="navbar-form navbar-right" role="search">
				    <input class="btn btn-default" type="button" value="登出" onclick="location.href='logout'">
				</form>
			</div>
		</div>
	</nav>   
	<!-- END header -->   
	
	<!-- BEGIN Content -->
	
	<div class="container" id="contentDiv">
	
		<!-- BEGIN 測驗開始頁 -->
		<div class="row" style="opacity:0.6;" id="welcomeDiv">
			<div class="col-xs-10 col-xs-offset-1 col-md-6 col-md-offset-3 thumbnail" style="padding: 15px; color: black;">
		        <p>這是一個測驗這是一個測驗這是一個測驗這是一個測驗這是一個測驗這是一個測驗這是一個測驗這是一個測驗這是一個測驗...測驗說明測驗說明</p>
		        <br>
		        <p><button type="button" class="btn btn-primary form-control" id="begin">開始測驗</button></p>
			</div>
		</div>
		<!-- END 測驗開始頁 -->

	
		<!-- BEGIN 測驗結束頁 -->
		<div class="row" style="display: none;" id="finishDiv">
			<div class="col-xs-10 col-xs-offset-1 col-md-6 col-md-offset-3 thumbnail" style="padding: 15px; opacity:0.6; margin-top: 50px;">
				<p style="font-size: 24px; text-align: center; color: blue;">您已完成本測驗</p>
		        
		        <table style="width: 90%; text-align: center; font-size: 22px;">
			    	<tr>
				   		<td style="width: 50%;">能力估計</td>
				   		<td style="width: 50%; color: red; font-weight: bold;" id="theta"></td>
				   	</tr>
				   	<tr>
				   		<td style="width: 50%;">t分數</td>
				   		<td style="width: 50%; color: red; font-weight: bold;" id="tScore"></td>
				   	</tr>
				   	<tr>
				   		<td style="width: 50%;">估計標準誤</td>
				   		<td style="width: 50%; color: red; font-weight: bold;" id="sem"></td>
				   	</tr>
				   	<tr>
				   		<td style="width: 50%;">信度</td>
				   		<td style="width: 50%; color: red; font-weight: bold;" id="reliability"></td>
				   	</tr>
				   	<tr>
				   		<td style="width: 50%;">測驗題數</td>
				   		<td style="width: 50%; color: red; font-weight: bold;" id="itemNum"></td>
				   	</tr>
				   	<tr>
				   		<td style="width: 50%;">測驗時間</td>
				   		<td style="width: 50%; color: red; font-weight: bold;" id="testTime"></td>
				   	</tr>
			    </table>
			</div>
		</div>
		<!-- END 測驗結束頁 -->


		<!-- BEGIN 試題頁 -->
		<div class="row" style="display: none;" id="quizDiv" >
			<div class="col-md-10 col-md-offset-1" >
				<div style="border-width: 1px; border-style: solid; border-radius: 5px; padding: 15px;">
					<p id="questionCount">Q1.</p>
					<p id="guild">${response.guild}</p>
					<p id="question">${item.itemContent}</p>
					
					<form role="form" style="font-size: ; color: ; margin-top: 20px;">
					  <div class="radio" >
					    <input type="radio" name="optradio" value="0" id="radio01"><label style="width: 2000px;" for="radio01"><span id="opt0">${response.option01}</span></label>
					  </div>
					  <div class="radio">
					    <input type="radio" name="optradio" value="1" id="radio02"><label style="width: 2000px;" for="radio02"><span id="opt1">${response.option02}</span></label>
					  </div>
					  <div class="radio">
					    <input type="radio" name="optradio" value="2" id="radio03"><label style="width: 2000px;" for="radio03"><span id="opt2">${response.option03}</span></label>
					  </div>
					  <div class="radio">
					    <input type="radio" name="optradio" value="3" id="radio04"><label style="width: 2000px;" for="radio04"><span id="opt3">${response.option04}</span></label>
					  </div>
					  <div class="radio">
					    <input type="radio" name="optradio" value="4" id="radio05"><label style="width: 2000px;" for="radio05"><span id="opt4">${response.option05}</span></label>
					  </div>
					  <div class="text-center" style="margin: 20px 0px 0px 0px;">
					    <button type="button" class="btn btn-primary btn-lg  form-control" id="next" style="">NEXT</button>
					  </div>
					</form>
				</div>
			</div>
		</div>
		<!-- END 試題頁 -->
	
	</div>
	
	
	<!-- END Content -->
	
	<!-- BEGIN footer -->
	<div class="navbar navbar-default navbar-fixed-bottom navbar-inverse">
		<div class="container">
			<p style="color: white;">Copyright ©2015 footer</p>
		</div>
	</div>
	<!-- END footer -->
</div>

<!-- Modal -->
<div id="recordDialog" class="modal fade" role="dialog" style="black;">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
		    <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal">&times;</button>
			    <h4 class="modal-title" id="recordTitle">能力估計結果</h4>
		    </div>
		    <div class="modal-body">
			    <table>
			    	<tr>
				   		<td>初始能力值</td>
				   		<td id="initAbility"></td>
				   	</tr>
				   	<tr>
				   		<td>目前能力估計值</td>
				   		<td id="recordAbility"></td>
				   	</tr>
				   	<tr>
				   		<td>所選題目</td>
				   		<td id="recordSelectedItems"></td>
				   	</tr>
				   	<tr>
				   		<td>作答反應</td>
				   		<td id="recordSelectedOptions"></td>
				   	</tr>
				   	<tr>
				   		<td>SEM</td>
				   		<td id="recordSem"></td>
				   	</tr>
			    </table>
		    </div>
		    <div class="modal-footer">
				<button type="button" class="btn btn-success" onclick="window.location.href='/CatSoFun/mock'">重新施測</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">關閉</button>
			</div>
		</div>
	
	</div>
</div>

<div class="container">
	<!-- Trigger the modal with a button -->
	<button id="warningDialog" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="display: none;">Open Modal</button>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-body">
					<h3>請選擇選項!</h3>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">關閉</button>
				</div>
			</div>
		</div>
	</div>
  
</div>

<script>
var questionCount = 0 ;
var isNextEventComplete = true;

$(document).ready(function(){
	questionCount = 1 ;

	// 	按下 next鍵 發ajax 顯示下一題
	if (isNextEventComplete) {
		$('#next').click(function() {
		isNextEventComplete = false;
	
// 		$('#next').prop("disabled","disabled");
		
		var option = $('input:radio[name=optradio]:checked').val();
		if (option == null || option == undefined || option == ''){
			//檢核有無勾選radio button
			$("#warningDialog").trigger( "click" );
// 			$('#next').prop("disabled","");
			isNextEventComplete = true;
			return;
		}

		var params = {
			selectedOption : $('input:radio[name=optradio]:checked').val()
		};

		$.ajax({
			type : "POST",
			url : "chooseItem.action",
			data : params,
			dataType : "text", //ajax返回值設定為text
			success : function(json) {
				questionCount++;
				
				var obj = $.parseJSON(json); //解析json
				
				if (obj.isFinished) {
					refreshRecordDialog(obj.record);
					$("#recordTitle").html("測驗結束");
					
					var mu = 0;
					var variance = 1;
					var minTheta = -3;
					var maxTheta = 3.6;

					// 刷新內容div
					$('#theta').html((obj.record.ability).toFixed(3));
					$('#tScore').html(Math.round((obj.record.ability - minTheta)/(maxTheta - minTheta)*100));
					$('#itemNum').html(questionCount-1);
					$('#sem').html((obj.record.sem).toFixed(3));
					$('#reliability').html((1-((obj.record.sem)*(obj.record.sem))/variance).toFixed(3));
					$('#testTime').html(Math.round(obj.record.testCompleteTime/1000) + "秒");

					$('#contentDiv').html($('#finishDiv').html());
				} else {
					var item = obj.item;
					var response = obj.response;

					$("#questionCount").html("Q" + questionCount + ".");
					$("#question").html(item.itemContent);
					$("#guild").html(obj.response.guild);
					
					$("#opt0").html(response.option01);
					$("#opt1").html(response.option02);
					$("#opt2").html(response.option03);
					$("#opt3").html(response.option04);
					$("#opt4").html(response.option05);

					refreshRecordDialog(obj.record);
					
					$(':checked').prop('checked',false);
// 					$('#next').prop("disabled","");
				}
				isNextEventComplete = true;
			},
			error : function(json) {
				return false;
			}
		});
	});
	}
});

//按下 開始測驗鍵
$('#begin').click(function() {
	$('#welcomeDiv').hide();
	$('#quizDiv').show();
});

function refreshRecordDialog(record) {
	$("td#initAbility").html(record.initAbility);
	
	$("td#recordAbility").html(record.ability);

	$("td#recordSem").html(record.sem);
	
	var selectedItems='';
	for(var key in record.selectedItems){
		if(key == 0) {
			selectedItems = record.selectedItems[key]
		} else {
			selectedItems += "," + record.selectedItems[key]
		}
	}
	$("td#recordSelectedItems").html(selectedItems);
	
	var selectedOptions='';
	for(var key in record.selectedOptions){
		if(key == 0) {
			selectedOptions = record.selectedOptions[key]
		} else {
			selectedOptions += "," + record.selectedOptions[key]
		}
	}
	$("td#recordSelectedOptions").html(selectedOptions);
};
	
</script>

</body>
</html>