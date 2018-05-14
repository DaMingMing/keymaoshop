<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	                <li><a href="${pageContext.request.contextPath }/admin/orders/list.do"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;订单管理</a></li> 
	                <li class="active"><a href="${pageContext.request.contextPath }/admin/operateLog/list.do"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;日志管理</a></li>
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
	                <div class="panel-heading">操作日志数据管理</div>
						<form class="form-inline" action="" method="post">
			            	<div class="col-md-12" style="margin: 10px 0px 5px 0px;">
							  <div class="form-group col-md-4">
							    <label for="account">操作账号：</label>
							    <input type="text" class="form-control" id="account" placeholder="请输入操作人账号" name="account" value="${operateLog.account}">
							  </div>
							  <div class="form-group col-md-4">
							    <label for="logDetail">操作详情：</label>
							    <input type="text" class="form-control" id="logDetail" placeholder="请输入部分操作详情" name="logDetail" value="${operateLog.logDetail}">
							  </div>
							  							  							  							   						  
				            </div>	
			            	<div class="col-md-12" style="margin: 5px 0px 10px 0px;">
					  		  <div class="form-group col-md-4">
							    <label for=logModuleType>操作模块：</label>
								<select class="form-control" id="logModuleType" name="logModuleType">
								  <option selected value="0">请选择</option>
								  <option value="1" <c:if test="${operateLog.logModuleType == 1}">selected</c:if>>订单模块</option>
								  <option value="2" <c:if test="${operateLog.logModuleType == 2}">selected</c:if>>用户模块</option>  
								</select>
							  </div>			            	
					  		  <div class="form-group col-md-4">
							    <label for="logType">操作类型：</label>
								<select class="form-control" id="logType" name="logType">
								  <option selected value="0">请选择</option>
								  <option value="1" <c:if test="${operateLog.logType == 1}">selected</c:if>>修改</option>
								  <option value="2" <c:if test="${operateLog.logType == 2}">selected</c:if>>新增</option>  
								  <option value="3" <c:if test="${operateLog.logType == 3}">selected</c:if>>删除</option>
								</select>							    
							  </div>
						  	</div>	 
			            	<div class="col-md-12" style="margin: 5px 0px 10px 0px;">
      						  <div class="form-group col-md-4">
							    <label for="beginTm">开始日期：</label>
								<input type="text" class="form-control"  placeholder="请选择日期" name="beginTm" value="${operateLog.beginTm}" id="beginTm">							    
							  </div>
					  		  <div class="form-group col-md-4">
							    <label for="endTm">结束日期：</label>
								<input type="text" class="form-control"  placeholder="请选择日期" name="endTm" value="${operateLog.endTm}" id="endTm">								    
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
		                                <th>操作模块</th>
		                                <th>操作类型</th>
		                                <th>操作详情</th>
		                                <th>操作人账号</th>
		                                <th>操作日期</th>
		                            </tr>
		                        </thead>
		                        <tbody>
									<c:forEach items="${operateLogList }" var="bean">
										<tr>
											<td>
												<c:if test="${bean.logModuleType == 1}">订单模块</c:if>
												<c:if test="${bean.logModuleType == 2}">用户模块</c:if>
											</td>
											<td>
												<c:if test="${bean.logType == 1}">修改</c:if>
												<c:if test="${bean.logType == 2}">新增</c:if>			
												<c:if test="${bean.logType == 3}">删除</c:if>						
											</td>
											<td>${bean.logDetail }</td>
											<td>${bean.account }</td>		
											<td><fmt:formatDate value="${bean.createTm}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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
			
	        //页面状态码变成文字公共方法
	        function getStatusName(type,status){
	        	var result = "";
	        	switch(type){
	        	case 1:
	        	  if(status == 1){
	        		  result = "订单模块";
	        	  }else if(status == 2){
	        		  result = "用户模块";
	        	  }
	        	  break;
	        	case 2:
	          	  if(status == 1){
	        		  result = "修改";
	        	  }else if(status == 2){
	        		  result = "新增";
	        	  }else if(status == 3){
	        		  result = "删除";
	        	  }
	        	  break;
	        	default:
	        		result = "";
	    		}
	        	return result;
	        }
	        
	        
		  	function search(){
		  		var account = $("#account").val();
		  		var logDetail = $("#logDetail").val();
		  		var logModuleType = $("#logModuleType").val();
		  		var logType = $("#logType").val();
		  		var beginTm = $("#beginTm").val();
		  		var endTm = $("#endTm").val();
			  	$.ajax({
					url : "${pageContext.request.contextPath }/admin/operateLog/getOperateLogList.do",
					type : "POST",
				    async : false,    //是否异步
				    data :  {
				    	//currentPageNum : num,
				    	account : account,
				    	logDetail : logDetail,
				    	logModuleType : logModuleType,
				    	logType : logType,
				    	beginTm : beginTm,
				    	endTm : endTm
				    	
				    },
	             	success: function(data){  
	             		//alert(data);
	             		var data = JSON.parse(data);
	             		debugger;
	             		var totalRecords = data.totalRecords;
	             		$("#PageCount").val(totalRecords);
	             		var result = "";
                 		$(data.listRecords).each(function(){ 
                 		  	result =  result + 
                 			 "<tr>" + 
                             "<td>" + getStatusName(1,this.logModuleType) + "</td>" +
                             "<td>" + getStatusName(2,this.logType) + "</td>" +
                             "<td>" + this.logDetail + "</td>" +
                             "<td>" + this.account + "</td>" +
                             "<td>" + timeStamp2String(this.createTm) + "</td>" +
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
	        		  		var account = $("#account").val();
	        		  		var logDetail = $("#logDetail").val();
	        		  		var logModuleType = $("#logModuleType").val();
	        		  		var logType = $("#logType").val();
	        		  		var beginTm = $("#beginTm").val();
	        		  		var endTm = $("#endTm").val();                 	
		        		  	$.ajax({
		        		  		url : "${pageContext.request.contextPath }/admin/operateLog/getOperateLogList.do",
		        				type : "POST",
		/*         				dataType: "json", 
		        				contentType:"application/json;charset=UTF-8", */
		        			    async : false,    //是否异步
		        			    data :  {
		        			    	currentPageNum : num,
		    				    	account : account,
		    				    	logDetail : logDetail,
		    				    	logModuleType : logModuleType,
		    				    	logType : logType,
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
		                     		  	result =  result + 
		                     			 "<tr>" + 
		                                 "<td>" + getStatusName(1,this.logModuleType) + "</td>" +
		                                 "<td>" + getStatusName(2,this.logType) + "</td>" +
		                                 "<td>" + this.logDetail + "</td>" +
		                                 "<td>" + this.account + "</td>" +
		                                 "<td>" + timeStamp2String(this.createTm) + "</td>" +
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
	            //loadData(1);
	            loadpage(1);
	        });  
	        
	</script>	
	</body>
</html>


