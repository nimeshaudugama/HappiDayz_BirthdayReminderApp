import Foundation

struct Contact: Identifiable {
    var id = UUID()
    let firstName: String
    let lastName: String
    let phone: String
    let email: String
    let birthday:String
    let address: String
    let city: String
    let country: String
    var birthdayNotes :String
    var savedBirthdayNotes: String
    
   
    
    
    
    internal init(firstName: String, lastName: String, phone: String, email: String,birthday:String, address: String, city: String, country: String,birthdayNotes:String,savedBirthdayNotes:String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
        self.email = email
        self.birthday = birthday
        self.address = address
        self.city = city
        self.country = country
        self.birthdayNotes = birthdayNotes
        self.savedBirthdayNotes = savedBirthdayNotes
      
    }
    
    
}
