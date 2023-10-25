//
//  ContactRow.swift
//  HappyDayz
//
//  Created by Nimesha Jayathissa on 2023-10-24.
//

import SwiftUI

struct ContactRow: View {
    let contact: Contact
    var body: some View {
        
        NavigationLink(destination: ContactDetail(contact: contact)){
            
            HStack{
               
                Text(contact.firstName)
                    .font(.system(size: 20, weight: .bold))
                Text(contact.lastName)
                    .font(.system(size: 20, weight: .bold))
                
                
                
                Spacer()

                
            }
            
            
        }
                       
        
       
    }
}

#Preview {
    ContactRow(contact: ContactStore.testStore.contacts[1])
}

