package learnonline

class User {
	
	static searchable = false
	
	Integer id
	String username
	String password
	String name
	String lastName
	String role //student or professor
	String email
	static hasMany = [courses: Course]

	static mapping = {
		courses lazy: false
	}
    static constraints = {
    }
	
	String toString() {
		"$name $lastName ($role)"
	}
}
