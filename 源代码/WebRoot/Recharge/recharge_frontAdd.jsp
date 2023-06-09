﻿<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.UserInfo" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>充值添加</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
	<div class="row">
		<div class="col-md-12 wow fadeInUp" data-wow-duration="0.5s">
			<div>
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
			    	<li role="presentation" ><a href="<%=basePath %>Recharge/frontlist">充值列表</a></li>
			    	<li role="presentation" class="active"><a href="#rechargeAdd" aria-controls="rechargeAdd" role="tab" data-toggle="tab">添加充值</a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
				    <div role="tabpanel" class="tab-pane" id="rechargeList">
				    </div>
				    <div role="tabpanel" class="tab-pane active" id="rechargeAdd"> 
				      	<form class="form-horizontal" name="rechargeAddForm" id="rechargeAddForm" enctype="multipart/form-data" method="post"  class="mar_t15">
						  <div class="form-group">
						  	 <label for="recharge_userObj_user_name" class="col-md-2 text-right">充值用户:</label>
						  	 <div class="col-md-8">
							    <select id="recharge_userObj_user_name" name="recharge.userObj.user_name" class="form-control">
							    </select>
						  	 </div>
						  </div>
						  <div class="form-group">
						  	 <label for="recharge_rechargeMoney" class="col-md-2 text-right">充值金额:</label>
						  	 <div class="col-md-8">
							    <input type="text" id="recharge_rechargeMoney" name="recharge.rechargeMoney" class="form-control" placeholder="请输入充值金额">
							 </div>
						  </div>
						  <div class="form-group">
						  	 <label for="recharge_rechargeMemo" class="col-md-2 text-right">充值备注:</label>
						  	 <div class="col-md-8">
							    <textarea id="recharge_rechargeMemo" name="recharge.rechargeMemo" rows="8" class="form-control" placeholder="请输入充值备注"></textarea>
							 </div>
						  </div>
						  <div class="form-group">
						  	 <label for="recharge_rechargeTimeDiv" class="col-md-2 text-right">充值时间:</label>
						  	 <div class="col-md-8">
				                <div id="recharge_rechargeTimeDiv" class="input-group date recharge_rechargeTime col-md-12" data-link-field="recharge_rechargeTime">
				                    <input class="form-control" id="recharge_rechargeTime" name="recharge.rechargeTime" size="16" type="text" value="" placeholder="请选择充值时间" readonly>
				                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
				                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
				                </div>
						  	 </div>
						  </div>
				          <div class="form-group">
				             <span class="col-md-2""></span>
				             <span onclick="ajaxRechargeAdd();" class="btn btn-primary bottom5 top5">添加</span>
				          </div>
						</form> 
				        <style>#rechargeAddForm .form-group {margin:10px;}  </style>
					</div>
				</div>
			</div>
		</div>
	</div> 
</div>

<jsp:include page="../footer.jsp"></jsp:include> 
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script>
var basePath = "<%=basePath%>";
	//提交添加充值信息
	function ajaxRechargeAdd() { 
		//提交之前先验证表单
		$("#rechargeAddForm").data('bootstrapValidator').validate();
		if(!$("#rechargeAddForm").data('bootstrapValidator').isValid()){
			return;
		}
		jQuery.ajax({
			type : "post",
			url : basePath + "Recharge/add",
			dataType : "json" , 
			data: new FormData($("#rechargeAddForm")[0]),
			success : function(obj) {
				if(obj.success){ 
					alert("保存成功！");
					$("#rechargeAddForm").find("input").val("");
					$("#rechargeAddForm").find("textarea").val("");
				} else {
					alert(obj.message);
				}
			},
			processData: false, 
			contentType: false, 
		});
	} 
$(function(){
	/*小屏幕导航点击关闭菜单*/
    $('.navbar-collapse a').click(function(){
        $('.navbar-collapse').collapse('hide');
    });
    new WOW().init();
	//验证充值添加表单字段
	$('#rechargeAddForm').bootstrapValidator({
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			"recharge.rechargeMoney": {
				validators: {
					notEmpty: {
						message: "充值金额不能为空",
					},
					numeric: {
						message: "充值金额不正确"
					}
				}
			},
			"recharge.rechargeTime": {
				validators: {
					notEmpty: {
						message: "充值时间不能为空",
					}
				}
			},
		}
	}); 
	//初始化充值用户下拉框值 
	$.ajax({
		url: basePath + "UserInfo/listAll",
		type: "get",
		success: function(userInfos,response,status) { 
			$("#recharge_userObj_user_name").empty();
			var html="";
    		$(userInfos).each(function(i,userInfo){
    			html += "<option value='" + userInfo.user_name + "'>" + userInfo.name + "</option>";
    		});
    		$("#recharge_userObj_user_name").html(html);
    	}
	});
	//充值时间组件
	$('#recharge_rechargeTimeDiv').datetimepicker({
		language:  'zh-CN',  //显示语言
		format: 'yyyy-mm-dd hh:ii:ss',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		minuteStep: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0
	}).on('hide',function(e) {
		//下面这行代码解决日期组件改变日期后不验证的问题
		$('#rechargeAddForm').data('bootstrapValidator').updateStatus('recharge.rechargeTime', 'NOT_VALIDATED',null).validateField('recharge.rechargeTime');
	});
})
</script>
</body>
</html>
