<<<<<<< HEAD
=======
//
//  ContactRow.swift
//  HappyDayz
//
//  Created by Nimesha Jayathissa on 2023-10-24.
//

>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d
import SwiftUI

struct ContactRow: View {
    let contact: Contact
    var body: some View {
<<<<<<< HEAD
        //TODO: replace below with contact row
        
        NavigationLink(destination: ContactDetail(contact: contact)){
            HStack{
                Text(contact.fullName)
                    .bold()
                    .foregroundStyle(.black)
                
                Spacer()
                
                if contact.isFavorite{
                    Image(systemName: "star.fill")
                        .font(.headline)
                        .foregroundColor(.yellow)
                        
                }

            }
//            if contact.isFavorite{
//                Image(systemName: "star.fill")
//                    .font(.headline)
//                    .foregroundColor(.yellow)
//
//            }
        }
=======
        
        NavigationLink(destination: ContactDetail(contact: contact)){
            
            HStack{
               
                Text(contact.firstName)
                    .font(.system(size: 20, weight: .bold))
                Text(contact.lastName)
                    .font(.system(size: 20, weight: .bold))
                
                
                
                Spacer()

                
            }
            
            
        }
                       
        
       
>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d
    }
}

#Preview {
<<<<<<< HEAD
    ContactRow(contact: ContactStore.testStore.contacts[0])
}
=======
    ContactRow(contact: ContactStore.testStore.contacts[1])
}

>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d
