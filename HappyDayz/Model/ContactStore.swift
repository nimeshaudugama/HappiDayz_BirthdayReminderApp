//
//  ContactStore.swift
//  HappyDayz
//
//  Created by Nimesha Jayathissa on 2023-10-24.
//

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
                birthday: "18th August 1991",
                address: "588 Riviera Drive",
                city: "Tampa Bay",
                country: "US"
               ),
        Contact(firstName: "Payton",
                lastName: "Manning",
                phone: "(647)123-4567",
                email: "manning@gmail.com",
                birthday: "1st Oct 1992",
                address: "55 Haverstock Cr.",
                city: "Georgetown",
                country: "Canada"
           ),
        Contact(firstName: "John",
                lastName: "Doe",
                phone: "(905)123-4567",
                email: "john@gmail.com",
                birthday: "20th Jan 1999",
                address: "55 Bristol Dr.",
                city: "Caledon",
                country: "Canada"
               ),
        Contact(firstName: "Brett",
                lastName: "Let",
                phone: "(416)123-4567",
                email: "dv@gmail.com",
                birthday: "8th Dec 2000",
                address: "69 Wellington St. West",
                city: "Toronto",
                country: "CAN"
               ),
        Contact(firstName: "Virat",
                lastName: "Kohli",
                phone: "(647)123-4567",
                email: "manning@gmail.com",
                birthday: "25th June 1996",
                address: "20 Fishing Cr.",
                city: "Brampton",
                country: "Canada"
               ),
        Contact(firstName: "Rohit",
                lastName: "Sharma",
                phone: "(647)123-4567",
                email: "sharma@gmail.com",
                birthday: "20th May 1999",
                address: "22 Fishing Cr.",
                city: "Brampton",
                country: "Canada"
                )
    ]

    static var testStore: ContactStore = ContactStore(contacts: mockData)
}

