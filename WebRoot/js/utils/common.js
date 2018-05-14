  
function logout(contextPath){
  	if(confirm("是否确认要退出?")){
  		window.location.href = contextPath + "/admin/user/logout.do";
  	}			  
  }	