package learnonline
import org.compass.core.engine.SearchEngineQueryParseException

class CourseController {

	/*
	 * Action for courses list 
	 */
	def list = { ->
		
		def allCourses = []
		
		for (int i = 1; i <= Course.count(); i++) {
			def oneCourse = Course.findById(i)
			if(oneCourse) {
				allCourses += [oneCourse]
			}
		}
		
		//def empty = !Course.count()
		
		render(view:"list", model:[courses:allCourses]) //isEmpty:empty])
	}
	
	def detail = { ->
		
		def course = Course.findById(params.id)
		def message
		if(!course) {
			message = "Couldn't find course number 00" + params.id + ". Check course ID."
		}
		
		render(view:"detail", model:[course:course, message:message])
	}
	
	def enrol = { ->		
		render(view:"enrol", model:[courses:Course.list()])
	}
	
	def putCourseOnUser = { ->
		def formSubmitted = params.submit
		
		if(formSubmitted) {
			Course enroledCourse = Course.findById(params.courseId)
			User currentUser = User.findById(session.user.id)
			def message
			
			def userCourses = currentUser.courses
			def courseAlreadyEnroled = userCourses.contains(enroledCourse)
			
			if(courseAlreadyEnroled == false) {
				message = "Enrolment in \"" + enroledCourse.toString() + "\" was successful!"
				currentUser.addToCourses(enroledCourse)
				currentUser.save(flush:true) //update user on the database
				session.user = currentUser
			} else {
				message = "You are already Enroled in " + enroledCourse.toString() + ". Choose another course."
			}
			
			render(view:"enrol", model:[courses:currentUser.courses, message:message, courses:Course.list(), enrolmentSuccessful:(!courseAlreadyEnroled)])
		}
	}
	
	def drop = { ->
		render(view:"drop", model:[courses:Course.list()])
	}
	
	def removeCourseFromUser = { ->
		def formSubmitted = params.submit
		
		if(formSubmitted) {
			Course enroledCourse = Course.findById(params.courseId)
			User currentUser = User.findById(session.user.id)
			def message
			
			def userCourses = currentUser.courses
			def courseAlreadyEnroled = userCourses.contains(enroledCourse)
			
			if(courseAlreadyEnroled == true) {
				message = "Drop \"" + enroledCourse.toString() + "\" was successful!"
				//currentUser.courses += [enroledCourse]
				currentUser.removeFromCourses(enroledCourse)
				currentUser.save(flush:true) //update user on the database
				session.user = currentUser
			} else {
				message = "You are not enroled in \"" + enroledCourse.toString() + "\". Choose another course to drop."
			}
			
			render(view:"drop", model:[courses:currentUser.courses, message:message, courses:Course.list(), dropSuccessful:courseAlreadyEnroled])
		}
	}
	
	/*
	 * Managing "searchable" plugin 
	 */
	def searchableService
	
	def search = { ->
		def query = params.query
		
		if(query) {
			
			def searchResult
			
			try {
				searchResult = searchableService.search(query, [offset: 0, max: 5])
			} catch (Exception ex) {
				render(view:"search", model:[exception:true])
			}
			render(view:"search", model:[searchResult:searchResult])
			
		} else {
			render(view:"search", model:[emptySearch:true])
		}
		
	}
}
