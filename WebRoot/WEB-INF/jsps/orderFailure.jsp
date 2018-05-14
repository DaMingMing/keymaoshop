<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> --%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>keymao</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css"/>
 <style>
 body{font-family: 微软雅黑;margin: 0 auto;
    min-width: 320px;
    max-width: 640px;
	font-size:14px;
	background:#fff;}
 .pay_content {
    width: 100%;
    height: auto;
    background: #fefefe;
    margin-top: 30px;
    margin-bottom: 20px;
}
.pay_image {
    width: 20%;
    height: auto;
    float: left;
	padding-top:6%;
    margin-left: 3%;}
.pay_success {
    width: 75%;
    float: right;
    height: auto;
}
.succuss_center_a {
    display: inline-block;
    width: 140px;
    height: 40px;
    text-align: center;
    color: #fff;
	border:0;
	margin-right:10px;
    text-decoration: none;
    background: #FF1818;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
}
.succuss_center_b {
    display: inline-block;
    width: 140px;
    height: 40px;
    text-align: center;
    color: #EFF804;
	border:0;
    text-decoration: none;
    background: #FF1818;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
}
.mui-bar{
	margin: 0 auto;
    min-width: 320px;
    max-width: 640px;
}
.clear {
    clear: both;
}
 </style>
  </head>
  
  <body>
     <header class="mui-bar mui-bar-nav">		
        <h1 class="mui-title">您的訂單提交失败！</h1>
    </header>
 	<div class="pay_content">
		<div class="pay_image"><img src="${pageContext.request.contextPath }/img/product/pay_image.png" style="width:100%;"></div>
		<div class="pay_success">
			<h2 style="padding:40px 15px 0px; color:red">訂單失败！請重新下單！</h2>
<!-- 			<div style="padding:15px">
				您的訂單編號：<font color="red">8672303656</font><br>
            
                	應支付：<font color="red">NT$1168.00</font>
            
			</div>  -->  
			<div style="text-align:left;padding:10px 15px 20px">如有任何疑問，
請及時我們在線客服,關注我們的<a href="https://www.facebook.com/keymaous/?ref=settings" target="_blank">Facebook</a>主頁，了解更多產品信息和服務。
祝您購物愉快！</div>   
			<div align="center" style="padding:0px 15px">
				<button type="button" class="succuss_center_a" onclick="goHome();">返回首頁</button>
				<button type="button" class="succuss_center_b" onclick="goHome();" style="display:none">關閉頁面</button>
			</div>
		</div>
	 </div> 
	 <div class="clear"></div>
 <br><br><br><br>
  	<!--footer-->
	<footer>
	    <div class="">
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
  <script language="javascript">
	function goHome(){
		window.location.href = "${pageContext.request.contextPath }/${partHtml}.html";
	}  
  </script>
</body>
</html>
