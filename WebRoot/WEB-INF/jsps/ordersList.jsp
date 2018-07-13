<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> --%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
    <title>keymao shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/page/myPage.css"/>
    
</head>
<body>
	<!--导航-->
	<nav class="navbar navbar-default">
	    <div class="container">
	        <!--小屏幕导航按钮和logo-->
	        <div class="navbar-header">
	            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	            </button>
	            <a href="${pageContext.request.contextPath }/admin/main/main.do" class="navbar-brand">keymao</a>
	        </div>
	        <!--小屏幕导航按钮和logo-->
	        <!--导航-->
	        <div class="navbar-collapse collapse">
	            <ul class="nav navbar-nav">
	                <li><a href="${pageContext.request.contextPath }/admin/main/main.do"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;后台首页</a></li>
	                <li><a href="${pageContext.request.contextPath }/admin/user/list.do"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;用户管理</a></li>
	                <li class="active"><a href="${pageContext.request.contextPath }/admin/orders/list.do"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;订单管理</a></li> 
	                <li><a href="${pageContext.request.contextPath }/admin/operateLog/list.do"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;日志管理</a></li>
	            </ul>
	            <ul class="nav navbar-nav navbar-right">
	                <li class="dropdown">
	                    <a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                        ${sessionScope.account}
	                        <span class="caret"></span>
	                    </a>
	<!--                     <ul class="dropdown-menu" aria-labelledby="dLabel">
	                        <li><a href="index.html"><span class="glyphicon glyphicon-screenshot"></span>&nbsp;&nbsp;前台首页</a></li>
	                        <li><a href="index.html"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;个人主页</a></li>
	                        <li><a href="index.html"><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;个人设置</a></li>
	                        <li><a href="index.html"><span class="glyphicon glyphicon-credit-card"></span>&nbsp;&nbsp;账户中心</a></li>
	                        <li><a href="index.html"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;我的收藏</a></li>
	                    </ul> -->
	                </li>
	                <li><a href="javascript:void(0);" onclick="logout('${pageContext.request.contextPath }')"><span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;退出</a></li>
	            </ul>
	        </div>
	        <!--导航-->
	
	    </div>
	</nav>
	<!--导航-->
	
	<!--警告框-->
	<div class="container">
	    <div class="row">
	        <div class="col-md-12">
	            <div class="panel panel-default">
	                <div class="panel-heading">订单数据管理</div>
						<form class="form-inline"  method="post">
			            	<div class="col-md-12" style="margin: 10px 0px 5px 0px;">
							  <div class="form-group col-md-4">
							    <label for="ordersId">流水号码：</label>
							    <input type="text" class="form-control" id="ordersId" placeholder="请输入流水号码" name="ordersId" value="${orders.ordersId}">
							  </div>
							  <div class="form-group col-md-4">
							    <label for="productName">商品名称：</label>
							    <input type="text" class="form-control" id="productName" placeholder="请输入商品名称" name="productName" value="${orders.productName}">
							  </div>
							  <div class="form-group col-md-4">
							    <label for="phone">收货电话：</label>
							    <input type="text" class="form-control" id="phone" placeholder="请输入收货电话" name="phone" value="${orders.phone}">
							  </div>	
							  							  							  							   						  
							  <!-- <button type="submit" class="btn btn-primary">查询</button> -->
				            </div>	
			            	<div class="col-md-12" style="margin: 5px 0px 10px 0px;">
      						  <div class="form-group col-md-4">
							    <label for="payStatus">付款状态：</label>
								<select class="form-control" id="payStatus" name="payStatus">
								  <option selected value="0">请选择</option>
								  <option value="1" <c:if test="${orders.payStatus == 1}">selected</c:if>>未支付</option>
								  <option value="2" <c:if test="${orders.payStatus == 2}">selected</c:if>>已支付</option>
								</select>							    
							  </div>
					  		  <div class="form-group col-md-4">
							    <label for="transStatus">运输状态：</label>
								<select class="form-control" id="transStatus" name="transStatus">
								  <option selected value="0">请选择</option>
								  <option value="1" <c:if test="${orders.transStatus == 1}">selected</c:if>>未发货</option>
								  <option value="2" <c:if test="${orders.transStatus == 2}">selected</c:if>>已发货</option>  
								  <option value="3" <c:if test="${orders.transStatus == 3}">selected</c:if>>已确认收货</option>
								</select>							    
							  </div>
					  		  <div class="form-group col-md-4">
							    <label for="payType">付款方式：</label>
								<select class="form-control" id="payType" name="payType">
								  <option selected value="0">请选择</option>
								  <option value="1" <c:if test="${orders.payType == 1}">selected</c:if>>货到付款</option>
								  <option value="2" <c:if test="${orders.payType == 2}">selected</c:if>>paypal</option>  
								</select>
							  </div>
						  </div>
						  
			            	<div class="col-md-12" style="margin: 5px 0px 10px 0px;">
      						  <div class="form-group col-md-4">
							    <label for="beginTm">开始日期：</label>
								<input type="text" class="form-control"  placeholder="请选择日期" name="beginTm" value="${orders.beginTm}" id="beginTm">							    
							  </div>
					  		  <div class="form-group col-md-4">
							    <label for="endTm">结束日期：</label>
								<input type="text" class="form-control"  placeholder="请选择日期" name="endTm" value="${orders.endTm}" id="endTm">								    
							  </div>
					  		  <div class="form-group col-md-4">
								<button class="btn btn-primary" type="button" onclick="search()">查询</button>							    
							  </div>
						  </div>						  	                
							  
						</form>
	                <div class="panel-body">
	                    <table class="table table-hover">
	                        <thead>
	                            <tr>
	                                <th>流水号</th>
	                                <th>付款状态</th>
	                                <th>运输状态</th>
	                                <th>付款方式</th>
	                                <th>数量</th>
	                                <th>总价格</th> 
	                                <th>商品名称</th>
	                                <th>收货电话</th>
	                                <th>订单创建日期</th> 
	                                <th>操作</th>                                                               
	                            </tr>
	                        </thead>
	                        <tbody>
								<c:forEach items="${ordersList }" var="orders">
								<tr>
									<td>${orders.ordersId }</td>
									<td>
										<c:if test="${orders.payStatus == 1}">未支付</c:if>
										<c:if test="${orders.payStatus == 2}">已支付</c:if>
									</td>
									<td>
										<c:if test="${orders.transStatus == 1}">未发货</c:if>
										<c:if test="${orders.transStatus == 2}">已发货</c:if>			
										<c:if test="${orders.transStatus == 3}">已确认收货</c:if>						
									</td>
									<td>
										<c:if test="${orders.payType == 1}">货到付款</c:if>
										<c:if test="${orders.payType == 2}">paypal</c:if>										
									</td>
									<td>${orders.amount }</td>
									<td>${orders.totalPrice }</td>		
									<td>${orders.productName }</td>
									<td>${orders.phone }</td>	
									<td><fmt:formatDate value="${orders.createTm}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<td>
										<%-- <a href="${pageContext.request.contextPath }/orders/edit.do?ordersId=${orders.ordersId}" data-target="#myModal" data-toggle="modal">修改</a> --%>
										<a href="javascript:void(0);"  onclick="toEdit('${orders.ordersId}')">修改</a>
									</td>
								
								</tr>
								</c:forEach>
	                        </tbody>
	                    </table>
	                </div>
					<div class="col-md-12 text-center">
				        <ul class="pagination" id="pagination">
				        </ul>
				        
				        <input type="hidden" id="PageCount" runat="server" value="${totalRecords}"/>
				        <input type="hidden" id="PageSize" runat="server" value="${pageSize}" />
				        <input type="hidden" id="countindex" runat="server" value="10"/>
				        <!--设置最多显示的页码数 可以手动设置 默认为7-->
				        <input type="hidden" id="visiblePages" runat="server" value="10" />
				    </div>	   
				    <div class="col-md-12 text-center" style="margin-top: -20px;margin-bottom: 20px;">共 <span id="totalRecords">${totalRecords}</span> 条</div>     
	            </div>
	        </div>
	    </div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	                <h4 class="modal-title" id="myModalLabel">修改订单</h4>
	            </div>
	            <div class="modal-body">
	                <form action="#" class="form-horizontal">
						 <div class="form-group">
						    <label for="editOrderId" class="col-sm-2 control-label">流水号</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="editOrderId" readonly>
						    </div>
						  </div>	
	                    <div class="form-group">
	                        <label for="editPayStatus" class="col-sm-2 control-label">付款状态</label>
	                        <div class="col-sm-10">
		                        <select id="editPayStatus" class="form-control">
		                            <option value="1">未支付</option>
		                            <option value="2">已支付</option>
		                        </select>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label for="editTransStatus" class="col-sm-2 control-label">运输状态</label>
	                        <div class="col-sm-10">
		                        <select id="editTransStatus" class="form-control">
		                            <option value="1">未发货</option>
		                            <option value="2">已发货</option>
		                            <option value="3">已确认收货</option>
		                        </select>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label for="editPayType" class="col-sm-2 control-label">付款方式</label>
	                        <div class="col-sm-10">
		                        <select id="editPayType" class="form-control">
		                            <option value="1">货到付款</option>
		                            <option value="2">paypal</option>
		                        </select>
	                        </div>
	                    </div>	                    	                    
						 <div class="form-group">
						    <label for="editProductName" class="col-sm-2 control-label">商品名称</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="editProductName" readonly>
						    </div>
						  </div>	
						 <div class="form-group">
						    <label for="editPhone" class="col-sm-2 control-label">收货电话</label>
						    <div class="col-sm-10">
						      <input type="email" class="form-control" id="editPhone" readonly>
						    </div>
						  </div>
						 <div class="form-group">
						    <label for="editAmount" class="col-sm-2 control-label">商品数量</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="editAmount" readonly>
						    </div>
						  </div>	
	                    <div class="form-group">
	                        <label for="editAddress" class="col-sm-2 control-label">收货地址</label>
	                        <div class="col-sm-10">
								<input type="text" class="form-control" id="editAddress" readonly>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label for="editUserName" class="col-sm-2 control-label">收货人</label>
	                        <div class="col-sm-10">
								<input type="text" class="form-control" id="editUserName" readonly>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label for="editEmail" class="col-sm-2 control-label">邮箱</label>
	                        <div class="col-sm-10">
								<input type="text" class="form-control" id="editEmail" readonly>
	                        </div>
	                    </div>	                    	                    
	                    <div class="form-group">
	                        <label for="editRemark" class="col-sm-2 control-label">备注信息</label>
	                        <div class="col-sm-10">
								<textarea class="form-control" rows="3" id="editRemark" readonly></textarea>
	                        </div>
	                    </div>		                    						  						  						                  
	                </form>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	                <button type="button" class="btn btn-primary" onclick="update()">提交</button>
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
	
	
	<script src="${pageContext.request.contextPath }/js/jquery-1.12.4.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/laydate.js"></script>
	<script src="${pageContext.request.contextPath }/js/page/jqPaginator.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/utils/timeStamp.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/js/utils/common.js" type="text/javascript"></script>
	<script>
	  	function search(){
	  		var ordersId = $("#ordersId").val();
	  		var productName = $("#productName").val();
	  		var phone = $("#phone").val();
	  		var payStatus = $("#payStatus").val();
	  		var transStatus = $("#transStatus").val();
	  		var payType = $("#payType").val();
	  		var beginTm = $("#beginTm").val();
	  		var endTm = $("#endTm").val();
		  	$.ajax({
				url : "${pageContext.request.contextPath }/admin/orders/getOrdersList.do",
				type : "POST",
			    async : false,    //是否异步
			    data :  {
			    	//currentPageNum : num,
			    	ordersId : ordersId,
			    	productName : productName,
			    	phone : phone,
			    	payStatus : payStatus,
			    	transStatus : transStatus,
			    	payType : payType,
			    	beginTm : beginTm,
			    	endTm : endTm
			    	
			    },
             	success: function(data){  
             		//alert(data);
             		var data = JSON.parse(data)
             		debugger;
             		var totalRecords = data.totalRecords;
             		$("#PageCount").val(totalRecords);
             		var result = "";
             		$(data.listRecords).each(function(){ 
         		   		//alert(this.ordersId+" "+this.payStatus); 
             		  	result =  result + 
             			 "<tr>" + 
                         "<td>" + this.ordersId + "</td>" +
                         "<td>" + getStatusName(1,this.payStatus) + "</td>" +
                         "<td>" + getStatusName(2,this.transStatus) + "</td>" +
                         "<td>" + getStatusName(3,this.payType) + "</td>" +
                         "<td>" + this.amount + "</td>" +
                         "<td>" + this.totalPrice + "</td>" +
                         "<td>" + this.productName + "</td>" +
                         "<td>" + this.phone + "</td>" +
                         "<td>" + timeStamp2String(this.createTm) + "</td>" +
                         "<td>" + "<a href='javascript:void(0);'  onclick=\"toEdit(\'"+this.ordersId+"\')\">修改</a>" + "</td>" +
                         "</tr>";	                     			  
       		       	});	  
             		//局部替换表格数据
             		$('tbody').html(result);
             		//更新分页插件
             		loadpage(1);
             		//更新总条数
             		$("#totalRecords").html(totalRecords);
             		
             	}  					
		  	}); 
		  }
	  
		  function toEdit(orderdId){
		  	$.ajax({
				url : "${pageContext.request.contextPath }/admin/orders/edit.do",
				type : "POST",
			    async : false,    //是否异步
			    data : "ordersId="+orderdId,
              	success: function(data){  
              		//alert(123);
              		//$('#myModal').modal('show');
                	var bean = data;
                	$("#editOrderId").val(bean.ordersId);
                	//当前元素选中，且兄弟元素不被选中
                	$("#editPayStatus option[value='"+bean.payStatus+"']").attr("selected",true).siblings().attr("selected",false);
                	$("#editTransStatus option[value='"+bean.transStatus+"']").attr("selected",true).siblings().attr("selected",false);
                	$("#editPayType option[value='"+bean.payType+"']").attr("selected",true).siblings().attr("selected",false);
                	$("#editPayType").attr("disabled","disabled");
                	$("#editProductName").val(bean.productName);
                	$("#editPhone").val(bean.phone);
                	$("#editPrice").val(bean.price);
                	$("#editAmount").val(bean.amount);
                	$("#editAddress").val(bean.address);
                	$("#editRemark").text(bean.remark);
                	$("#editUserName").val(bean.userName);
                	$("#editEmail").val(bean.email);
                	//显示修改页面
                	$('#myModal').modal('show');
              	}  					
		  	});
		  }
		  
		  function update(){
			 var ordersId =  $("#editOrderId").val();
			 var payStatus =  $("#editPayStatus").val();
			 var transStatus =  $("#editTransStatus").val();
			 //alert(ordersId + '-------' + payStatus);
		  	$.ajax({
				url : "${pageContext.request.contextPath }/admin/orders/update.do",
				type : "POST",
/* 				dataType: "json", 
				contentType:"application/json;charset=UTF-8", */
			    async : false,    //是否异步
			    data :  {
			    	ordersId : ordersId,
			    	payStatus : payStatus,
			    	transStatus : transStatus
			    },
             	success: function(data){  
	               	if(data == "1"){
	               		alert("操作成功！");
	               		$('#myModal').modal('hide');
	               		window.location.href = "${pageContext.request.contextPath }/admin/orders/list.do"
	               	}
             	}  					
		  	});
		  }
		  
	
		//执行一个laydate实例
		  laydate.render({
		    elem: '#beginTm' //指定元素
	    	,type: 'datetime'
		  });	
			//执行一个laydate实例
		  laydate.render({
		    elem: '#endTm' //指定元素
	    	,type: 'datetime'
		  });			
	</script>
    <script type="text/javascript">
        
        //页面状态码变成文字公共方法
        function getStatusName(type,status){
        	var result = "";
        	switch(type){
        	case 1:
        	  if(status == 1){
        		  result = "未支付";
        	  }else if(status == 2){
        		  result = "已支付";
        	  }
        	  break;
        	case 2:
          	  if(status == 1){
        		  result = "未发货";
        	  }else if(status == 2){
        		  result = "已发货";
        	  }else if(status == 3){
        		  result = "已确认收货";
        	  }
        	  break;
        	case 3:
            	  if(status == 1){
          		  result = "货到付款";
          	  }else if(status == 2){
          		  result = "paypal";
          	  }
          	  break;        	  
        	default:
        		result = "";
    		}
        	return result;
        }
        
        function loadpage(currentPage) {
        	debugger;
        	//alert(123);
            var myPageCount = parseInt($("#PageCount").val());
            var myPageSize = parseInt($("#PageSize").val());
            var countindex = myPageCount % myPageSize > 0 ? (myPageCount / myPageSize) + 1 : (myPageCount / myPageSize);
            $("#countindex").val(countindex == 0 ? 1 : countindex);
			
            $.jqPaginator('#pagination', {
                totalPages: parseInt($("#countindex").val()),
                visiblePages: parseInt($("#visiblePages").val()),
                currentPage: currentPage,
                first: '<li class="first"><a href="javascript:;">首页</a></li>',
                prev: '<li class="prev"><a href="javascript:;"><i class="arrow arrow2"></i>上一页</a></li>',
                next: '<li class="next"><a href="javascript:;">下一页<i class="arrow arrow3"></i></a></li>',
                last: '<li class="last"><a href="javascript:;">末页</a></li>',
                page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
                onPageChange: function (num, type) {
                	//alert(123123);
                    if (type == "change") {
                    	debugger;
            	  		var ordersId = $("#ordersId").val();
            	  		var productName = $("#productName").val();
            	  		var phone = $("#phone").val();
            	  		var payStatus = $("#payStatus").val();
            	  		var transStatus = $("#transStatus").val();
            	  		var payType = $("#payType").val();
            	  		var beginTm = $("#beginTm").val();
            	  		var endTm = $("#endTm").val();                    	
	        		  	$.ajax({
	        				url : "${pageContext.request.contextPath }/admin/orders/getOrdersList.do",
	        				type : "POST",
	/*         				dataType: "json", 
	        				contentType:"application/json;charset=UTF-8", */
	        			    async : false,    //是否异步
	        			    data :  {
	        			    	currentPageNum : num,
	        			    	ordersId : ordersId,
	        			    	productName : productName,
	        			    	phone : phone,
	        			    	payStatus : payStatus,
	        			    	transStatus : transStatus,
	        			    	payType : payType,
	        			    	beginTm : beginTm,
	        			    	endTm : endTm	        			    	
	        			    },
	                     	success: function(data){  
	                     		//alert(data);
	                     		var data = JSON.parse(data)
	                     		debugger;
	                     		var totalRecords = data.totalRecords;
	                     		//PageCount = totalRecords;
	                     		$("#PageCount").val(totalRecords);
	                     		var result = "";
	                     		$(data.listRecords).each(function(){ 
                     		   		//alert(this.ordersId+" "+this.payStatus); 
	                     		  	result =  result + 
	                     			 "<tr>" + 
	                                 "<td>" + this.ordersId + "</td>" +
	                                 "<td>" + getStatusName(1,this.payStatus) + "</td>" +
	                                 "<td>" + getStatusName(2,this.transStatus) + "</td>" +
	                                 "<td>" + getStatusName(3,this.payType) + "</td>" +
	                                 "<td>" + this.amount + "</td>" +
	                                 "<td>" + this.totalPrice + "</td>" +
	                                 "<td>" + this.productName + "</td>" +
	                                 "<td>" + this.phone + "</td>" +
	                                 "<td>" + timeStamp2String(this.createTm) + "</td>" +
	                                 //"<td>" + "<a href='javascript:void(0);'  onclick='toEdit("+this.ordersId+")'>修改</a>" + "</td>" +
	                                 "<td>" + "<a href='javascript:void(0);'  onclick=\"toEdit(\'"+this.ordersId+"\')\">修改</a>" + "</td>" +	
	                                 "</tr>";	                     			  
                   		       	});	  
	                     		$('tbody').html(result);
	                     	}  					
	        		  	}); 
	        		  	//exeData(num, PageCount);
                    }
                	
                }
            });
        }
        $(function () {
            loadpage(1);
        });        
    </script>
	</body>
</html>


