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
            
        }
    }
}

struct CalendarDialog: View {
    @Binding var selectedDate: Date

    var body: some View {
        DatePicker("Select a Date", selection: $selectedDate, displayedComponents: .date)
            .datePickerStyle(GraphicalDatePickerStyle())
            .labelsHidden()
    }
}

#Preview {
    ContactDetail(contact: ContactStore.testStore.contacts[0])
}
