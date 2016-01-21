<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- icon -->
<link href='/CatSoFun/images/icon/cat_icon.png' rel='icon' type='image/x-icon'/>

<title>CatSoFun</title>

<script src="/CatSoFun/js/jquery-1.11.3.min.js"></script>
<script src="/CatSoFun/js/bootstrap.min.js"></script>
<script src="/CatSoFun/js/bootbox.min.js"></script>
<script src="/CatSoFun/js/jquery.dataTables.min.js"></script>

<link href="/CatSoFun/css/bootstrap.min.css" rel="stylesheet">
<link href="/CatSoFun/css/jquery.dataTables.min.css" rel="stylesheet">

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
	
	#quizDiv, #practiceDiv1, #practiceDiv2  {
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
   	opacity:1.0; 
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
			  <a class="navbar-brand" onclick="goBackHome();" >CatSoFun</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
				    <li><a onclick="doQueryHistory()">查看歷史紀錄</a></li>
<!-- 				    <li><a href="" Target="_blank" onclick="">查看歷史紀錄(另開)</a></li> -->
				    
				</ul>
				<button id="recordButton" type="button" class="btn btn-info btn-lg right" data-toggle="modal" data-target="#recordDialog">
					檢視目前估計結果(測試用)
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
	
		<!-- BEGIN 練習試題頁 -->
		<div class="row" style="display: none;" id="practiceDiv1" >
			<div class="col-md-10 col-md-offset-1" >
				<div style="border-width: 1px; border-style: solid; border-radius: 5px; padding: 15px;">
					<p id="">Q1.</p>
					<p id="">這是練習題!</p>
					<p id="">您可以選擇下面任一選項後，點選下方藍色按鈕，即可作答下一題。</p>
					
					<form role="form" style="font-size: ; color: ; margin-top: 20px;">
					  <div class="radio" >
					    <input type="radio" name="optradio" value="0" id="r11"><label style="width: 2000px;" for="r11"><span id="">第1個選項</span></label>
					  </div>
					  <div class="radio">
					    <input type="radio" name="optradio" value="1" id="r12"><label style="width: 2000px;" for="r12"><span id="">第2個選項</span></label>
					  </div>
					  <div class="radio">
					    <input type="radio" name="optradio" value="2" id="r13"><label style="width: 2000px;" for="r13"><span id="">第3個選項</span></label>
					  </div>
					  <div class="radio">
					    <input type="radio" name="optradio" value="3" id="r14"><label style="width: 2000px;" for="r14"><span id="">第4個選項</span></label>
					  </div>
					  <div class="radio">
					    <input type="radio" name="optradio" value="4" id="r15"><label style="width: 2000px;" for="r15"><span id="">第5個選項</span></label>
					  </div>
					  <div class="text-center" style="margin: 20px 0px 0px 0px;">
					    <button type="button" class="btn btn-primary btn-lg  form-control" id="preBegin1" style="">下一題</button>
					  </div>
					</form>
				</div>
			</div>
		</div>
		
		<div class="row" style="display: none;" id="practiceDiv2" >
			<div class="col-md-10 col-md-offset-1" >
				<div style="border-width: 1px; border-style: solid; border-radius: 5px; padding: 15px;">
					<p id="">Q2.</p>
					<p id="">這是最後一題練習題!</p>
					<p id="">完成此練習題後，將回到測驗說明頁，可進入正式測驗，也可再次進行練習。</p>
					
					<form role="form" style="font-size: ; color: ; margin-top: 20px;">
					  <div class="radio" >
					    <input type="radio" name="optradio" value="0" id="r21"><label style="width: 2000px;" for="r21"><span id="">練習題二，第1個選項</span></label>
					  </div>
					  <div class="radio">
					    <input type="radio" name="optradio" value="1" id="r22"><label style="width: 2000px;" for="r22"><span id="">練習題二，第2個選項</span></label>
					  </div>
					  <div class="radio">
					    <input type="radio" name="optradio" value="2" id="r23"><label style="width: 2000px;" for="r23"><span id="">練習題二，第3個選項</span></label>
					  </div>
					  <div class="radio">
					    <input type="radio" name="optradio" value="3" id="r24"><label style="width: 2000px;" for="r24"><span id="">練習題二，第4個選項</span></label>
					  </div>
					  <div class="radio">
					    <input type="radio" name="optradio" value="4" id="r25"><label style="width: 2000px;" for="r25"><span id="">練習題二，第5個選項</span></label>
					  </div>
					  <div class="text-center" style="margin: 20px 0px 0px 0px;">
					    <button type="button" class="btn btn-primary btn-lg  form-control" id="preBegin2" style="">下一題</button>
					  </div>
					</form>
				</div>
			</div>
		</div>
		<!-- END 練習試題頁 -->
		
		
		<!-- BEGIN 測驗開始頁 -->
		<div class="row" style="opacity:0.9;" id="welcomeDiv">
			<div class="col-xs-10 col-xs-offset-1 col-md-8 col-md-offset-2 thumbnail" style="padding: 15px; margin-top: 30px; color: black;">
		        <p style="font-size: 22px;">您好：</p>

				<ul style="font-size: 20px;">
					<li>這份測驗主要是用來瞭解您自覺參與社交活動之狀況。</li>
					<li>請仔細閱讀每道題目，並點選一個您認為最合適的答案。</li>
					<li>若您對題目內容有不瞭解的地方，請詢問您的治療師後再作答。</li>
				</ul>
				
		        <div class="form-group text-center" style="margin-top: 30px;" >
		        	<button type="button" class="btn btn-danger" id="preBegin" onclick="">我想練習看看</button>
		        	<button type="button" class="btn btn-primary" id="begin" onclick="doConfirmBeginQuiz()">直接開始測驗</button>
		        </div>
		        
			</div>
		</div>
		<!-- END 測驗開始頁 -->

	
		<!-- BEGIN 測驗結束頁 -->
		<div class="row" style="display: none;" id="finishDiv">
			<div class="col-xs-10 col-xs-offset-1 col-md-6 col-md-offset-3 thumbnail" style="padding: 15px; opacity:0.9; margin-top: 20px;">
				<p style="font-size: 24px; text-align: center; color: blue;">您已完成本測驗</p>
		        
					<table class="table table-striped table-bordered table-hover" style="font-size: 20px;">
						<thead style="display: none;">
							<tr>
								<th class="text-center">1</th>
								<th class="text-center">2</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td data-title="1">能力估計</td>
								<td data-title="2" id="theta"></td>
							</tr>
							<tr>
								<td data-title="1">標準誤 (能力估計)</td>
								<td data-title="2" id="sem"></td>
							</tr>
							<tr>
								<td data-title="1">T分數</td>
								<td data-title="2" id="tScore"></td>
							</tr>
							<tr>
								<td data-title="1">標準誤 (T分數)</td>
								<td data-title="2" id="se"></td>
							</tr>
							<tr>
								<td data-title="1">信度</td>
								<td data-title="2" id="reliability"></td>
							</tr>
							<tr>
								<td data-title="1">施測題數</td>
								<td data-title="2" id="itemNum"></td>
							</tr>
							<tr>
								<td data-title="1" class="blue">施測時間</td>
								<td data-title="2" class="blue" id="testTime"></td>
							</tr>
						</tbody>
					</table>
			    
			    <div class="form-group text-center row" style="margin-top: 20px;" >
			    	<button type="button" class="btn btn-primary" id="" style="margin-top: ;" onclick="window.location.href='showCatMainPage'">回到測驗主頁<br>(無須重新登入)</button>
			    	<button type="button" class="btn btn-warning" id="" style="margin-top: ;" onclick="window.open('logout');">開啟新的CAT-SoFun測驗<br>(需重新登入)</button>
			    </div>
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
					    <button type="button" class="btn btn-primary btn-lg  form-control" id="next" style="">下一題</button>
					  </div>
					</form>
				</div>
			</div>
		</div>
		<!-- END 試題頁 -->
	
	</div>
	
	<!-- BEGIN record dialog -->
	<div style="display: none" id="recordDiv">
		<div class="thumbnail">
			<table class="table table-hover table-condensed text-center"
				id="recordTable" width="100%">
				<thead>
					<tr>
						<th>能力值</th>
						<th>T分數</th>
						<th>估計標準誤</th>
						<th>信度</th>
						<th>施測題數</th>
						<th>作答時間</th>
						<th>施測時間</th>
						<th>施測者</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	<!-- END record dialog -->
	
	
