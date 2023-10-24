//
//  File.swift
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
        Contact(firstName: "Brad",
                lastName: "Pitt"
               )
        
    ]

    static var testStore: ContactStore = ContactStore(contacts: mockData)
}
