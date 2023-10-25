<<<<<<< HEAD
import SwiftUI

struct ContactDetail: View {
    let contact: Contact
    
    var body: some View {
        //TODO: Complete detail view
        
        
        VStack(spacing: 5){
            
            HStack(spacing: 10){
                Text(contact.fullName)
                    .bold()
                    .font(.system(size: 30))
                    .foregroundStyle(.black)
        
                if contact.isFavorite{
                    Image(systemName: "star.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.yellow)
                    
                }else{
                    Image(systemName: "star")
                }
            }
            VStack{
                Divider()
                HStack{
                    Text("Phone Number: ")
                    .bold()
                    .foregroundStyle(.black)
                    Text(contact.phone)
                        .foregroundStyle(.gray)
                    }
                
                Divider()
                
                HStack{
                    Text("Email:")
                    .foregroundStyle(.black)
                    .bold()
                    Text(contact.email)
                        .foregroundStyle(.gray)
                    }
                
                Divider()
                
                HStack{
                    Text("Birthday:")
                    .foregroundStyle(.black)
                    .bold()
                    Text(contact.birthDate)
                        .foregroundStyle(.gray)
                    }
               
                Divider()
            }
            
            Spacer()
                
=======
//
//  ContactDetail.swift
//  HappyDayz
//
//  Created by Nimesha Jayathissa on 2023-10-24.
//

import SwiftUI

struct ContactDetail: View {
    @State private var selectedDate = Date()
    let contact: Contact
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                HStack {
                    Text(contact.firstName)
                        .font(.system(size: 30, weight: .bold))
                    
                    Text(contact.lastName)
                        .font(.system(size: 30, weight: .bold))
                }
                VStack(alignment: .leading) {
                    Divider()
                    HStack {
                        Text("Phone:")
                            .frame(alignment: .leading)
                            .padding()
                        Text(contact.phone)
                            .padding()
                            .foregroundColor(.gray)
                    }
                    Divider()
                    HStack {
                        Text("Email:")
                            .frame(alignment: .leading)
                            .padding()
                        Text(contact.email)
                            .padding()
                            .foregroundColor(.gray)
                    }
                    Divider()
                    HStack {
                        Text("Address:")
                            .frame(alignment: .leading)
                            .padding()
                        Text(contact.address + ",")
                            .foregroundColor(.gray)
                        Text(contact.city + ",")
                            .foregroundColor(.gray)
                        Text(contact.country)
                            .foregroundColor(.gray)
                    }
                    Divider()
                    NavigationLink(destination: CalendarDialog(selectedDate: $selectedDate)) {
                        Text("Birthday:")
                            .frame(alignment: .leading)
                            .padding()
                        Text(contact.birthday)
                            .foregroundColor(.gray)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d
        }
    }
}

<<<<<<< HEAD
=======
struct CalendarDialog: View {
    @Binding var selectedDate: Date

    var body: some View {
        DatePicker("Select a Date", selection: $selectedDate, displayedComponents: .date)
            .datePickerStyle(GraphicalDatePickerStyle())
            .labelsHidden()
    }
}

>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d
#Preview {
    ContactDetail(contact: ContactStore.testStore.contacts[0])
}
