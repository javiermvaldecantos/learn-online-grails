<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Register - Learn Online</title>
	</head>
	<body>
		<g:if test="${!session.user}"> <!-- Only print content if the user is NOT logged in! -->
		
			<g:if test="${user}">
				<h3>${message}</h3>
				<br>
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
				<g:else>
					<p>You have no enroled courses. <g:link controller="Course" action="enrol">Click here to enrol</g:link></p>
				</g:else>
			</g:if>
			<g:else>
				<g:if test="${message}">
					<h3>${message}</h3>
				</g:if>
				<br>
				<div class="row">
			  		<div class="col-md-5">
						<g:form class="form-horizontal" role="form" controller="User" action="createUser">
							<legend><h2>New User Registration</h2></legend>
							<div class="form-group">
								<label class="control-label col-sm-3">Name:</label>
								<div class="col-sm-9">
									<g:field class="form-control" type="text" name="name"/>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3">Last Name:</label>
								<div class="col-sm-9">
									<g:field class="form-control" type="text" name="lastName"/>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3">Email:</label>
								<div class="col-sm-9">
									<g:field class="form-control" type="text" name="email"/>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3">Username:</label>
								<div class="col-sm-9">
									<g:field class="form-control" type="text" name="username"/>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3">Password:</label>
								<div class="col-sm-9">
									<g:field class="form-control" type="password" name="password"/>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3">Role:</label>
								<div class="col-sm-9">
									<g:select class="form-control" name="role" from="${roles}"/>
								</div>
							</div>
							<div class="form-group"> 
								<div class="col-sm-offset-3 col-sm-9">
									<g:submitButton class="btn btn-primary" name="submit" value="Register"/>
								</div>
							</div>
						</g:form>
						
					</div>
				</div>		
			</g:else>
			<br>
			<br>
			<h4><g:link uri="/">&lt;&lt;Home&gt;&gt;</g:link></h4>
		
		</g:if>
		<g:else>
			<br>
			<h3>You are already logged in! You don't need to register</h3>
			<br>
			<br>
			<h4><g:link uri="/">&lt;&lt;Home&gt;&gt;</g:link></h4>
		</g:else>
		
	</body>
</html>