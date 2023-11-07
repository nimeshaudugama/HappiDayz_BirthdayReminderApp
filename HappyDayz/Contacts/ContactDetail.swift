//
//  ContactDetail.swift
//  HappyDayz
//
//  Created by Nimesha Jayathissa on 2023-10-24.
//

import SwiftUI

struct ContactDetail: View {
    @State private var selectedDate = Date()
    @State private var isEditing = true
    @State private var birthdayNotes = ""
    let contactStore: ContactStore
    @State private var contact: Contact
    
    init(contact: Contact, contactStore: ContactStore) {
        self._contact = State(initialValue: contact)
        self.contactStore = contactStore
        loadNote()
    }
    
    func loadNote() {
            birthdayNotes = contact.birthdayNotes
        }

    func saveNote() {
           contact.birthdayNotes = birthdayNotes
           contact.savedBirthdayNotes = birthdayNotes
           contactStore.updateContact(contact)
       }
    
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
                    Divider()
                    //                                      Text("Birthday Notes:")
                    //                                          .frame(alignment: .leading)
                    //                                          .padding()
                    //                                      TextEditor(text: $birthdayNotes)
                    //                                          .frame(minHeight: 100) // Adjust the height as needed
                    //                                          .border(Color.gray, width: 1)
                    //                                          .padding()
                    //
                    //                                      Button("Save") {
                    //                                          // Save the birthdayNotes to your data model or do something with it
                    //                                          //contact.birthdayNotes = birthdayNotes
                    //
                    //                                          print("Saving birthday notes:", birthdayNotes)
                    //                                          saveNote()
                    //                                      }
                    //                                      .padding()
                    //                                  }
                    //
                    //
                    //                }
                    
                    
                    if contact.savedBirthdayNotes.isEmpty {
                                      Text("Birthday Notes:")
                                          .frame(alignment: .leading)
                                          .padding()
                                      TextEditor(text: $birthdayNotes)
                                          .frame(minHeight: 100)
                                          .border(Color.gray, width: 1)
                                          .padding()
                                  } else {
                                      Text("Saved Birthday Notes:")
                                          .frame(alignment: .leading)
                                          .padding()
                                      Text(contact.savedBirthdayNotes)
                                          .frame(minHeight: 100)
                                          .border(Color.gray, width: 1)
                                          .padding()
                                  }
                
                        Button("Save") {
                            saveNote()
                        }
                        .padding()
                    }
                }}
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
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
    
    //#Preview {
    //    ContactDetail(contact: ContactStore.testStore.contacts[0])
    //}
    
    
    struct ContactDetail_Previews: PreviewProvider {
        static var previews: some View {
            let testStore = ContactStore() // Create an instance of your ContactStore
            return ContactDetail(contact: testStore.contacts[0], contactStore: testStore)
        }
    }

