<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
	String easyUIHome = basePath+"/easyui-1.3.2";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="<%=easyUIHome%>/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=easyUIHome%>/themes/icon.css">
	<script type="text/javascript" src="<%=easyUIHome%>/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="<%=easyUIHome%>/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=easyUIHome%>/easyui-lang-zh_CN.js"></script>
<title>雨幕潇潇</title>
</head>
<body>

	<input type="button" id="login" value="登 录"/>
	<script type="text/javascript">
	$(function(){
		
		$("#login").bind("click",login);
	});
	function login(){
		
		$.ajax({
			dataType:"json",
			url:"<%=request.getContextPath()%>/login.do",
			type:"post",
			data:{
				'username':"张少举",
				'password':"aimuchun99"
			},
			success:function(data){
				
				//data = eval("\""+data+"\"");
				if(data && data.msg == "success"){
					
					$.messager.alert("木屋消息","登录   成功","info");
				
				}else if(data.msg == "fail"){
					
					$.messager.alert("木屋消息","登录失败","info");
				}
			}
		});
		
	}
	</script>
</body>
</html>