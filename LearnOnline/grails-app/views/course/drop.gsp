<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Drop - Learn Online</title>
	</head>
	<body>
		<g:if test="${session.user}"> <!-- Only print content if the user is logged in! -->
		
			<g:if test="${dropSuccessful}">
				<g:if test="${message}">
					<h3>${message}</h3>
				</g:if>
				<h4>See all your courses <g:link controller="User" action="detail" id="${session.user.id}">Here</g:link>.</h4>
			</g:if>
			<g:else>
				<g:if test="${message}">
					<h3>${message}</h3>
				</g:if>
				<br>
				<div class="row">
			  		<div class="col-md-5">
						<g:form class="form-horizontal" role="form" controller="Course" action="removeCourseFromUser">
							<legend><h2>Drop a Course</h2></legend>
							<div class="form-group">
								<label class="control-label col-sm-3">Course:</label>
								<div class="col-sm-9">
									<g:select class="form-control" optionKey="id" name="courseId" from="${courses}"/>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-9">
									<g:submitButton class="btn btn-primary" name="submit" value="Drop"/>
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
			<p>Not already registered?<g:link controller="User" action="register"> Click Here</g:link>.</p>
			<h2>Log in to access the content!</h2>
		</g:else>
		
	</body>
</html>