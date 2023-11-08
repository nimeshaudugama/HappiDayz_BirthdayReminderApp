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
            
            .toolbar{
                HStack{
                    Button("Add"){
                        makeContact()
                    }
                    
                    Spacer()
                    EditButton()
                }
            }
        }

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
    
    func moveContact(from: IndexSet, to: Int){
        withAnimation{
            viewModel.moveContacts(from: from, to: to)
        }
    }
}
    
    



    
    
    #Preview {
        ContactsListView(viewModel: ContactsListViewModel())
        
    }
    

