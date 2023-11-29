//
//  ContactRow.swift
//  HappyDayz
//
//  Created by Nimesha Jayathissa on 2023-10-24.
//

import SwiftUI

struct ContactRow: View {
    let contact: Contact
    let contactStore: ContactStore
    
    
    init(contact: Contact, contactStore: ContactStore) {
        self.contact = contact
        self.contactStore = contactStore
    }
    
    var body: some View {
        
        NavigationLink(destination: ContactDetail(contact: contact, contactStore: contactStore)) {
            VStack{
                HStack{
                    
                    Text(contact.firstName)
                        .font(.system(size: 20, weight: .bold))
                    Text(contact.lastName)
                        .font(.system(size: 20, weight: .bold))
                    
                    
                    
                    Spacer()
                    
                    
                }
                
                HStack{
                    
                    Text(contact.nickName)
                        .font(.system(size: 15, weight: .light))
                    
                    Spacer()
                    
                    
                }
                
                
            }
        }
    }
    
    struct ContactRow_Previews: PreviewProvider {
        static var previews: some View {
            let testStore = ContactStore() // Create an instance of your ContactStore
            return ContactRow(contact: testStore.contacts[1], contactStore: testStore)
        }
        
    }}
