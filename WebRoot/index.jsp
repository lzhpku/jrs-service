<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Jobpopo</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<style>
		body {
			padding-top: 80px;
		}	
	</style>

  </head>
  
  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="javascript:void(0)"><span style="color:orange">Jobpopo</span></a>
				<a class="navbar-brand" href="employee.jsp">职位搜索</a>
				<a class="navbar-brand" href="employer.jsp">简历搜索</a>
			</div>			
			<div class="navbar-collapse collapse">
				<c:if test="${empty employee }">
					<form action="/employee/login" method="post" class="navbar-form navbar-right">
						<div class="form-group">
							<input name="username" type="text" placeholder="Email"
								class="form-control">
						</div>
						<div class="form-group">
							<input name="password" type="password" placeholder="Password"
								class="form-control">
						</div>
						<button type="submit" class="btn btn-primary">登录</button>
						<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='/employee/regist'">注册</button>
					</form>
				</c:if>
				<c:if test="${not empty employee }">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">
								${employee.email }
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu">
								<c:if test="${employee.hasResume == 0 }">
									<li><a href="resume/addResume">创建简历</a></li>
								</c:if>
								<c:if test="${employee.hasResume == 1 }">
									<li><a href="resume/checkResume?employeeId=${employee.id }">查看简历</a></li>
									<li><a href="search/updateRelevanceForEmployee">更新推荐职位</a></li>
									<li><a href="search/listMatchPosition?offset=0">查看推荐职位</a></li>
									<li><a href="employee/check?employeeId=${employee.id }">订阅职位推送</a></li>
								</c:if>
								<li role="separator" class="divider"></li>
								<li><a href="employee/logout">退出</a></li>
							</ul>
						</li>
					</ul>
				</c:if>
			</div>
			<!--/.navbar-collapse -->
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="jumbotron">
				<p><strong style="color:#727272;">欢迎注册成为Jobpopo用户</strong></p>
				<p><strong style="color:#727272;">请上传您的简历，我们将为您推荐适合的职位</strong></p>
				<p><strong style="color:#727272;">您也可以使用职位搜索功能寻找您需要的职位</strong></p>
				<div class="row">
	        		<form class="form" method="POST" action="employee/regist">
	          			<div class="form-group">
	                		<div class="col-md-3 no-left-padding">
	                			<input style="width:90%" type="text" name="email" id="email" class="form-control input-lg" placeholder="Email" />
	                		</div>
	              		</div>
	              		<div class="form-group">
	                		<div class="col-md-3 no-left-padding">
	                			<input style="width:90%" type="password" name="password" id="password" class="form-control input-lg" placeholder="Password" />
	                		</div>
	              		</div>
	              		<div class="form-group">
	              			<div class="col-md-3 no-left-padding">
	                			<button style="width:90%" class="btn btn-primary btn-lg" type="submit">注册账号</button>
	                		</div>
	              		</div>
	              	</form>
	              	<form class="form" method="POST" action="employee/login">
	              		<input type='hidden' name='username' value='test@pku.edu.cn' />
	              		<input type='hidden' name='password' value='hhlsnyjbz' />
	              		<div class="form-group">
	              			<div class="col-md-3 no-left-padding">
	                			<button style="width:90%" class="btn btn-primary btn-lg" type="submit">立即体验</button>
	                		</div>
	              		</div>
	              	</form>
	            </div>
			</div>
		</div>
	</div><!-- /.container -->
	
	<!-- js在最后加载 -->
	<script src="bootstrap/js/jquery-1.11.3.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
