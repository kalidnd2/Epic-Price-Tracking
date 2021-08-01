<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <style><%@include file="/WEB-INF/lib/css/bootstrap.min.css"%></style>
    <script ><%@include file="/WEB-INF/lib/js/bootstrap.min.js"%></script>
    <script
            src="https://code.jquery.com/jquery-3.6.0.slim.js"
            integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
            crossorigin="anonymous"></script>
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <style type="text/css">
        iframe {
            width: 100%;
            height: 100%;
        }
    </style>
</head>

<body>
<div style="display: flex; flex-direction: column; height:100%" class="container">
    <h4>This page displays a list of all users that are currently tracking a game determined by the gameId.</h4>
    <div style="max-height:60px">
        <form action="<c:url value='/UsersTrackingGame'/>" method="post" target = "game_user" class="form-inline">
            <label class="sr-only" for="inlineFormInputName2">Game Id</label>
            <input type="text"  name="gameId" class="form-control mb-2 mr-sm-2" id="inlineFormInputName2" placeholder="Enter Game Id">
            <button type="submit" class="btn btn-primary mb-2">Submit</button>
        </form>
    </div>
    <div style="padding-top: 20px;  height:100%">
        <iframe frameborder="0" name="game_user"></iframe>
    </div>
</div>
</body>
</html>
