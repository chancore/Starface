<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
  	<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <title>星脸联盟</title>
    <!-- Bootstrap core CSS -->
    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/buttons.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="resources/css/dashboard.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <jsp:include page="top.jsp"></jsp:include>

    <div class="container-fluid">
      <div class="row">
        <jsp:include page="left.jsp"></jsp:include>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <div class="row">
        	日志管理
        	<form action="weblog/manager/list" method="POST" id="ticketManagerForm">
        	<div class="col-md-2">
	        	<input name="userName" value=""/>
        	</div>
        	<div class="col-md-3">
	        	<input name="nickName" value=""/>
        	</div>
        	<div class="col-md-2">
	        	<input name="codeName" value=""/>
        	</div>
        	<div class="col-md-2">
	        	<button type="button" class="btn btn-primary" onclick="submit_form()">搜索</button>
        	</div>
        	</form>
        </div>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>用户ID</th>
                  <th>用户</th>
                  <th style="width:300px;">日志内容</th>
                  <th>日志权限</th>
                  <th>点赞数</th>
                  <th>评论数</th>
                  <th>创建时间</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${list }" var="i">
                <tr>
                  <td>${i.id }</td>
                  <td>${i.userId }</td>
                  <td >${i.name }</td>
                  <td >${i.content }</td>
                  <td>
                  	<c:if test="${i.isPrivate == 0 }">所有人可见</c:if>
                  	<c:if test="${i.isPrivate == 1 }">仅好友可见</c:if>
                  	<c:if test="${i.isPrivate == 2 }">私密</c:if>
                  </td>
                  <td>
                  	${i.commentCount }
                  </td>
                  <td>
                  	${i.praiseCount }
                  </td>
                  <td>
                  	${i.createTimeView }
                  </td>
                  <td>
                  <span class="button-dropdown" data-buttons="dropdown">
				    <button class="button button-rounded">
				      <span style="font-size;14px;word-break:keep-all;white-space:nowrap;">操作</span><i class="fa fa-caret-down"></i>
				    </button>
				    <ul class="button-dropdown-list">
				      <li><a href="javascript:void(0);" onclick="deleteWeblog(${i.id})">删除日志</a></li>
				    </ul>
				  </span>
                  </td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
          <nav>
			  <ul class="pagination">
			    <li>
			      <a href="weblog/manager/list?start=${page.currentPage-1 <= 0 ? 0: page.currentPage-1}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <c:forEach items="${page.pageList }" var="i">
			    <li <c:if test="${i==page.currentPage }">class="active"</c:if>><a  href="weblog/manager/list?start=${i }">${i+1 }</a></li>
			    </c:forEach>
			    <li>
			      <a href="weblog/manager/list?start=${page.currentPage+1 >= page.totalPage ? page.totalPage-1: page.currentPage+1 }" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
        </div>
      </div>
    </div>
	<!-- Modal -->  
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="resources/js/ie10-viewport-bug-workaround.js"></script>
    <script src="http://files.cnblogs.com/rubylouvre/bootstrap-modal.js"></script>
    <script src="http://www.bootcss.com/p/buttons/js/buttons.js"></script>
    <script type="text/javascript">
    function submit_form(){
    	$("#ticketManagerForm").submit();
    }
    function openWin(url){
    	window.open(url,'newwindow','height=auto,width=auto,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no') ;
    }
    function deleteWeblog(id){
    	if(confirm("确定要删除该日志吗?删除后不可恢复.")){
    		$.post("weblog/delete_weblog",{id:id},function(result){
       			window.location.reload();
        	});
    	}
    	
    }
    
    </script>
  </body>
</html>
