<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Learn Online</title>
	</head>
	<body>
		
		<g:if test="${session.user}">
			<h2>Content</h2>
			<ul>
				<li><h4><g:link controller="Course" action="list">Courses List</g:link></h4></li>
				<li><h4><g:link controller="User" action="list">Users List</g:link></h4></li>
				<li><h4><g:link controller="Course" action="enrol">Enrol in a course</g:link></h4></li>
				<li><h4><g:link controller="Course" action="drop">Drop a course</g:link></h4></li>
				<li><h4><g:link controller="User" action="detail" id="${session.user.id}">See your courses</g:link></h4></li>
			</ul>
		</g:if>
		<g:else>
			<br>
			<p>Not already registered?<g:link controller="User" action="register"> Click Here</g:link>.</p>
			<h2>Log in to access the content!</h2>
		</g:else>
				
	</body>
</html>
