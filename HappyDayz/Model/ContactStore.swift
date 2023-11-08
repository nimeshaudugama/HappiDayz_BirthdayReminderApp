//
//  ContactStore.swift
//  HappyDayz
//
//  Created by Nimesha Jayathissa on 2023-10-24.
//

import Foundation
import Observation
import Combine

@Observable
final class ContactStore :ObservableObject{
    var contacts: [Contact]
    
    init(contacts: [Contact] = mockData) {
        self.contacts = contacts
       // loadBirthdayNotes()
    }
    
    
   // private let birthdayNotesKey = "BirthdayNotes" // UserDefaults key
       
//       func saveBirthdayNotes() {
//           var notesToSave = [String: String]()
//           for contact in contacts {
//               notesToSave[contact.id.uuidString] = contact.birthdayNotes
//           }
//           
//           if let data = try? JSONEncoder().encode(notesToSave) {
//               UserDefaults.standard.set(data, forKey: birthdayNotesKey)
//           }
//       }
//       
//       func loadBirthdayNotes() {
//           if let data = UserDefaults.standard.data(forKey: birthdayNotesKey),
//              let loadedNotes = try? JSONDecoder().decode([String: String].self, from: data) {
//               for (contactID, notes) in loadedNotes {
//                   if var contact = contacts.first(where: { $0.id.uuidString == contactID }) {
//                       contact.birthdayNotes = notes
//                   }
//               }
//           }
//       }
}

extension ContactStore {
    static var mockData = [
        Contact(firstName: "Tom",
                lastName: "Brady",
                phone: "(416)123-4567",
                email: "tom.brady@gmail.com",
                birthday: "18th August 1991",
                address: "588 Riviera Drive",
                city: "Tampa Bay",
                country: "US",
                birthdayNotes: "Test",
                savedBirthdayNotes: ""
                
               ),
        Contact(firstName: "Payton",
                lastName: "Manning",
                phone: "(647)123-4567",
                email: "manning@gmail.com",
                birthday: "1st Oct 1992",
                address: "55 Haverstock Cr.",
                city: "Georgetown",
                country: "Canada",
                birthdayNotes: "",
                savedBirthdayNotes: ""
               ),
        Contact(firstName: "John",
                lastName: "Doe",
                phone: "(905)123-4567",
                email: "john@gmail.com",
                birthday: "20th Jan 1999",
                address: "55 Bristol Dr.",
                city: "Caledon",
                country: "Canada",
                birthdayNotes: "",
                savedBirthdayNotes: ""
               ),
        Contact(firstName: "Brett",
                lastName: "Let",
                phone: "(416)123-4567",
                email: "dv@gmail.com",
                birthday: "8th Dec 2000",
                address: "69 Wellington St. West",
                city: "Toronto",
                country: "CAN",
                birthdayNotes: "",
                savedBirthdayNotes: ""
               ),
        Contact(firstName: "Virat",
                lastName: "Kohli",
                phone: "(647)123-4567",
                email: "manning@gmail.com",
                birthday: "25th June 1996",
                address: "20 Fishing Cr.",
                city: "Brampton",
                country: "Canada",
                birthdayNotes: "",
                savedBirthdayNotes: ""
               ),
        Contact(firstName: "Rohit",
                lastName: "Sharma",
                phone: "(647)123-4567",
                email: "sharma@gmail.com",
                birthday: "20th May 1999",
                address: "22 Fishing Cr.",
                city: "Brampton",
                country: "Canada",
                birthdayNotes: "",
                savedBirthdayNotes: ""
               )
    ]
    
    static var testStore: ContactStore = ContactStore(contacts: mockData)
    
    
    func updateContact(_ contact: Contact) {
        if let index = contacts.firstIndex(where: { $0.id == contact.id }) {
            contacts[index] = contact
        }
        
    }
}
