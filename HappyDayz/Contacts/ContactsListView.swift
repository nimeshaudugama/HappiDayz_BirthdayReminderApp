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
    
    var body: some View {
        NavigationStack {
           
            
            List {
                ForEach(viewModel.listData) { contact in
                    ContactRow(contact: contact)
                    
                }
              
                
                
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
            .onChange(of: viewModel.searchTerm)
            {
                viewModel.filterSearchResults()
            }
            
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
    
    


}
    
    
    #Preview {
        ContactsListView(viewModel: ContactsListViewModel())
        
    }
    

