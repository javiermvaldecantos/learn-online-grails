<!DOCTYPE html>
<%@page import="learnonline.Course"%>
<%@page import="org.springframework.util.ClassUtils"%>
<%@page import="grails.plugin.searchable.internal.lucene.LuceneUtils"%>
<%@page import="grails.plugin.searchable.internal.util.StringQueryUtils"%>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Search Results - Learn Online</title>
	</head>
	<body>
		<g:if test="${session.user}"> <!-- Only print content if the user is logged in! -->
		
			<h2>Search Results</h2>
			<g:if test="${emptySearch}">
				<br>
				<h3>The Search field was empty. Search again.</h3>
				<br>
			</g:if>
			<g:elseif test="${exception}">
				<br>
				<h3>Oops. Something went wrong. Try searching again!</h3>
				<br>
			</g:elseif>
			<g:elseif test="${searchResult}">
			
				<g:if test="${searchResult.results}">
					<div class="results">
						<g:each var="result" in="${searchResult.results}" status="index">
							<div class="result">
								<g:set var="className" value="${ClassUtils.getShortName(result.getClass())}" />
								<g:set var="link" value="${createLink(controller: className[0].toLowerCase() + className[1..-1], action: 'detail', id: result.id)}" />
								<div class="name"><h3><a href="${link}">${className} #00${result.id}</a></h3></div>
								<g:set var="desc" value="${result.toString()}" />
								<g:if test="${desc.size() > 120}"><g:set var="desc" value="${desc[0..120] + '...'}" /></g:if>
								<div class="desc"><h4>${desc.encodeAsHTML()}</h4></div>
								<div class="displayLink">${link}</div>
								<br>
							</div>
						</g:each>
					</div>
				</g:if>
				<g:else>
					<br>
					<h3>Your search didn't have any results. Sorry.</h3>
					<br>
				</g:else>
				
			</g:elseif>
			<g:else>
				<br>
				<h3>Your search didn't have any results. Sorry.</h3>
				<br>	
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