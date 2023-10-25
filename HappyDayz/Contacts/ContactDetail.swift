//
//  ContactDetail.swift
//  HappyDayz
//
//  Created by Nimesha Jayathissa on 2023-10-24.
//

import SwiftUI

struct ContactDetail: View {
    @State private var isCalendarPresented = false
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
                    HStack {
                        Text("Birthday:")
                            .frame(alignment: .leading)
                            .padding()
                        Button(action: {
                            // Show the calendar dialog when the button is tapped
                            isCalendarPresented.toggle()
                        }) {
                            Text(contact.birthday)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .sheet(isPresented: $isCalendarPresented) {
                // Present your calendar dialog here
                CalendarDialog(selectedDate: $selectedDate)
            }
//            .navigationTitle("Contact Details")
//            .navigationBarItems(leading: Button("Back") {
//                // Handle the action to go back
//                isCalendarPresented.toggle() // Close the calendar dialog
//            })
        }
    }
}

struct CalendarDialog: View {
    @Binding var selectedDate: Date

    var body: some View {
        NavigationView {
            DatePicker("Select a Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .labelsHidden()
                .navigationTitle("Contact Details")
                .navigationBarItems(leading: Button("Back") {
                    
                    // Handle the action to go back
                })
        }
    }
}

// Usage:
// ContactDetail(contact: ContactStore.testStore.contacts[0])


#Preview {
    ContactDetail(contact: ContactStore.testStore.contacts[0])
}
