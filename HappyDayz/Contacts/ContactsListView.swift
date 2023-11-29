//
//  ContactsListView.swift
//  HappyDayz
//
//  Created by Nimesha Jayathissa on 2023-10-24.
//

import SwiftUI

/// Contact list view
struct ContactsListView: View {
    @State var viewModel: ContactsListViewModel
    @State private var isSortAscending = true
    @State private var isSettingsPresented = false
    
    var body: some View {
        NavigationStack {
           
            
            List {
                ForEach(viewModel.listData) { contact in
                    ContactRow(contact: contact, contactStore: viewModel.store)
                    
                }
                
                .onMove(perform: moveContact)
                .onDelete(perform: deleteContact)
              
                
                
                HStack{
                    Spacer()
                    Text(viewModel.displayCount)
                        .foregroundColor(.gray)
                    Spacer()
                    
                }
            }
            .navigationTitle(viewModel.navTitle)
            .searchable(text: $viewModel.searchTerm,placement: .navigationBarDrawer (displayMode:
                    .automatic), prompt: "Search for Contacts")
            .navigationBarItems(trailing: settingsButton)
            .navigationTitle("Settings")
            .sheet(isPresented: $isSettingsPresented) {
                ReminderView()
            }
            .onChange(of: viewModel.searchTerm)
            {
                viewModel.filterSearchResults()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: deleteAllContacts) {
                        Image(systemName: "trash.fill")
                            .imageScale(.large)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        makeContact()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Sort") {
                        toggleSortingOrder()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }

    }
                
            
        
    func sortContacts() {
        if isSortAscending {
            viewModel.store.contacts.sort { (contact1: Contact, contact2: Contact) in
                return contact1.firstName < contact2.firstName
            }
        } else {
            viewModel.store.contacts.sort { (contact1: Contact, contact2: Contact) in
                return contact1.firstName > contact2.firstName
            }
        }
    }




        
        // Step 4: Toggle the sorting order
        func toggleSortingOrder() {
            isSortAscending.toggle()
            sortContacts()
        }
    
    var settingsButton: some View {
        Button("Settings") {
            isSettingsPresented = true
        }
    }
    
    
    func makeContact(){
        withAnimation{
            guard let randomContact = viewModel.store.contacts.randomElement() else {
                return
            }
            viewModel.makeContact(contact: randomContact)
        }
    }
    
    func deleteContact(offsets: IndexSet){
        withAnimation{
            viewModel.deleteContact(offset: offsets)
        }
    }
    
    func deleteAllContacts() {
        withAnimation {
            viewModel.store.contacts.removeAll()
        }
    }
    
    func moveContact(from: IndexSet, to: Int){
        withAnimation{
            viewModel.moveContacts(from: from, to: to)
        }
    }
}
    





    
    
    #Preview {
        ContactsListView(viewModel: ContactsListViewModel())
        
    }
    

