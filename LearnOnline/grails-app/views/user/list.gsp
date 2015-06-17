<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Users List - Learn Online</title>
	</head>
	<body>
		<g:if test="${session.user}"> <!-- Only print content if the user is logged in! -->
		
			<h2>Users List</h2>
		
			<g:if test="${users}">
				<g:each var="user" in="${users}">
					<h4><g:link controller="User" action="detail" id="${user.id}">${user.name} ${user.lastName} (${user.role})</g:link></h4>
					<p><b>Username: </b> ${user.username}</p>
					<p><b>Email:</b> ${user.email} </p>
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