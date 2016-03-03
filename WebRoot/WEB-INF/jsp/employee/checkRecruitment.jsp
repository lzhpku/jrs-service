<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查看招聘信息</title>
    
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
    <!-- 导航条 -->
    <jsp:include page="navigation.jsp"/>
	
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>${recruitment.title }</h4>
					</div>
					<div class="panel-body">
						<p>来自：${recruitment.company }</p>
						<br>
						<div class="row">
							<div class="col-md-4">
								<p>公司行业：${recruitment.business }</p>
							</div>
							<div class="col-md-4">
								<p>公司规模：${recruitment.scale }</p>
							</div>
							<div class="col-md-4">
								<p>公司类型：${recruitment.type }</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<p>薪资：${recruitment.salary }</p>
							</div>
							<div class="col-md-4">
								<p>学历：${recruitment.degree }</p>
							</div>
							<div class="col-md-4">
								<p>工作地点：${recruitment.city }</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<p>职位名称：${recruitment.position }</p>
							</div>
							<div class="col-md-4">
								<p>招聘人数：${recruitment.recruitNum }</p>
							</div>
							<div class="col-md-4">
								<p>发布时间：${recruitment.uploadTime }</p>
							</div>
						</div>
						<br>
						<p>
							<%request.setAttribute("enter", "\n"); %>
							职位描述：<br>
							<c:set value="${ fn:split(recruitment.description, enter) }" var="description" />
							<c:forEach items="${ description }" var="desc">
								${ desc } <br />
							</c:forEach>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
    
	<script type="text/javascript" src="bootstrap/js/jquery-1.11.3.min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
