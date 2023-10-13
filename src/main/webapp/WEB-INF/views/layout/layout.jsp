<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<tiles:insertAttribute name="header"/>
</head>
<body class="hold-transition sidebar-mini layout-fixed text-sm">
	<div class="wrapper">
		<tiles:insertAttribute name="menu"/>
		<tiles:insertAttribute name="body"/>
		<tiles:insertAttribute name="footer"/>
	</div>
	<tiles:insertAttribute name="script"/>
</body>
</html>