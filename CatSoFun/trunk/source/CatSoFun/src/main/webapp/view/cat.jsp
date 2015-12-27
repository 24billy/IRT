<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CatSoFun</title>

<script src="/CatSoFun/js/jquery-1.11.3.min.js"></script>
<script src="/CatSoFun/js/bootstrap.min.js"></script>

<link href="/CatSoFun/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
	.radio:hover {
		font-size: 24px;
		border-width: 1px;
		border-style: groove;
		border-radius: 5px;
	}
	
	#contentDiv {
		margin-top: 20px;
	}
	body {
		padding-top: 60px;
        padding-bottom: 60px;
		background-image: url(/CatSoFun/pic/camera.jpg);
		background-size:cover;
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
			<div class="col-xs-10 col-xs-offset-1 col-md-6 col-md-offset-3 thumbnail" style="font-family:Microsoft JhengHei; padding: 15px;">
				<h4 style="font-family: bold;font-size: 26px;">歡迎XXX</h4>
		        <p>這是一個測驗這是一個測驗這是一個測驗這是一個測驗這是一個測驗這是一個測驗這是一個測驗這是一個測驗這是一個測驗...測驗說明測驗說明</p>
		        <br>
		        <p><button type="button" class="btn btn-primary form-control" id="begin">開始測驗</button></p>
			</div>
		</div>
		<!-- END 測驗開始頁 -->

	
		<!-- BEGIN 測驗結束頁 -->
		<div class="row" style="display: none;" id="finishDiv">
			<div class="col-xs-10 col-xs-offset-1 col-md-6 col-md-offset-3 thumbnail" style="font-family:Microsoft JhengHei; padding: 15px; opacity:0.6; margin-top: 50px;">
				<p style="font-family: bold;font-size: 26px;">您已完成本測驗</p>
		        <p style="font-family: bold;font-size: 26px;">您的能力估計為 : <span style="color: red;font-family: bold;" id="theta"></span></p>
			</div>
		</div>
		<!-- END 測驗結束頁 -->


		<!-- BEGIN 試題頁 -->
		<div class="row" style="display: none;font-family:Microsoft JhengHei; opacity:1.0;" id="quizDiv" >
			<div class="col-md-10 col-md-offset-1" >
				<div style="border-width:1px; border-style:solid;border-radius:5px;padding:15px;">
					<h4 id="questionCount" style="color:white;">Q1.</h4>
					<p style="font-size: 24px;color: white;font-weight:;" id="guild">第一組問題將問您從事某項特定的活動時有多少困難。每項問題都是探討有些人在中風後所遇到的困難。
							空格中的號碼描述您過去一週從事該活動時的困難，請您將最適當的號碼圈起來或打。</p>
					<p id="question" style="font-size: 24px;color: white;font-weight:;">在過去一週裡：  您從事以前的工作有困難嗎？</p>
					
					<form role="form" style="font-size: 26px; color: white; margin-top: 50px;">
					  <div class="radio" >
					    <label style="width: 2000px;"><input type="radio" name="optradio" value="0" checked id="reset"><span id="opt0">完全無法做到</span></label>
					  </div>
					  <div class="radio">
					    <label style="width: 2000px;"><input type="radio" name="optradio" value="1"><span id="opt1">很多困難</span></label>
					  </div>
					  <div class="radio">
					    <label style="width: 2000px;"><input type="radio" name="optradio" value="2"><span id="opt2">中等困難</span></label>
					  </div>
					  <div class="radio">
					    <label style="width: 2000px;"><input type="radio" name="optradio" value="3"><span id="opt3">一點困難</span></label>
					  </div>
					  <div class="radio">
					    <label style="width: 2000px;"><input type="radio" name="optradio" value="4"><span id="opt4">完全沒有困難</span></label>
					  </div>
					  <br> 
					  <div class="text-center">
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
<div id="recordDialog" class="modal fade" role="dialog">
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
        </table>
      </div>
      <div class="modal-footer">
		<button type="button" class="btn btn-success" onclick="window.location.href='/CatSoFun/mock'">重新施測</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">關閉</button>
      </div>
    </div>

  </div>
</div>
<script>
var questionCount = 0 ;

$(document).ready(function(){
	questionCount = 1 ;
	
	// 按下 開始測驗鍵
	$('#begin').click(function() {
		$('#welcomeDiv').hide();
		$('#quizDiv').show();
	});

	// 	按下 next鍵 發ajax 顯示下一題
	$('#next').click(function() {
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
						$("#recordTitle").html("測驗結束");
						$("#recordButton").trigger( "click" );

						// 刷新內容div
						$('#theta').html(obj.record.ability);
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

						$("td#recordAbility").html(obj.record.ability);
						
						var selectedItems='';
						for(var key in obj.record.selectedItems){
							if(key == 0) {
								selectedItems = obj.record.selectedItems[key]
							} else {
								selectedItems += "," + obj.record.selectedItems[key]
							}
						}
						$("td#recordSelectedItems").html(selectedItems);
						
						var selectedOptions='';
						for(var key in obj.record.selectedOptions){
							if(key == 0) {
								selectedOptions = obj.record.selectedOptions[key]
							} else {
								selectedOptions += "," + obj.record.selectedOptions[key]
							}
						}
						$("td#recordSelectedOptions").html(selectedOptions);
						
						$('#reset').prop('checked','checked');
					}
				},
				error : function(json) {
					return false;
				}
			});
		});

	});
</script>

</body>
</html>