<!-- 	test -->
<!-- 	<div class="thumbnail"> -->
<!-- 		<table class="table table-hover table-condensed " -->
<!-- 			id="recordTable2" width="100%"> -->
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th>能力值</th> -->
<!-- 					<th>T分數</th> -->
<!-- 					<th>估計標準誤</th> -->
<!-- 					<th>信度</th> -->
<!-- 					<th>施測題數</th> -->
<!-- 					<th>作答時間</th> -->
<!-- 					<th>施測時間</th> -->
<!-- 					<th>施測者</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<!-- 			</tbody> -->
<!-- 		</table> -->
<!-- 	</div> -->
<!-- 	test -->
	
	
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
	
		var option = $('input:radio[name=optradio]:checked').val();
		if (option == null || option == undefined || option == ''){
			//檢核有無勾選radio button
			$("#warningDialog").trigger( "click" );
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
					var minTheta = -3.5318;
					var maxTheta = 3.6248;

					// 刷新內容div
					$('#theta').html((obj.record.ability).toFixed(2));
					$('#tScore').html(Math.round((obj.record.ability - minTheta)/(maxTheta - minTheta)*100));
					$('#itemNum').html(questionCount-1);
					$('#sem').html((obj.record.sem).toFixed(2));
					$('#se').html(Math.round((obj.record.sem)/(maxTheta - minTheta)*100));
					$('#reliability').html((1-((obj.record.sem)*(obj.record.sem))/variance).toFixed(2));
					$('#testTime').html((obj.record.testCompleteTime/1000).toFixed(1) + "秒");

					$('#contentDiv').html($('#finishDiv').html());
				} else {
					var item = obj.item;
					var response = obj.response;

					$('#quizDiv').fadeOut();
					
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

					$('#quizDiv').fadeIn();
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


$('#preBegin').click(function() {
	$('#welcomeDiv').hide();
	$('#practiceDiv1').show();
});

$('#preBegin1').click(function() {

	var option = $('input:radio[name=optradio]:checked').val();
	if (option == null || option == undefined || option == ''){
		//檢核有無勾選radio button
		$("#warningDialog").trigger( "click" );
		return;
	}
	
	$('#practiceDiv1').hide();
	$('#practiceDiv2').show();
	
	$(':checked').prop('checked',false);
});

$('#preBegin2').click(function() {
	
	var option = $('input:radio[name=optradio]:checked').val();
	if (option == null || option == undefined || option == ''){
		//檢核有無勾選radio button
		$("#warningDialog").trigger( "click" );
		return;
	}

	$('#practiceDiv2').hide();
	$('#welcomeDiv').show();
	$(':checked').prop('checked',false);
});

// $('#begin').click(function() {
// 	$('#welcomeDiv').hide();
// 	$('#quizDiv').show();
// });

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

function goBackHome() {
	
    bootbox.dialog({
       closeButton : true,
       size : "null",
       message : "<h3>測驗進行中，你確定要回到登入頁?</h3>",
       title : "",
       buttons : {
           success : {
               label : "確定",
               className : "btn-primary",
               callback : function() {
                   window.location.href='logout';
               }
           },
           danger : {
               label : "取消",
               className : "btn-default",
               callback : function() {
               	//do nothing
               }
           }
       }
    });
}

function doConfirmBeginQuiz() {
	
	    bootbox.dialog({
        closeButton : true,
        size : "null",
        message : "<h3>確定要開始測驗?</h3>",
        title : "",
        buttons : {
          success : {
                label : "確定開始測驗",
                className : "btn-primary",
                callback : function() {
                
					$('#welcomeDiv').hide();
					$('#quizDiv').show();
                
                }
            },
            danger : {
                label : "取消",
                className : "btn-default",
                callback : function() {
                	
//                 	$('#welcomeDiv').hide();
//                 	$('#practiceDiv1').show();
                	
                }
            }
        }
    });
}	

function doQueryHistory() {

	getAllRecord();
		
	bootbox.alert({
       closeButton : true,
       size : "large",
       message : $('#recordDiv').html(),
       title : "歷史作答記錄",
       buttons : {
           ok : {
               label : "確定",
               className : "btn-primary",
               callback : function() {
               	//do nothing
               }
           }
       }
    });
}

   	function getAllRecord() {
		$.ajax({
			type : "POST",
			url : "getHistoryRecord.action",
			dataType : "text", //ajax返回值設定為text
			success : function(data) {
				var jsonData = $.parseJSON(data); //解析json

				if (jsonData != null) {
					generateRecordDataTable(jsonData);
				}
// 				$('#recordTable').DataTable({
					
//        				"retrieve": true,
//        				"bPaginate": true, //翻頁功能
//        				"bLengthChange": false, //改變每頁顯示數據數量
//        				"bFilter": false, //過濾功能
// 			        "bSort": true, //排序功能
// 			        "bInfo": true,//頁腳信息
// 			        "bAutoWidth": false,//自動寬度
// 			        "aoColumnDefs": //欄位設定
// 			            [
// 			                { 'bSortable': false, 'aTargets': [ ] }, //關閉排序功能
// 			                { 'sWidth': '10%', 'aTargets': [ 0 ] },
// 			                { 'sWidth': '10%', 'aTargets': [ 1 ] },
// 			                { 'sWidth': '10%', 'aTargets': [ 2 ] },
// 			                { 'sWidth': '10%', 'aTargets': [ 3 ] },
// 			                { 'sWidth': '10%', 'aTargets': [ 4 ] },
// 			                { 'sWidth': '10%', 'aTargets': [ 5 ] },
// 			                { 'sWidth': '30%', 'aTargets': [ 6 ] },
// 			                { 'sWidth': '10%', 'aTargets': [ 7 ] }
// 			            ],
//             		"aaSorting": [[ 0, "asc" ]] //第0列順序排列
//    				});
			}
		});
	}
	
	function generateRecordDataTable(jsonData) {
		$.each(jsonData.recordList, function(index, data) {
			/**
			 * 結果摘要
			 */
			var $tr = $("<tr width='100%'>");

			//<th>施測序號</th>
// 			var recordId = 1;
// 			$tr.append($("<td>").html(recordId));
			//<th>能力估計值</th>
			$tr.append($("<td>").html(data.ability.toFixed(1)));
			//<th>T分數</th>
			var mu = 0;
			var variance = 1;
			var minTheta = -3.5318;
			var maxTheta = 3.6248;

			$tr.append($("<td>").html(
					Math.round((data.ability - minTheta)
							/ (maxTheta - minTheta) * 100)));
			//<th>測量標準誤</th>
			$tr.append($("<td>").html(data.sem.toFixed(1)));
			//<th>信度</th>
			$tr.append($("<td>").html(
					(1 - ((data.sem) * (data.sem)) / variance).toFixed(2)));
			//<th>施測題數</th>
			$tr.append($("<td>").html(data.selectedItems.length));
			//<th>作答時間</th>
			$tr.append($("<td>").html(
					(data.testCompleteTime / 1000).toFixed(1) + "秒"));
			//<th>施測時間</th>
			$tr.append($("<td>").html(data.createTime));
			//<th>施測者</th>
			$tr.append($("<td>").html(data.roleName));

			$('table#recordTable > tbody:last').append($tr);

		});
	}
	

   
</script>

</body>
</html>