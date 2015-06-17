package learnonline

class Course {
	
	static searchable = true
	
	Integer id
	String name
	String professor //string or user??
	Integer creditHours
	String description
	
	String toString() {
		"00$id - $name"
	}
	
    static constraints = {
    }
}
