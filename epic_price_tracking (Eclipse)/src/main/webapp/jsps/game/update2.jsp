<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Create Database</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <h1>Update Game:</h1>


	<form action="<c:url value='/UpdateGameServlet'/>" method="post">
		<input type="hidden" name="method" value="regist"/>
		game id    :<input type="text" name="id" value="${form.id }"/>
		<span style="color: red; font-weight: 900">${errors.id }</span>
		<br/>
		<input type="hidden" name="method" value="regist"/>
		Name    :<input type="text" name="name" value="${form.name }"/>
		<span style="color: red; font-weight: 900">${errors.name }</span>
		<br/>
		Thumbnail：<input type="text" name="thumbnail" value="${form.thumbnail }"/>
		<span style="color: red; font-weight: 900">${errors.thumbnail }</span>
		<br/>
		Price	：<input type="text" name="price" value="${form.price }"/>
		<span style="color: red; font-weight: 900">${errors.price }</span>
		<br/>
		<input type="submit" value="Update Game"/>
	</form>

  </body>
</html>
