<g:if test="${!session.user}">
	<g:form class="form-inline" role="form" controller="User" action="login">
		Username:<g:field class="form-control" type="text" name="username" placeholder="Enter username"/> 
		Password:<g:field class="form-control" type="password" name="password" placeholder="Enter password"/>
		<g:submitButton class="btn btn-default" name="submit" value="Login"/>
	</g:form>
</g:if>
<g:else>
	<g:form class="form-inline" role="form" controller="User" action="logout">
		Welcome User: ${session.user.name} ${session.user.lastName} (${session.user.role}) 
		<g:submitButton class="btn btn-default" name="submit" value="Logout"/>
	</g:form>
</g:else>
