<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Courses List - Learn Online</title>
	</head>
	<body>
		<g:if test="${session.user}"> <!-- Only print content if the user is logged in! -->
		
			<h2>Courses List</h2>
			
			<g:if test="${courses}">
				<g:each var="course" in="${courses}">
					<h4><g:link controller="Course" action="detail" id="${course.id}">00${course.id} - ${course.name} (${course.creditHours} Credit Hours)</g:link></h4>
					<p><b>Professor:</b> ${course.professor}</p>
					<br>
				</g:each>
			</g:if>
			
			<h4><g:link uri="/">&lt;&lt;Home&gt;&gt;</g:link></h4>
		
		</g:if>
		<g:else>
			<br>
			<p>Not already registered?<g:link controller="User" action="register"> Click Here</g:link>.</p>
			<h2>Log in to access the content!</h2>
		</g:else>
		
	</body>
</html>