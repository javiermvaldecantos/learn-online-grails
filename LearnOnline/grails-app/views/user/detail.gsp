<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>User Details - Learn Online</title>
	</head>
	<body>
		<g:if test="${session.user}"> <!-- Only print content if the user is logged in! -->
		
			<h2>User Details</h2>
			
			<g:if test="${message}">
				<h4>${message}</h4>
			</g:if>
			
			<g:if test="${user}">
				<h3>${user.name} ${user.lastName} (${user.role})</h3>
				<p><b>User ID:</b> ${user.id} </p>
				<p><b>Username:</b> ${user.username} </p>
				<p><b>Email:</b> ${user.email} </p>
				<h4>Enroled Courses:</h4>
				<g:if test="${user.courses}">
					<ul>
						<g:each var="course" in="${user.courses}">
							<li>00${course.id} - ${course.name}</li>
						</g:each>
					</ul>
				</g:if>
			</g:if>
			
			<br>
			<br>
			<h4><g:link controller="User" action="list">&lt;&lt;Back to Users List&gt;&gt;</g:link></h4>
			<h4><g:link uri="/">&lt;&lt;Home&gt;&gt;</g:link></h4>
		
		</g:if>
		<g:else>
			<br>
			<p>Not already registered?<g:link controller="User" action="register"> Click Here</g:link>.</p>
			<h2>Log in to access the content!</h2>
		</g:else>
		
	</body>
</html>