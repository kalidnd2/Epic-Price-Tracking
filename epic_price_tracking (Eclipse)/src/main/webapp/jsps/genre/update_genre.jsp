<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Update Genre</title>
    
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
  <h1>Update Genre:</h1>


	<form action="<c:url value='/UpdateGenreServlet'/>" method="post">
		<input type="hidden" name="method" value="regist"/>
		game id    :<input type="text" name="id" value="${form.id }"/>
		<span style="color: red; font-weight: 900">${errors.id }</span>
		<br/>
		<input type="hidden" name="method" value="regist"/>
		Name    :<input type="text" name="name" value="${form.name }"/>
		<span style="color: red; font-weight: 900">${errors.name }</span>
		<br/>
		ParentGenre：<input type="text" name="parentGenre" value="${form.parentGenre }"/>
		<span style="color: red; font-weight: 900">${errors.thumbnail }</span>
		<br/>
		<input type="submit" value="Update Genre"/>
	</form>

  </body>
</html>
