<<<<<<< HEAD
=======
//
//  ContactStore.swift
//  HappyDayz
//
//  Created by Nimesha Jayathissa on 2023-10-24.
//

>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d
import Foundation
import Observation

@Observable
final class ContactStore {
    var contacts: [Contact]
    
    init(contacts: [Contact] = mockData) {
        self.contacts = contacts
    }
}

extension ContactStore {
    static var mockData = [
        Contact(firstName: "Tom",
                lastName: "Brady",
                phone: "(416)123-4567",
                email: "tom.brady@gmail.com",
<<<<<<< HEAD
                address: "588 Riviera Drive",
                city: "Tampa Bay",
                country: "US",
                birthDate: "June 17, 1997",
                isFavorite: true),
=======
                birthday: "18th August 1991",
                address: "588 Riviera Drive",
                city: "Tampa Bay",
                country: "US"
               ),
>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d
        Contact(firstName: "Payton",
                lastName: "Manning",
                phone: "(647)123-4567",
                email: "manning@gmail.com",
<<<<<<< HEAD
                address: "55 Haverstock Cr.",
                city: "Georgetown",
                country: "Canada",
                birthDate: "August 09, 1994",
                isFavorite: false),
=======
                birthday: "1st Oct 1992",
                address: "55 Haverstock Cr.",
                city: "Georgetown",
                country: "Canada"
           ),
>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d
        Contact(firstName: "John",
                lastName: "Doe",
                phone: "(905)123-4567",
                email: "john@gmail.com",
<<<<<<< HEAD
                address: "55 Bristol Dr.",
                city: "Caledon",
                country: "Canada",
                birthDate: "August 09, 1994",
                isFavorite: false),
=======
                birthday: "20th Jan 1999",
                address: "55 Bristol Dr.",
                city: "Caledon",
                country: "Canada"
               ),
>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d
        Contact(firstName: "Brett",
                lastName: "Let",
                phone: "(416)123-4567",
                email: "dv@gmail.com",
<<<<<<< HEAD
                address: "69 Wellington St. West",
                city: "Toronto",
                country: "CAN",
                birthDate: "June 20, 1994",
                isFavorite: true),
=======
                birthday: "8th Dec 2000",
                address: "69 Wellington St. West",
                city: "Toronto",
                country: "CAN"
               ),
>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d
        Contact(firstName: "Virat",
                lastName: "Kohli",
                phone: "(647)123-4567",
                email: "manning@gmail.com",
<<<<<<< HEAD
                address: "20 Fishing Cr.",
                city: "Brampton",
                country: "Canada",
                birthDate: "August 18, 1992",
                isFavorite: true),
=======
                birthday: "25th June 1996",
                address: "20 Fishing Cr.",
                city: "Brampton",
                country: "Canada"
               ),
>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d
        Contact(firstName: "Rohit",
                lastName: "Sharma",
                phone: "(647)123-4567",
                email: "sharma@gmail.com",
<<<<<<< HEAD
                address: "22 Fishing Cr.",
                city: "Brampton",
                country: "Canada",
                birthDate: "August 12, 1991",
                isFavorite: false),
=======
                birthday: "20th May 1999",
                address: "22 Fishing Cr.",
                city: "Brampton",
                country: "Canada"
                )
>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d
    ]

    static var testStore: ContactStore = ContactStore(contacts: mockData)
}
<<<<<<< HEAD
=======

>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d
