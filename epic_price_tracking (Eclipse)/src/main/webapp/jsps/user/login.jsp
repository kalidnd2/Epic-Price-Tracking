<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Login</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<style><%@include file="/WEB-INF/lib/css/bootstrap.min.css"%></style>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <h1>Login</h1>


<p style="color: red; font-weight: 900"> ${msg}</p>
<form action="<c:url value='/UserServletLogin'/>" method="post">
<input type="hidden" name="method" value="login"/>
	<div class="form-group">
		<label for="epic-user-name">Name</label>
		<input id="epic-user-name" class="form-control" required type="text" name="username" value="${form.username }"/>
		<span style="color: red; font-weight: 900">${errors.username }</span>
	</div>	
	<div class="form-group">
		<label for="epic-user-password">Password</label>
		<input id="epic-user-password" class="form-control" required type="password" name="password" value="${form.password }"/>
		<span style="color: red; font-weight: 900">${errors.password }</span>
	</div>
	<input type="submit" class="btn btn-primary" value="Login"/>
</form>
  </body>
</html>
