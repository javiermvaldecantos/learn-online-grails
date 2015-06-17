<!DOCTYPE html>
<%@page import="learnonline.Course"%>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Course Details - Learn Online</title>
	</head>
	<body>
		<g:if test="${session.user}"> <!-- Only print content if the user is logged in! -->
		
			<h2>Course Details</h2>
			
			<g:if test="${message}">
				<h4>${message}</h4>
			</g:if>
			
			<g:if test="${course}">
				<h3>00${course.id} - ${course.name}</h3>
				<p><b>Credit Hours:</b> ${course.creditHours} </p>
				<p><b>Professor:</b> ${course.professor} </p>
				<p><b>Description:</b><br> ${course.description} </p>
			</g:if>
			
			<br>
			<br>
			<h4><g:link controller="Course" action="list">&lt;&lt;Back to Courses List&gt;&gt;</g:link></h4>
			<h4><g:link uri="/">&lt;&lt;Home&gt;&gt;</g:link></h4>
		
		</g:if>
		<g:else>
			<br>
			<p>Not already registered?<g:link controller="User" action="register"> Click Here</g:link>.</p>
			<h2>Log in to access the content!</h2>
		</g:else>
		
	</body>
</html>