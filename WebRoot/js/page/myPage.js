function exeData(num, type) {
    loadData(num);
    loadpage(num);
}
function loadpage(currentPage) {
    var myPageCount = parseInt($("#PageCount").val());
    var myPageSize = parseInt($("#PageSize").val());
    var countindex = myPageCount % myPageSize > 0 ? (myPageCount / myPageSize) + 1 : (myPageCount / myPageSize);
    $("#countindex").val(countindex);

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
        	debugger;
        	alert(num);
	        //window.location.href = "${pageContext.request.contextPath }/admin/orders/list.do?currentPageNum="+num;
        	//window.location.href = "http://www.baidu.com"
            if (type == "change") {
                exeData(num, type);
            }
        }
    });
}
$(function () {
    loadData(1);
    loadpage(1);
});