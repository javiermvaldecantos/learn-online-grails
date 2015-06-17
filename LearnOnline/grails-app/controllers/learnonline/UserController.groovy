package learnonline

class UserController {
	
	def salt = "trololo" //for salting passwords
	
	def list = { ->
		
		def allUsers = []
		
		for (int i = 1; i <= User.count(); i++) {
			def oneUser = User.findById(i)
			if(oneUser) {
				allUsers += [oneUser]
			}
		}
		
		render(view:"list", model:[users:allUsers])
	}
	
	def detail = { ->
		
		def user = User.findById(params.id)
		def message
		if(!user) {
			message = "Couldn't find this user. Check user ID."
		}
		
		render(view:"detail", model:[user:user, message:message])
	}
	
	
	def register = { ->
		
		def roles = ["student", "professor"]
		
		render(view:"register", model:[roles:roles])
	}
	
	def createUser = { ->
		
		def formSubmitted = params.submit
		
		if(formSubmitted) {
			def uName = params.name
			def uLastName = params.lastName
			def uEmail = params.email
			def uUsername = params.username
			String uPassword = params.password
			def uRole = params.role
			
			User newUser
			def message = ""
			
			if(uName && uLastName && uEmail && uUsername && uPassword && uRole) {
				User user1 = User.findByUsername(uUsername)
				User user2 = User.findByPassword((uPassword + salt).encodeAsSHA1().toString())
				User user3 = User.findByUsernameAndPassword(uUsername, (uPassword + salt).encodeAsSHA1().toString())
				
				if(user1 || user2 || user3) { // The user already exists! we cannot create it
					message = "The username and/or password you chose already exist in the system. Please provide different username/password."
				} else {
					message = "New user created"
					int lastId = User.count()
					newUser = new User(id:(lastId+1), username:uUsername, password:(uPassword + salt).encodeAsSHA1().toString(), name:uName, lastName:uLastName, role:uRole, email:uEmail)
					session.user = newUser
					newUser.save(flush:true)
				}
				
			} else {
				message = "One or more fields were empty! Please complete them."
			}
			def roles = ["student", "professor"]
			render(view:"register", model:[user:newUser, message:message, roles:roles])
		}
		
	}
	
	def login() {
		String saltedPassword = params.password.toString() + salt 
		User user = User.findByUsernameAndPassword(params.username, saltedPassword.encodeAsSHA1().toString())
		if(user) {
			session.user = user 
		}
		
		redirect(uri:"/")
	}
	
	def logout() {
		session.user = null
		redirect(uri:'/')
	}
	
    def index() { }
}
