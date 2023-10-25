import Foundation

struct Contact: Identifiable {
    let id = UUID()
    let firstName: String
    let lastName: String
    let phone: String
    let email: String
<<<<<<< HEAD
    let address: String
    let city: String
    let country: String
    let birthDate: String
    let isFavorite: Bool
    
    
    //TODO: Add computed property for full name
    var fullName: String {
            return "\(firstName) \(lastName)"
        }
    //TODO: Add computed property for full address
    var fullAddress: String {
            return "\(address), \(city), \(country)"
        }
=======
    let birthday:String
    let address: String
    let city: String
    let country: String
   
    
    
    
    internal init(firstName: String, lastName: String, phone: String, email: String,birthday:String, address: String, city: String, country: String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
        self.email = email
        self.birthday = birthday
        self.address = address
        self.city = city
        self.country = country
      
    }
>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d
}
