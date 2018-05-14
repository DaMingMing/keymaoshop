<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>keymao管理后台</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/index/font-awesome.min.css">
		<link rel="stylesheet" href="css/index/form-elements.css">
        <link rel="stylesheet" href="css/index/index.css">


        <!-- Favicon and touch icons -->
<!--         <link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png"> -->

    </head>

    <body>

        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>Keymao</strong> 后台管理系统</h1>
                            <div class="description">
                            	<p>
<!-- 	                            	This is a free responsive login form made with Bootstrap. 
	                            	Download it on <a href="#"><strong>AZMIND</strong></a>, customize and use it as you like! -->
                            	</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>Login to our site</h3>
                            		<p>Enter your username and password to log on:</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="glyphicon glyphicon-lock"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="${pageContext.request.contextPath }/user/login.do" method="post" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="account">Account</label>
			                        	<input type="text" name="account" placeholder="请输入账号..." class="form-username form-control" id="account">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="password">Password</label>
			                        	<input type="password" name="password" placeholder="请输入密码..." class="form-password form-control" id="password">
			                        </div>
			                        <button type="button" class="btn" onclick="login()">登录!</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
	
	<!--footer-->
	<footer>
	    <div class="container">
	        <div class="row">
	            <div class="col-md-12 text-center">
	                <p>
	                    Copyright&nbsp;©&nbsp;&nbsp;www.keymao.com&nbsp;&nbsp;
	                </p>
	            </div>
	        </div>
	    </div>
	</footer>
	<!--footer-->

        <!-- Javascript -->
        <script src="js/jquery-1.12.4.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.backstretch.min.js"></script>
        <script src="js/scripts.js"></script>
        
	<script>
/* 		$(document).ready(function(){
			
		  }); */
		  
		  function login(){
			 var account =  $("#account").val();
			 var password =  $("#password").val();
		  	$.ajax({
				url : "${pageContext.request.contextPath }/customer/user/login.do",
				type : "POST",
			    async : false,    //是否异步
			    data :  {
			    	account : account,
			    	password : password
			    },
             	success: function(data){  
	               	if(data == "failure"){
	               		alert("账号或者密码错误！");
	               		///$('#myModal').modal('hide');
	               		//
	               	}else {
	               		alert("登录成功！");
	               		window.location.href = "${pageContext.request.contextPath }/admin/main/main.do"
	               	}
             	}  					
		  	});
		  }
	</script>        
    </body>
</html>