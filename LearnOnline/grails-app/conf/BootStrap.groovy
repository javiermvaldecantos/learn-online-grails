import learnonline.Course
import learnonline.User

class BootStrap {

    def init = { servletContext ->
		
		/*
		 * CREATING SAMPLE COURSES & USERS
		 */
		
		if(!Course.count()) {	//Create courses if table is empty
			
			def course1 = new Course(id:1, name:"Web Site App Development", professor:"Jason Lambert", creditHours:3, description:"Advanced development of web applicatons using different programming languages, for example PHP, HTML, SQL and Grails.")
			course1.save(flush:true)
			def course2 = new Course(id:2, name:"Wireless Technology and Applications", professor:"Peisong Huang", creditHours:4, description:"This course will provide students with the knowledge of wireless communication technologies. The course will focus on the 3G and 4G wireless networks such as UMTS, LTE, and WiMAX.")
			course2.save(flush:true)
			def course3 = new Course(id:3, name:"Embedded Systems", professor:"Jeremy Hajek", creditHours:3, description:"Design (from both HW and SW points of view) of embedded systems. Basic knowledge about microprocessors, electronics and C programming language is recomended.")
			course3.save(flush:true)
			def course4 = new Course(id:4, name:"Rich Internet Applications", professor:"Jason Lambert", creditHours:4, description:"Advanced development of web applications from the client point of view. HTML and javascript will be used throughout the course.")
			course4.save(flush:true)
			def course5 = new Course(id:5, name:"Windows Applications", professor:"Martin Schray", creditHours:2, description:"Development of both Windows 8.1 and Windows Phone applications, using C# and XAML.")
			course5.save(flush:true)
			def course6 = new Course(id:5, name:"Telecommunications over Data Networks", professor:"Carol Davids", creditHours:3, description:"This course covers a suite of application protocols known as Voice over IP (VoIP).")
			course6.save(flush:true)
			
			if(!User.count()) {	//Create users if table is empty. Use created courses for them
				
				def salt = "trololo" //for salting passwords
				
				def user1 = new User(id:1, username:"jmorenov", password:("password1" + salt).encodeAsSHA1().toString(), name:"Javier", lastName:"Moreno Valdecantos", role:"student", email:"jmorenov@hawk.iit.edu", courses:[course1, course2])
				user1.save(flush:true)
				def user2 = new User(id:2, username:"jlamber4", password:("password2" + salt).encodeAsSHA1().toString(), name:"Jason", lastName:"Lambert", role:"professor", email:"jlamber4@hawk.iit.edu", courses:[course1])
				user2.save(flush:true)
				def user3 = new User(id:3, username:"smatches", password:("password3" + salt).encodeAsSHA1().toString(), name:"Safder", lastName:"Matcheswala", role:"student", email:"smatchesw@hawk.iit.edu", courses:[course2, course3])
				user3.save(flush:true)
				def user4 = new User(id:4, username:"pmontojo", password:("password4" + salt).encodeAsSHA1().toString(), name:"Paula", lastName:"Montojo Torrente", role:"student", email:"pmontojo@hawk.iit.edu", courses:[course1, course2, course5])
				user4.save(flush:true)
				def user5 = new User(id:5, username:"achatell", password:("password5" + salt).encodeAsSHA1().toString(), name:"Amber", lastName:"Chatellier", role:"professor", email:"achatell@hawk.iit.edu", courses:[course3, course4])
				user5.save(flush:true)
				
			}
			
		}
		
    }
    def destroy = {
    }
}
